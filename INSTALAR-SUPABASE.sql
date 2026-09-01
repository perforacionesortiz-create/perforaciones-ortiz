-- Perforaciones Ortiz · V27 Prueba 61
-- Estructura inicial para usuarios, roles y datos compartidos.

create extension if not exists pgcrypto;

create type public.po_role as enum ('admin', 'tecnico');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  nombre text not null default '',
  role public.po_role not null default 'tecnico',
  activo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.clients (
  id uuid primary key default gen_random_uuid(),
  codigo integer unique,
  nombre text not null,
  datos jsonb not null default '{}'::jsonb,
  created_by uuid references public.profiles(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.locations (
  id uuid primary key default gen_random_uuid(),
  client_id uuid references public.clients(id) on delete cascade,
  codigo text,
  nombre text not null,
  localidad text,
  direccion text,
  gps text,
  datos jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.supplies (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique,
  activo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.pumps (
  id uuid primary key default gen_random_uuid(),
  numero text not null,
  client_id uuid references public.clients(id),
  location_id uuid references public.locations(id),
  datos jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.works (
  id uuid primary key default gen_random_uuid(),
  codigo text,
  fecha date not null,
  tipo text not null,
  client_id uuid references public.clients(id),
  location_id uuid references public.locations(id),
  technician_id uuid references public.profiles(id),
  prioridad text,
  observaciones text,
  datos jsonb not null default '{}'::jsonb,
  created_by uuid not null references public.profiles(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.work_pumps (
  id uuid primary key default gen_random_uuid(),
  work_id uuid not null references public.works(id) on delete cascade,
  pump_id uuid references public.pumps(id),
  numero text,
  datos jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.work_pump_supplies (
  id uuid primary key default gen_random_uuid(),
  work_pump_id uuid not null references public.work_pumps(id) on delete cascade,
  supply_id uuid not null references public.supplies(id),
  cantidad numeric not null default 1,
  unique(work_pump_id, supply_id)
);

create table public.pump_test_measurements (
  id uuid primary key default gen_random_uuid(),
  work_id uuid not null references public.works(id) on delete cascade,
  numero smallint not null check (numero between 1 and 5),
  caudal numeric,
  nivel_dinamico numeric,
  observaciones text,
  unique(work_id, numero)
);

create table public.work_photos (
  id uuid primary key default gen_random_uuid(),
  work_id uuid not null references public.works(id) on delete cascade,
  storage_path text not null,
  nombre text,
  created_at timestamptz not null default now()
);

create or replace function public.po_is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'admin' and activo
  );
$$;

create or replace function public.po_is_active()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and activo
  );
$$;

create or replace function public.po_new_user_profile()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  first_role public.po_role;
begin
  if not exists (select 1 from public.profiles) then
    first_role := 'admin';
  else
    first_role := 'tecnico';
  end if;

  insert into public.profiles (id, nombre, role)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'nombre', split_part(coalesce(new.email, ''), '@', 1)),
    first_role
  );
  return new;
end;
$$;

drop trigger if exists po_auth_user_created on auth.users;
create trigger po_auth_user_created
after insert on auth.users
for each row execute procedure public.po_new_user_profile();

alter table public.profiles enable row level security;
alter table public.clients enable row level security;
alter table public.locations enable row level security;
alter table public.supplies enable row level security;
alter table public.pumps enable row level security;
alter table public.works enable row level security;
alter table public.work_pumps enable row level security;
alter table public.work_pump_supplies enable row level security;
alter table public.pump_test_measurements enable row level security;
alter table public.work_photos enable row level security;

create policy "Perfiles visibles para usuarios activos" on public.profiles
for select to authenticated
using (activo and public.po_is_active());
create policy "Administracion gestiona perfiles" on public.profiles
for all to authenticated using (public.po_is_admin()) with check (public.po_is_admin());

create policy "Usuarios activos leen clientes" on public.clients for select to authenticated
using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Usuarios activos crean clientes" on public.clients for insert to authenticated
with check (created_by=auth.uid());
create policy "Administracion modifica clientes" on public.clients for update to authenticated
using (public.po_is_admin()) with check (public.po_is_admin());
create policy "Administracion elimina clientes" on public.clients for delete to authenticated
using (public.po_is_admin());

create policy "Usuarios activos leen lugares" on public.locations for select to authenticated
using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Usuarios activos crean lugares" on public.locations for insert to authenticated
with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Administracion modifica lugares" on public.locations for update to authenticated
using (public.po_is_admin()) with check (public.po_is_admin());
create policy "Administracion elimina lugares" on public.locations for delete to authenticated
using (public.po_is_admin());

create policy "Usuarios activos leen insumos" on public.supplies for select to authenticated
using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Administracion gestiona insumos" on public.supplies for all to authenticated
using (public.po_is_admin()) with check (public.po_is_admin());

create policy "Usuarios activos leen bombas" on public.pumps for select to authenticated
using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Usuarios activos crean bombas" on public.pumps for insert to authenticated
with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Usuarios activos actualizan bombas" on public.pumps for update to authenticated
using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo))
with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Administracion elimina bombas" on public.pumps for delete to authenticated
using (public.po_is_admin());

create policy "Usuarios activos leen trabajos" on public.works for select to authenticated
using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.activo));
create policy "Tecnicos crean sus trabajos" on public.works for insert to authenticated
with check (created_by=auth.uid() and (technician_id=auth.uid() or public.po_is_admin()));
create policy "Tecnicos actualizan sus trabajos" on public.works for update to authenticated
using (created_by=auth.uid() or technician_id=auth.uid() or public.po_is_admin())
with check (created_by=auth.uid() or technician_id=auth.uid() or public.po_is_admin());
create policy "Administracion elimina trabajos" on public.works for delete to authenticated
using (public.po_is_admin());

create policy "Usuarios leen bombas de trabajos" on public.work_pumps for select to authenticated using (true);
create policy "Usuarios gestionan bombas de sus trabajos" on public.work_pumps for all to authenticated
using (exists (select 1 from public.works w where w.id=work_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())))
with check (exists (select 1 from public.works w where w.id=work_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())));

create policy "Usuarios leen insumos de trabajos" on public.work_pump_supplies for select to authenticated using (true);
create policy "Usuarios gestionan insumos de sus trabajos" on public.work_pump_supplies for all to authenticated
using (exists (select 1 from public.work_pumps wp join public.works w on w.id=wp.work_id where wp.id=work_pump_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())))
with check (exists (select 1 from public.work_pumps wp join public.works w on w.id=wp.work_id where wp.id=work_pump_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())));

create policy "Usuarios leen mediciones" on public.pump_test_measurements for select to authenticated using (true);
create policy "Usuarios gestionan mediciones de sus trabajos" on public.pump_test_measurements for all to authenticated
using (exists (select 1 from public.works w where w.id=work_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())))
with check (exists (select 1 from public.works w where w.id=work_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())));

create policy "Usuarios leen fotos" on public.work_photos for select to authenticated using (true);
create policy "Usuarios gestionan fotos de sus trabajos" on public.work_photos for all to authenticated
using (exists (select 1 from public.works w where w.id=work_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())))
with check (exists (select 1 from public.works w where w.id=work_id and (w.created_by=auth.uid() or w.technician_id=auth.uid() or public.po_is_admin())));

insert into storage.buckets (id, name, public)
values ('trabajos-fotos', 'trabajos-fotos', false)
on conflict (id) do nothing;

create policy "Usuarios autenticados leen fotos del bucket" on storage.objects
for select to authenticated using (bucket_id='trabajos-fotos');
create policy "Usuarios autenticados cargan fotos" on storage.objects
for insert to authenticated with check (bucket_id='trabajos-fotos');
create policy "Administracion elimina fotos del bucket" on storage.objects
for delete to authenticated using (bucket_id='trabajos-fotos' and public.po_is_admin());

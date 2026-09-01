-- Perforaciones Ortiz · activa el estado compartido de la aplicación actual.

create table public.app_state (
  id smallint primary key default 1 check (id = 1),
  data jsonb not null default '{"clients":[{"id":1,"name":"Cliente Ocasional","obs":""}],"pumps":[],"works":[]}'::jsonb,
  updated_by uuid references public.profiles(id),
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

create policy "Usuarios activos leen datos compartidos" on public.app_state
for select to authenticated using (public.po_is_active());

create policy "Usuarios activos sincronizan datos" on public.app_state
for update to authenticated
using (public.po_is_active())
with check (public.po_is_active() and updated_by = auth.uid());

insert into public.app_state (id) values (1) on conflict (id) do nothing;

alter publication supabase_realtime add table public.app_state;


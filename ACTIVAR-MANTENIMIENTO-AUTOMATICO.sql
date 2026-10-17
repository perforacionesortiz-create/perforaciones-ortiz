-- Perforaciones Ortiz - actividad diaria para evitar pausas por inactividad.
-- Ejecutar una sola vez en Supabase > SQL Editor.

create table if not exists public.project_heartbeat (
  day date primary key,
  source text not null check (source = 'vercel-cron'),
  touched_at timestamptz not null default now()
);

alter table public.project_heartbeat enable row level security;

drop policy if exists "Cron inserta actividad diaria" on public.project_heartbeat;
create policy "Cron inserta actividad diaria"
on public.project_heartbeat for insert to anon
with check (day = current_date and source = 'vercel-cron');

drop policy if exists "Cron actualiza actividad diaria" on public.project_heartbeat;
create policy "Cron actualiza actividad diaria"
on public.project_heartbeat for update to anon
using (day = current_date and source = 'vercel-cron')
with check (day = current_date and source = 'vercel-cron');

drop policy if exists "Cron consulta actividad diaria" on public.project_heartbeat;
create policy "Cron consulta actividad diaria"
on public.project_heartbeat for select to anon
using (day = current_date and source = 'vercel-cron');

grant select, insert, update on public.project_heartbeat to anon;
revoke delete, truncate, references, trigger on public.project_heartbeat from anon;

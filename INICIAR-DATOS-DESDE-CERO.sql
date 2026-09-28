-- Perforaciones Ortiz - iniciar los datos operativos desde cero.
-- Elimina trabajos, bombas, clientes, lugares y mantenimientos.
-- Conserva usuarios, contraseñas, perfiles, permisos, configuración e insumos.
-- Antes de ejecutarlo, descargue también una copia desde la propia aplicación.

begin;

-- Copia recuperable del estado actual dentro de la base de datos.
drop table if exists public.app_state_respaldo_antes_del_inicio;
create table public.app_state_respaldo_antes_del_inicio as
select * from public.app_state;

-- Vacía solamente los datos operativos del estado compartido.
-- jsonb_set conserva el catálogo actual de insumos y cualquier otra configuración.
update public.app_state
set data = jsonb_set(
             jsonb_set(
               jsonb_set(
                 jsonb_set(data, '{clients}', '[{"id":1,"name":"Cliente Ocasional","obs":""}]'::jsonb, true),
                 '{pumps}', '[]'::jsonb, true
               ),
               '{works}', '[]'::jsonb, true
             ),
             '{maintenanceRecords}', '[]'::jsonb, true
           ),
updated_by = null,
updated_at = now()
where id = 1;

-- Limpia las tablas operativas antiguas, si contienen información.
delete from public.work_photos;
delete from public.pump_test_measurements;
delete from public.work_pump_supplies;
delete from public.work_pumps;
delete from public.works;
delete from public.pumps;
delete from public.locations;
delete from public.clients;

commit;

-- IMPORTANTE: los archivos se eliminan aparte desde
-- Supabase > Storage > trabajos-fotos.

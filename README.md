# Perforaciones Ortiz — V27 Prueba 64 conectada

## Cambios de la Prueba 64

- Cantidad de bombas con botones grandes para usar desde el celular.
- En los tres trabajos de perforación se muestran seis controles de mantenimiento obligatorios.
- Es obligatorio completar los seis controles y adjuntar una foto y un video antes de guardar.

## Versión móvil instalable

Esta versión está preparada para instalarse en Android y iPhone desde una dirección web segura (HTTPS). Todos los equipos utilizan los mismos usuarios, permisos y datos almacenados en Supabase.

### Android

1. Abrir la dirección publicada con Chrome.
2. Tocar el menú de tres puntos.
3. Elegir **Instalar aplicación** o **Agregar a pantalla principal**.

### iPhone

1. Abrir la dirección publicada con Safari.
2. Tocar **Compartir**.
3. Elegir **Agregar a inicio**.

La aplicación local de una computadora no puede instalarse en otros celulares. Primero se debe publicar esta carpeta en una dirección HTTPS.

## Nombre y configuración de impresión

- El Excel y el PDF se guardan como `Ensayo de bombeo (Nombre del cliente) dd-mm-aaaa`.
- El Excel está configurado en papel A4 vertical.
- El área de impresión es una sola página, con márgenes reducidos para hoja membretada.
- Se mantiene la fórmula de caudal específico y las cinco mediciones.

## Cuadro ancho y transparente

- El cuadro ocupa casi todo el ancho de la hoja.
- Las celdas no tienen fondo blanco ni celeste.
- Se imprimen solamente las líneas y los textos sobre el membrete.
- La imagen de la perforadora permanece visible detrás del cuadro.

## Ancho intermedio del cuadro del ensayo

- El recuadro es más ancho que en la Prueba 54.
- Las columnas tienen más espacio para los valores y observaciones.
- Se conserva un margen antes de la ilustración del membrete.

## PDF del ensayo ajustado al membrete

- El cuadro del ensayo es más angosto.
- Toda la información queda en la zona blanca izquierda.
- La tabla ya no cubre la ilustración vertical de la perforadora.

## Excel y PDF automáticos del ensayo

La exportación de un **Ensayo de bombeo** crea directamente dos archivos, sin macros ni botones dentro de Excel:

1. Un Excel normal `.xlsx`, completado y preparado para imprimir.
2. Un PDF `.pdf` sobre la hoja membretada, listo para imprimir.

Ambos archivos llevan el nombre del cliente y la fecha del ensayo. Si el navegador lo solicita, hay que permitir la descarga de varios archivos.

## Excel membretado para ensayos de bombeo

En un trabajo **Ensayo de bombeo**, el botón **Crear Excel y PDF membretado** completa automáticamente la plantilla incluida con cliente, fecha, lugar, técnico, datos de la perforación, coordenadas y las cinco mediciones.

El Excel conserva el logo, el formato y la fórmula de caudal específico. El PDF se crea al mismo tiempo y utiliza la hoja membretada de Perforaciones Ortiz.

## Ensayo de bombeo

- Cada una de las cinco mediciones incluye **Caudal**, **Nivel dinámico** y **Observaciones**.
- Los tres campos se presentan en columnas alineadas en computadoras.
- En teléfonos se acomodan verticalmente para facilitar la carga.
- Las observaciones de cada medición se guardan y aparecen en la consulta y en los PDF completos.

## Ícono de Inicio de la Prueba 49

- El acceso **Inicio** utiliza ahora el símbolo de la perforadora con los colores invertidos.
- El fondo es azul y el contorno del símbolo es blanco.
- Se reemplazó únicamente el ícono de Inicio; los demás accesos permanecen sin cambios.

## Colores y navegación de la Prueba 48

- Los paneles amarillos y textos marrones ahora utilizan celeste y azul.
- La portada también usa la nueva combinación celeste.
- La barra inferior incorpora los íconos nuevos de Inicio, Nuevo trabajo, Bombas y Trabajos.
- Los íconos inferiores son más grandes y fáciles de identificar.

## Ícono de Clientes de la Prueba 47

- Se incorporó el nuevo ícono azul de clientes en el acceso **Clientes** de la portada.
- El archivo del ícono está incluido dentro de la aplicación para funcionar sin conexión y en otras computadoras.

## Íconos de la Prueba 46

- Se agregó un ícono azul original de operario, engranaje y herramienta en **Nuevo trabajo**.
- Los íconos de **Bombas** y **Trabajos** ahora utilizan el mismo azul.
- Se eliminó el color marrón de los accesos principales para mantener una identidad visual uniforme.

## Nueva portada de la Prueba 45

- Se incorporó el logo original de Perforaciones Ortiz en el encabezado y la portada.
- Se agregó el logo naranja de la bomba en el acceso **Bombas**.
- Se agregó el logo naranja del engranaje con herramientas en el acceso **Trabajos**.
- La pantalla inicial tiene una presentación más visual y se adapta a computadoras, tablets y teléfonos.

## Corrección de la Prueba 44

- Los PDF de trabajos se guardan como **Trabajos Nombre del cliente DD-MM-AAAA.pdf**.
- La fecha utilizada es la fecha del día en que se genera el archivo.
- El nombre se aplica al formato resumido, completo y con hoja membretada.
- Si el PDF reúne trabajos de más de un cliente, se guarda como **Trabajos Varios clientes DD-MM-AAAA.pdf**.

## Corrección de la Prueba 43

- El PDF completo en hoja membretada utiliza una columna de texto más angosta.
- Se redujo ligeramente el tamaño del texto y la separación entre renglones.
- Se reservó una zona inferior mayor para no tapar los datos de contacto del membrete.
- Los textos largos se dividen automáticamente antes de alcanzar la ilustración central.

## Corrección de la Prueba 42

- La opción **Incluir datos completos de cada bomba** ahora se activa de forma visible y se respeta al crear el PDF.
- El modo completo incorpora los datos generales, técnicos, ubicación, insumos y cantidades, datos de la bomba, observaciones, prioridad y cantidad de fotos.
- El modo resumido conserva el formato compacto de hasta cuatro trabajos por hoja.
- El modo completo pagina automáticamente cuando la información no entra en una sola hoja.

Cambios incorporados:
- PDF de bomba: corrección de posiciones, número de bomba y tipografía más grande.
- Fechas visibles en formato DD/MM/AAAA.
- Informes de trabajo en PDF con la hoja membretada enviada.
- Impresión configurada para hoja membretada física: el membrete no se vuelve a imprimir.
- Trabajos ordenados del más reciente al más antiguo.
- Lista de trabajos compacta: Fecha — Cliente — Tipo de trabajo.
- Filtros de trabajos por cliente y por mes.
- Botones de PDF/Excel/selección en disposición vertical.
- Campo “Insumos utilizados” en la carga, detalle, PDF y Excel.
- Trabajos de instalación/desmontaje/reparación admiten cantidad de bombas.
- Cada bomba del mismo trabajo puede marcarse como existente o nueva y cargar todos sus datos.
- Un trabajo con varias bombas guarda un snapshot independiente de cada bomba.
- Historial de bombas reconoce trabajos con múltiples bombas.

- Prueba 5: corrección de posiciones en planilla de control, orden del PDF de instalación, y opción por bomba para cargar todos los datos o solo número + ubicación.

- Prueba 6: ajustes finos de posiciones en la planilla de control (cliente, campaña, ubicación, número de bomba y componentes).

- Prueba 7: incluye físicamente `planilla-control.jpeg` y `hoja-membretada.jpeg` dentro del paquete para corregir el error “No se pudo crear la planilla PDF”.


## V27 Prueba 8
- Fecha de la ficha de bomba en los tres cuadros superiores derechos (día / mes / año).
- Número de bomba reubicado dentro de su casillero.
- Nombre del PDF: `Bomba <número> <cliente>.pdf`.
- Eliminada la repetición visual de “Bomba <número>” en la ficha de bomba.


## V27 Prueba 9
- Eliminada la repetición del nombre de la bomba en la ficha (ahora no aparece 3 veces).
- Fecha de la planilla en los 3 cuadros superiores, compatible con fechas en formato AAAA-MM-DD y DD/MM/AAAA.
- Número de bomba reubicado en su renglón para que no se superponga con la fila de caños.
- Nombre del archivo PDF: `<numero> <cliente>.pdf`.


## V27 Prueba 10
- Ubicación más arriba y a la derecha, después del título UBICACIÓN.
- Número de bomba más arriba y a la izquierda.
- Cámaras, caños, soporte, cabezal, varilla, manguito y otros más arriba.
- Día, mes y año con igual tamaño y centrados en los tres recuadros superiores.
- El archivo se guarda como `Bomba <número> <cliente>.pdf`.


## V27 Prueba 11
- Cliente un poco más a la izquierda.
- Campaña más arriba y a la derecha.
- Ubicación más arriba y a la derecha, alineada con Campaña.
- Soporte y Cabezal apenas a la izquierda para mejorar el centrado.
- Fecha y resto de campos sin cambios.


## V27 Prueba 13
- Cliente más arriba y más a la izquierda.
- Campaña más arriba.
- Ubicación más arriba.
- Varilla sup., Manguito y Otros desplazados levemente a la izquierda.
- Observaciones comienzan más abajo.
- Se mantienen sin cambios fecha, número de bomba, soporte, cabezal y el nombre del PDF.


## V27 Prueba 14
- Cliente, campaña y ubicación bajados levemente.


## V27 Prueba 15
- Se incluye nuevamente `planilla-control.jpeg` para corregir la generación de la planilla PDF.
- Se mantienen exactamente el diseño y las posiciones de la Prueba 14.
- El archivo conserva el nombre `Bomba <número> <cliente>.pdf`.


## V27 Prueba 16
- Se incluye `hoja-membretada.jpeg` para corregir la creación de los PDF de informes y trabajos.
- Los informes y trabajos se generan sobre la hoja membretada proporcionada.
- La planilla de control y el resto de la aplicación se mantienen sin cambios.


## V27 Prueba 17
- La opción `Imprimir en hoja membretada` ajusta el informe completo a una sola página A4.
- Se compactaron únicamente los márgenes, separaciones y firmas del modo de impresión en hoja membretada.
- La creación de PDF y la planilla de control se mantienen sin cambios.


## V27 Prueba 18
- Se eliminaron del informe las líneas `Firma del cliente` y `Firma del técnico`.
- El contenido de `Imprimir en hoja membretada` comienza más arriba.
- Se mantiene el formato compacto de una sola página A4.


## V27 Prueba 19
- Se reforzó la eliminación de las firmas tanto en el contenido como al iniciar la impresión.
- Se desplazó toda la impresión 20 mm hacia arriba.
- La hoja A4 se imprime sin margen de página reservado para maximizar el espacio disponible.


## V27 Prueba 20
- Se elimina automáticamente la versión antigua guardada por el navegador.
- Las firmas quedan eliminadas definitivamente y el informe conserva el ajuste de una sola hoja.
- La hoja membretada ya no contiene el ícono/cuadrado de escaneo inferior derecho.
- La aplicación muestra `Prueba 20` en el encabezado para confirmar que se abrió la versión correcta.


## V27 Prueba 21
- Se eliminó la opción `Imprimir en hoja membretada`.
- Se eliminó el botón duplicado `Crear PDF`.
- En el detalle del trabajo queda una sola fila con `Crear PDF` e `Imprimir`.


## V27 Prueba 22
- Cada cliente recibe un código numérico automático y visible.
- Se pueden importar clientes y sus datos desde Excel, CSV o XLS.
- La importación reconoce las columnas Cod/Código, Cliente/Nombre, CUIT, teléfono, correo, localidad, dirección y observaciones.
- Se agregó la opción de eliminar clientes sin bombas ni trabajos asociados.


## V27 Prueba 23
- El filtro por mes es una lista desplegable con los meses disponibles.
- Las acciones de selección, PDF y Excel aparecen verticalmente a la derecha.
- Los trabajos se muestran como `MM/DD/AA — código cliente — cliente — trabajo`.
- Los trabajos continúan ordenados del más reciente al más antiguo.


## V27 Prueba 24
- La fecha de la lista de trabajos se muestra como `DD/MM/AA`.


## V27 Prueba 25
- Se quitaron `Base de hormigón` y `Caño de camisa` de las opciones para trabajos nuevos.
- Se agregó `＋ Crear nuevo tipo de trabajo` dentro del panel.
- Los tipos de trabajo personalizados quedan guardados y disponibles como botones.
- Los trabajos históricos de los tipos retirados se conservan sin cambios.


## V27 Prueba 26
- Se incorporó un catálogo seleccionable de insumos.
- Se pueden agregar varios insumos a un trabajo y quitar selecciones antes de guardarlo.
- Se pueden crear insumos nuevos desde el formulario.
- Se puede importar el catálogo desde Excel, XLS o CSV usando Insumo/Nombre y opcionalmente Cod/Código y Unidad.


## V27 Prueba 27
- En trabajos con bombas, el selector de insumos aparece inmediatamente después de `Cantidad de bombas`.
- Cada insumo agregado incluye un campo para cargar la cantidad utilizada.
- Se guarda el detalle estructurado del insumo, la cantidad y su unidad.
- La importación busca columnas Insumo/Nombre en todas las hojas del Excel y admite filas de título anteriores al encabezado.

## V27 Prueba 28
- Al seleccionar un insumo se agrega automáticamente al trabajo.
- El casillero `Cantidad` aparece inmediatamente al lado de cada insumo agregado.
- Se muestra cuántos insumos hay disponibles en el catálogo.
- La importación también admite planillas simples sin encabezado: primera columna para el insumo y segunda columna opcional para la unidad.

## V27 Prueba 29
- Se corrigió la lectura de la plantilla de insumos para incorporar todas las filas de la hoja `Insumos`.
- Se ignoran hojas de instrucciones o ayuda.
- Se reconocen los encabezados Insumo, Insumos, Nombre y Descripción.
- Al finalizar se informa la cantidad importada y una muestra de los nombres cargados.

## V27 Prueba 30
- Se incorporaron directamente al catálogo los 22 insumos de `plantilla-importacion-insumos.xlsx`.
- Los insumos aparecen en el desplegable aunque el navegador no pueda procesar la importación.
- Se conservan los insumos creados manualmente y los importados anteriormente.

## V27 Prueba 31
- Se agregó el botón `Eliminar insumo` junto al catálogo.
- El insumo se puede localizar por código o por nombre completo.
- La eliminación pide confirmación y lo quita del desplegable.
- Los trabajos históricos que utilizaron el insumo se conservan sin cambios.

## V27 Prueba 32
- En Trabajos se agregó la opción para incluir o excluir los datos completos de cada bomba.
- La opción se aplica tanto a PDF como a Excel.
- Sin datos de bombas, el informe contiene únicamente tipo de trabajo, fecha, cliente, técnico, lugar e insumos con cantidades.
- La opción predeterminada es no incluir los datos completos de las bombas.

## V27 Prueba 33
- La vista previa muestra el número de cada bomba.
- Cuando un trabajo contiene varias bombas, cada bomba se presenta como un trabajo separado en el resumen.
- `Crear PDF` respeta exactamente la vista previa y no abre el generador detallado de una bomba anterior.
- El Excel usa las columnas Fecha, Código cliente, Cliente, Trabajo, Cantidad e Insumos, con una fila por insumo.

## V27 Prueba 34
- La carga de insumos se realiza dentro de cada bloque de bomba.
- Cada bomba conserva sus propios insumos y cantidades.
- Los informes pueden identificar en qué bomba se utilizó cada insumo.

## V27 Prueba 35
- El Excel genera una sola fila principal por bomba y trabajo.
- Debajo de esa fila aparecen únicamente los insumos utilizados y sus cantidades.
- Las filas de insumos conservan fecha, código de cliente, cliente y número de bomba para poder identificarlas.

## V27 Prueba 36
- Se agregó `Guardar copia de seguridad` para descargar todos los datos en un archivo JSON.
- Se agregó `Restaurar copia de seguridad` para recuperar los datos en otra computadora o versión.
- La copia incluye clientes, lugares, bombas, trabajos, insumos, cantidades, observaciones y fotos almacenadas.
- Se incluyen iniciadores para macOS y Windows dentro de la carpeta.

## V27 Prueba 37
- Se corrigió el iniciador de Windows para evitar el error `localhost rechazó la conexión`.
- Detecta automáticamente `py` o `python`, inicia el servidor y espera antes de abrir el navegador.
- Si Windows no tiene Python, abre directamente `index.html` para poder utilizar el sistema.

## V27 Prueba 38
- El iniciador de Windows ya no utiliza Python ni localhost.
- `INICIAR-WINDOWS.bat` abre directamente el sistema en el navegador.
- No se abre una terminal ni se necesita instalar ningún programa adicional.

## V27 Prueba 39
- El PDF de trabajos genera una página independiente por cada trabajo/bomba y evita cortes entre páginas.
- Se agregó `Crear PDF en hoja membretada` en la vista previa de trabajos.
- El PDF normal y el membretado respetan la información resumida visible en pantalla.
- Se agregó numeración de páginas.

## V27 Prueba 40
- El botón `Crear PDF en hoja membretada` queda fijo y visible junto a `Crear PDF`.
- Los botones detectan automáticamente la vista previa de trabajos y usan el generador correcto.
- Se evita que la vista previa vuelva a utilizar el generador anterior que capturaba toda la pantalla.

## V27 Prueba 42
- Se eliminaron los recuadros y fondos blancos del PDF membretado.
- Los datos se escriben directamente sobre la hoja membretada sin tapar su diseño.
- El PDF distribuye automáticamente cuatro trabajos por página.
- Los trabajos se separan con una línea fina y los insumos se ajustan en hasta tres renglones.

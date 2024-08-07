
# Crontab Manager

Crontab Manager es un script de Bash diseñado para facilitar la administración de cronjobs en tu Raspberry Pi. Con este script, puedes listar, agregar, editar, eliminar, activar/desactivar y validar cronjobs de manera sencilla.

## Funcionalidades

1. **Explicar Cronjobs**
   - Muestra una explicación sobre qué es un cronjob y cómo se utiliza.

2. **Listar Cronjobs**
   - Muestra todos los cronjobs actuales del usuario.

3. **Agregar un Cronjob**
   - Permite añadir un nuevo cronjob al archivo crontab.

4. **Editar un Cronjob**
   - Permite editar cronjobs existentes utilizando un editor de texto (nano).

5. **Eliminar un Cronjob**
   - Permite eliminar un cronjob existente especificando el número de línea.

6. **Activar/Desactivar un Cronjob**
   - Permite activar o desactivar un cronjob comentándolo o descomentándolo.

7. **Validar y Probar Cronjobs**
   - Muestra los cronjobs actuales y proporciona sugerencias para probarlos manualmente.

## Cómo Usar

1. Clona o descarga el repositorio en tu Raspberry Pi.
2. Navega al directorio del script:
   ```bash
   cd crontab_manager
   ```
3. Dale permisos de ejecución al script:
   ```bash
   chmod +x crontab_manager.sh
   ```
4. Ejecuta el script:
   ```bash
   ./crontab_manager.sh
   ```
5. Sigue las instrucciones del menú para gestionar tus cronjobs.

## Archivos del Proyecto

- **`crontab_manager.sh`**: El script principal que gestiona los cronjobs.
- **`README.md`**: Este archivo.
- **`edit_cronjobs.txt`**: Archivo temporal utilizado para editar cronjobs.
- **`delete_cronjobs.txt`**: Archivo temporal utilizado para eliminar cronjobs.
- **`toggle_cronjobs.txt`**: Archivo temporal utilizado para activar/desactivar cronjobs.
- **`current_cronjobs.txt`**: Archivo para listar los cronjobs actuales.
- **`new_cronjob.txt`**: Archivo para agregar nuevos cronjobs.
- **`validate_cronjobs.txt`**: Archivo para validar cronjobs.

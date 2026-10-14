# SIGMA - Sistema Integral de Gestión Alimentaria (Comedor Ludovica)
**Proyecto de Software 2026 · Grupo 04**  
*Facultad de Informática — Universidad Nacional de La Plata (UNLP)*

---

## 👥 Integrantes

| Nombre y Apellido | Correo Electrónico |
| :--- | :--- |
| Malena Bello | [Bellomalena098@gmail.com] |
| Lucas Lopez | [lopezlucas730@gmail.com] |
| Mateo Rodriguez Lares | [email] |
| Alan Contaja | [email] |
| Hector Nicolas Taha | [email] |

---

## 📖 Descripción del Proyecto

**SIGMA** es una plataforma web desarrollada para coordinar y supervisar de forma integral la distribución de viandas y raciones del Comedor del Hospital Ludovica. Optimiza el flujo de pedidos para el personal de planta y de guardia, implementa un control estricto de cupos por sector y centraliza las autorizaciones operativas.

### Funcionalidades principales (Etapa 1)
* **Autenticación y Sesiones:** Inicio de sesión seguro con almacenamiento de sesiones en el servidor y protección contra falsificación de peticiones (CSRF).
* **Administración de Usuarios:** Alta, baja lógica/bloqueo y edición de perfiles, con salvaguardas para cuentas de administración.
* **Control de Acceso basado en Roles (RBAC):** Restricción granular de vistas y acciones según el rol asignado:
  * Administrador
  * Jefe de Servicio
  * Servicio de Alimentación
  * Sector Comedor
* **Gestión de Sectores:** Configuración de áreas operativas (Guardia, Quirófano, etc.) y asignación de personal a cada una.

---

## 🛠️ Herramientas y Tecnologías

| Componente | Tecnología | Versión |
| :--- | :--- | :--- |
| **Lenguaje** | Python | 3.13 / 3.14 |
| **Framework Web** | Flask | 3.1.3 |
| **ORM** | SQLAlchemy / Flask-SQLAlchemy | 2.1.1 / 3.1.1 |
| **Motor de Base de Datos** | PostgreSQL (Driver `psycopg` 3.3.6 / `psycopg2-binary` 2.9.13) | 16+ |
| **Formularios y Validación** | WTForms / Flask-WTF | 3.2.2 / 1.3.0 |
| **Sesiones del Servidor** | Flask-Session | 0.8.0 |
| **Motor de Vistas** | Jinja2 | 3.1.6 |
| **Gestión de Entorno** | python-dotenv | 1.2.3 |
| **Empaquetado y Dependencias** | Poetry | 1.8+ |
| **Testing** | Pytest | 9.1.1 |

---

## 🚀 Guía de Instalación y Configuración

### 1. Prerrequisitos
* Tener instalado **Python 3.13** o superior.
* Tener instalado **Poetry**. En caso de no poseerlo:
```bash
pip install poetry
```
* Contar con una instancia activa de PostgreSQL (local o contenedor Docker).

### 2. Clonado y preparacion del entorno
Clonar el repositorio y ubicarse en el directorio del proyecto

```bash
git clone <url-del-repositorio>
cd code/admin
```

Instalar las dependencias declaradas en `pyproject.toml` en el entorno virtual de Poetry:

```bash
poetry install
```

### Variable de entorno
Genera el archivo .env a partir de la plantilla provista 

```bash
cp .env.example .env
```

Configurar dentro del archivo `.env` los valores correspondientes al entorno de ejecución.


## 💻 **Guía de Uso e Inicialización**

### El sistema dispone de comandos CLI registrados para gestionar el esquema y los datos iniciales:

Crear las tablas en la base de datos:

        poetry run flask init-db

Cargar los datos iniciales (Seeds de roles, sectores y usuario administrador):

        
        poetry run flask seed-db

Nota: Si se necesita reiniciar el esquema completo desde cero y repoblar los datos de prueba, ejecutar:

        poetry run flask reset-db


Ejecución del Servidor
Para iniciar la aplicación en modo desarrollo con recarga automática:

    poetry run flask run --debug

El portal quedará accesible en: http://127.0.0.1:5000/

## Credenciales de Acceso por Defecto

 Una vez ejecutado el comando de seed, se encuentra disponible la siguiente cuenta de acceso inicial: 
 * Usuario: admin@hospital.gob.ar
 * contraseña: admin123
  
## Pruebas Automatizadas
Para correr la suite de pruebas del proyecto:
        poetry run pytest

## 📄 Licencia
Este software se encuentra bajo los términos de la licencia GNU General Public License v3.0 (GPL-3.0).

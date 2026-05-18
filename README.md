# 🚀 ECITimeQuest (Frontend)

[![Flutter Version](https://img.shields.io/badge/Flutter-3.11.3%2B-blue?logo=flutter)](https://flutter.dev)
[![Riverpod](https://img.shields.io/badge/State--Management-Riverpod%202.x-green?logo=dart)](https://riverpod.dev)
[![Firebase](https://img.shields.io/badge/Auth-Firebase%20%26%20Google-orange?logo=firebase)](https://firebase.google.com/)
[![License](https://img.shields.io/badge/Academic%20Project-ECI-red)](#)

**ECITimeQuest** es una innovadora aplicación móvil diseñada para convertir el aprendizaje de la historia en una aventura épica y gamificada. Orientada a estudiantes universitarios de la **Escuela Colombiana de Ingeniería Julio Garavito**, la aplicación fusiona dinámicas de juego (misiones, adquisición de medallas y progresión por eras) con un tutor inteligente potenciado por **Inteligencia Artificial** que analiza y retroalimenta los conocimientos adquiridos.

El sistema identifica y clasifica de forma inteligente los errores del usuario en categorías **fácticas**, **conceptuales** y **contextuales**, permitiendo generar explicaciones personalizadas y análisis de vacíos (_concept gaps_) en tiempo real.

---

## 🌟 Características Clave

### 1. 🔐 Autenticación y Sincronización Segura

- Acceso rápido a través de **Firebase Authentication** y **Google Sign-In**.
- Flujo automático de sincronización en segundo plano con el backend a través del endpoint `/auth/sync`, asegurando la sincronización de perfiles y estados de usuario.

### 2. 🎮 Dashboard Dinámico (Gamificación)

- **Explore Eras Card:** Navegación inmersiva por periodos históricos y sus respectivos temas.
- **Mission State Card:** Visualización interactiva del nivel de progreso actual y misiones activas basadas en datos en tiempo real.
- **AI Tutor Card:** Acceso inmediato al asistente virtual para resolver dudas complejas.

### 3. 📚 Biblioteca de Contenidos Históricos

- Acceso estructurado a **Periodos Históricos** y **Temas específicos**.
- Visualización de personajes ilustres (_Historical Figures_) y eventos trascendentales (_Historical Events_) enriquecidos con contexto interactivo.

### 4. 🧠 Motor de Aprendizaje Adaptativo y Quizzes

- Sesiones de práctica en vivo con navegación fluida y barra de progreso.
- **Feedback Modal:** Retroalimentación instantánea ante cada respuesta, clasificando errores mediante enums dedicados (`factual`, `conceptual`, `contextual`).
- **Sistema de Logros:** Desbloqueo dinámico de insignias (_Badges_) conforme se alcanzan hitos y se domina cada era histórica.

### 5. 🤖 Tutor de Inteligencia Artificial (Tareas Asíncronas)

- Generación bajo demanda de explicaciones detalladas para resolver vacíos conceptuales detectados.
- Uso de colas de tareas asíncronas y sondeo (_polling_) dinámico de estados mediante un cliente HTTP robusto.

### 6. 💳 Control de Suscripciones (Gating)

- Diferenciación de planes: **Gratuito (Free)** y **Premium**.
- Acceso exclusivo a funciones avanzadas (como generación extendida de contenido mediante IA y explicaciones ilimitadas) limitado por plan, implementando banners elegantes y pantallas de actualización (`UpgradePlanWidget`).

---

## 🏗️ Arquitectura del Proyecto

La base de código sigue un patrón **Feature-First (orientado a características)** y principios de **Clean Architecture**, asegurando escalabilidad, modularidad y facilidad para pruebas unitarias.

```text
lib/
├── app/
│   └── app.dart                      # Configuración global de MaterialApp y enrutamiento inicial.
├── core/                             # Elementos transversales de la aplicación
│   ├── network/                      # Cliente Dio personalizado, mapeo de excepciones e interceptores.
│   ├── theme/                        # Paleta de colores Premium, gradientes y tipografías (Plus Jakarta, Inter).
│   ├── utils/                        # Manejador de errores global y mixins útiles (TaskRunnerMixin).
│   └── widgets/                      # Componentes UI reutilizables (Botones, Tarjetas, Modales de Premium).
├── features/                         # Módulos encapsulados por características de negocio
│   ├── auth/                         # Lógica de login, sincronización y repositorios de autenticación.
│   ├── content/                      # Repositorios y pantallas de periodos, eras y temas históricos.
│   ├── home/                         # Estructura del Dashboard principal y componentes visuales.
│   ├── ia/                           # Manejo de tareas asíncronas del motor de IA y sondeo de prompts.
│   ├── learning/                     # Sesiones de aprendizaje, gestión de respuestas de quizzes e insignias.
│   ├── profile/                      # Pantalla de usuario, estadísticas de dominio de eras y medallas.
│   └── subscription/                 # Gating de planes, suscripción Premium y pasarela simulada.
├── firebase_options.dart             # Configuraciones auto-generadas de Firebase para múltiples plataformas.
└── main.dart                         # Punto de entrada de la aplicación, inicializa Firebase y Riverpod Scope.
```

---

## 🛠️ Tecnologías y Dependencias Principales

- **SDK de Flutter:** `^3.11.3`
- **Gestión de Estado:** `flutter_riverpod` (Riverpod v2) para una reactividad limpia y desacoplada del UI.
- **Cliente HTTP:** `dio` para conexiones API robustas con timeouts configurados y control de excepciones.
- **Servicios Cloud:** `firebase_core`, `firebase_auth` y `google_sign_in`.
- **Notificaciones Visuales:** `bot_toast` para notificaciones no intrusivas en pantalla.
- **Modelado y Serialización:** `freezed` y `json_annotation` para la inmutabilidad y parseo seguro de JSON.
- **Generador de Código:** `build_runner` con `freezed` y `json_serializable`.
- **Diseño:** Fuentes personalizadas `Plus Jakarta Sans` e `Inter` integradas localmente en assets.

---

## 🚀 Instalación y Configuración Local

Sigue los siguientes pasos para configurar y ejecutar el proyecto en tu entorno local:

### 📋 Prerrequisitos

- Tener instalado [Flutter SDK (3.11.3 o superior)](https://docs.flutter.dev/get-started/install).
- Configurar un dispositivo virtual (Emulador Android/iOS) o físico con depuración activa.
- Acceso a internet para restaurar paquetes.

### 🔌 Pasos de Configuración

1.  **Clonar el repositorio:**

    ```bash
    git clone https://github.com/tu-usuario/ECITimeQuest_Frontend.git
    cd ECITimeQuest_Frontend
    ```

2.  **Instalar dependencias:**
    Descarga todos los paquetes listados en el `pubspec.yaml`.

    ```bash
    flutter pub get
    ```

3.  **Generar archivos automáticos:**
    Genera los modelos de datos inmutables y serializadores JSON utilizando el `build_runner`:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Configurar Firebase:**
    Asegúrate de que tus credenciales de Firebase estén debidamente enlazadas. Puedes volver a configurar el SDK utilizando el CLI de FlutterFire:

    ```bash
    flutterfire configure
    ```

    _(Asegura que tu archivo `firebase_options.dart` en `lib/` esté actualizado)._

5.  **Ejecutar la aplicación:**
    Puedes iniciar la aplicación apuntando a tu backend local o de producción mediante variables de entorno en la compilación:
    ```bash
    flutter run --dart-define=API_BASE_URL=http://localhost:8000
    ```
    _Nota: Reemplaza `http://localhost:8000` con la IP o URL pública de tu API del backend si estás probando desde un dispositivo móvil físico._

---

## 📦 Compilación y Distribución

Para preparar una compilación de producción para Android, el proyecto ya cuenta con las configuraciones necesarias de firmado (incluyendo el archivo de clave local `nuevo-release-key.jks`).

Para compilar un APK firmado:

```bash
flutter build apk --release --dart-define=API_BASE_URL=https://api.tu-servidor-produccion.com
```

El archivo de salida se ubicará en:
`build/app/outputs/flutter-apk/app-release.apk`

---

## 🎓 Créditos Académicos

Este proyecto ha sido desarrollado en el marco de la asignatura **IETI** en el 9.º semestre del programa de Ingeniería de Sistemas de la **Escuela Colombiana de Ingeniería Julio Garavito**.

- **Institución:** Escuela Colombiana de Ingeniería Julio Garavito
- **Periodo Académico:** 2026-1

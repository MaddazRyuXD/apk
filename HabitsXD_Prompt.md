# PROMPT: Build HabitsXD — Full Flutter Android App with GitHub Actions CI/CD

---

## 🎯 IDENTITAS APLIKASI

- **Nama Aplikasi:** HabitsXD
- **Package Name:** `com.MaddazXD.HabitsXD`
- **Platform:** Android (APK)
- **Min SDK:** 24 (Android 7.0 Nougat)
- **Target/Max SDK:** 36 (Android 16)
- **Bahasa Utama:** Flutter (Dart)
- **Bahasa Tambahan:** Kotlin (untuk platform channel & Firebase native config), YAML (GitHub Actions CI/CD)
- **Backend:** Firebase (Auth + Firestore + Storage)
- **AI:** Gemini API (Google, gratis)
- **Build System:** GitHub Actions (otomatis build APK setiap push ke branch `main`)

---

## 🗂️ STRUKTUR FOLDER LENGKAP

Buat struktur folder **persis** seperti ini. Jangan ada yang terlewat:

```
HabitsXD/
├── .github/
│   └── workflows/
│       └── build.yml                  # GitHub Actions workflow untuk build APK
│
├── android/
│   ├── app/
│   │   ├── src/
│   │   │   └── main/
│   │   │       ├── kotlin/
│   │   │       │   └── com/
│   │   │       │       └── MaddazXD/
│   │   │       │           └── HabitsXD/
│   │   │       │               └── MainActivity.kt
│   │   │       ├── res/
│   │   │       │   ├── mipmap-hdpi/
│   │   │       │   │   └── ic_launcher.png       # icon 72x72
│   │   │       │   ├── mipmap-mdpi/
│   │   │       │   │   └── ic_launcher.png       # icon 48x48
│   │   │       │   ├── mipmap-xhdpi/
│   │   │       │   │   └── ic_launcher.png       # icon 96x96
│   │   │       │   ├── mipmap-xxhdpi/
│   │   │       │   │   └── ic_launcher.png       # icon 144x144
│   │   │       │   ├── mipmap-xxxhdpi/
│   │   │       │   │   └── ic_launcher.png       # icon 192x192
│   │   │       │   └── values/
│   │   │       │       └── styles.xml
│   │   │       └── AndroidManifest.xml
│   │   └── build.gradle               # app-level gradle
│   ├── build.gradle                   # project-level gradle
│   ├── gradle.properties
│   └── settings.gradle
│
├── assets/
│   ├── fonts/                         # font kustom
│   │   ├── SF-Pro-Display-Regular.ttf
│   │   ├── SF-Pro-Display-Medium.ttf
│   │   └── SF-Pro-Display-Bold.ttf
│   ├── icons/
│   │   └── app_icon.png              # icon default placeholder 1024x1024
│   └── images/
│       └── onboarding_bg.png         # background onboarding
│
├── lib/
│   ├── main.dart                      # entry point aplikasi
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart        # semua warna light & dark theme
│   │   │   ├── app_typography.dart    # semua text style
│   │   │   ├── app_spacing.dart       # padding, margin, radius konstanta
│   │   │   └── app_strings.dart       # semua string/teks aplikasi
│   │   │
│   │   ├── theme/
│   │   │   ├── app_theme.dart         # ThemeData light & dark
│   │   │   └── theme_controller.dart  # Riverpod provider untuk toggle tema
│   │   │
│   │   ├── routes/
│   │   │   └── app_router.dart        # GoRouter routing konfigurasi
│   │   │
│   │   ├── utils/
│   │   │   ├── date_utils.dart        # helper format tanggal
│   │   │   ├── validators.dart        # validasi form
│   │   │   └── extensions.dart        # Dart extension methods
│   │   │
│   │   └── errors/
│   │       ├── app_exception.dart     # custom exception class
│   │       └── failure.dart           # failure model untuk error handling
│   │
│   ├── data/
│   │   ├── models/
│   │   │   ├── user_model.dart        # model data user
│   │   │   ├── note_model.dart        # model data note/dokumen
│   │   │   ├── task_model.dart        # model data task/to-do
│   │   │   ├── habit_model.dart       # model data habit tracker
│   │   │   ├── event_model.dart       # model data kalender
│   │   │   ├── database_model.dart    # model data database/tabel
│   │   │   └── ai_message_model.dart  # model data pesan AI chat
│   │   │
│   │   ├── repositories/
│   │   │   ├── auth_repository.dart       # login, register, logout via Firebase Auth
│   │   │   ├── note_repository.dart       # CRUD note ke Firestore
│   │   │   ├── task_repository.dart       # CRUD task ke Firestore
│   │   │   ├── habit_repository.dart      # CRUD habit ke Firestore
│   │   │   ├── calendar_repository.dart   # CRUD event kalender ke Firestore
│   │   │   ├── database_repository.dart   # CRUD database/tabel ke Firestore
│   │   │   └── ai_repository.dart         # request ke Gemini API
│   │   │
│   │   └── datasources/
│   │       ├── firebase_datasource.dart   # konfigurasi & inisialisasi Firebase
│   │       ├── local_datasource.dart      # SharedPreferences / Hive untuk cache lokal
│   │       └── gemini_datasource.dart     # HTTP call ke Gemini API
│   │
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── user_entity.dart
│   │   │   ├── note_entity.dart
│   │   │   ├── task_entity.dart
│   │   │   ├── habit_entity.dart
│   │   │   ├── event_entity.dart
│   │   │   └── database_entity.dart
│   │   │
│   │   └── usecases/
│   │       ├── auth_usecases.dart         # login, register, logout, get current user
│   │       ├── note_usecases.dart         # create, read, update, delete note
│   │       ├── task_usecases.dart         # create, read, update, delete, complete task
│   │       ├── habit_usecases.dart        # create, track, streak hitung habit
│   │       ├── calendar_usecases.dart     # create, read, update, delete event
│   │       ├── database_usecases.dart     # create, read, update, delete database
│   │       └── ai_usecases.dart           # kirim prompt, rangkum, analisis, chat AI
│   │
│   ├── presentation/
│   │   ├── providers/
│   │   │   ├── auth_provider.dart         # Riverpod provider untuk auth state
│   │   │   ├── note_provider.dart         # Riverpod provider untuk notes
│   │   │   ├── task_provider.dart         # Riverpod provider untuk tasks
│   │   │   ├── habit_provider.dart        # Riverpod provider untuk habits
│   │   │   ├── calendar_provider.dart     # Riverpod provider untuk kalender
│   │   │   ├── database_provider.dart     # Riverpod provider untuk database
│   │   │   └── ai_provider.dart           # Riverpod provider untuk AI
│   │   │
│   │   ├── screens/
│   │   │   ├── splash/
│   │   │   │   └── splash_screen.dart     # loading screen saat app pertama buka
│   │   │   │
│   │   │   ├── onboarding/
│   │   │   │   └── onboarding_screen.dart # tampilan pertama kali buka app
│   │   │   │
│   │   │   ├── auth/
│   │   │   │   ├── login_screen.dart      # halaman login
│   │   │   │   └── register_screen.dart   # halaman register
│   │   │   │
│   │   │   ├── home/
│   │   │   │   └── home_screen.dart       # dashboard utama dengan bottom nav
│   │   │   │
│   │   │   ├── notes/
│   │   │   │   ├── notes_list_screen.dart      # list semua notes
│   │   │   │   └── note_editor_screen.dart     # editor note rich text
│   │   │   │
│   │   │   ├── tasks/
│   │   │   │   ├── tasks_screen.dart           # list to-do & task
│   │   │   │   └── task_detail_screen.dart     # detail task
│   │   │   │
│   │   │   ├── habits/
│   │   │   │   ├── habits_screen.dart          # list habit tracker
│   │   │   │   ├── habit_detail_screen.dart    # detail & statistik habit
│   │   │   │   └── habit_form_screen.dart      # form tambah/edit habit
│   │   │   │
│   │   │   ├── calendar/
│   │   │   │   └── calendar_screen.dart        # tampilan kalender & event
│   │   │   │
│   │   │   ├── database/
│   │   │   │   ├── database_list_screen.dart   # list semua database/tabel
│   │   │   │   └── database_detail_screen.dart # tampilan isi database/tabel
│   │   │   │
│   │   │   ├── ai/
│   │   │   │   └── ai_chat_screen.dart         # halaman AI assistant chat
│   │   │   │
│   │   │   └── settings/
│   │   │       └── settings_screen.dart        # pengaturan: tema, akun, dll
│   │   │
│   │   └── widgets/
│   │       ├── common/
│   │       │   ├── app_button.dart             # tombol kustom
│   │       │   ├── app_text_field.dart         # input field kustom
│   │       │   ├── app_card.dart               # card container kustom
│   │       │   ├── app_bottom_nav.dart         # bottom navigation bar
│   │       │   ├── app_loading.dart            # widget loading indicator
│   │       │   └── app_empty_state.dart        # widget saat data kosong
│   │       │
│   │       ├── notes/
│   │       │   ├── note_card.dart              # card preview note
│   │       │   └── rich_text_toolbar.dart      # toolbar editor note
│   │       │
│   │       ├── tasks/
│   │       │   ├── task_tile.dart              # tile item task
│   │       │   └── task_priority_badge.dart    # badge prioritas task
│   │       │
│   │       ├── habits/
│   │       │   ├── habit_card.dart             # card habit dengan streak
│   │       │   ├── habit_calendar_heatmap.dart # heatmap kalender habit
│   │       │   └── streak_badge.dart           # badge streak count
│   │       │
│   │       ├── calendar/
│   │       │   ├── calendar_widget.dart        # kalender bulanan interaktif
│   │       │   └── event_tile.dart             # tile item event
│   │       │
│   │       └── ai/
│   │           ├── ai_message_bubble.dart      # bubble chat AI & user
│   │           └── ai_typing_indicator.dart    # animasi "AI sedang mengetik"
│   │
│   └── services/
│       ├── notification_service.dart   # local notification (flutter_local_notifications)
│       ├── connectivity_service.dart   # deteksi koneksi internet
│       └── analytics_service.dart      # Firebase Analytics
│
├── test/
│   └── widget_test.dart               # unit test dasar
│
├── pubspec.yaml                        # semua dependencies Flutter
├── pubspec.lock
├── analysis_options.yaml
├── google-services.json               # PENTING: file konfigurasi Firebase (letakkan di root, GitHub Actions akan memindahkannya)
└── README.md
```

---

## 📦 ISI `pubspec.yaml` LENGKAP

```yaml
name: habitsxd
description: HabitsXD — Powerful Productivity & Habit Tracker App
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # Navigation
  go_router: ^13.2.0

  # Firebase
  firebase_core: ^2.30.1
  firebase_auth: ^4.19.5
  cloud_firestore: ^4.17.4
  firebase_storage: ^11.7.6
  firebase_analytics: ^10.10.6

  # AI - Gemini
  google_generative_ai: ^0.4.3

  # Rich Text Editor (seperti Notion)
  flutter_quill: ^9.4.4

  # Database lokal (cache offline)
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # Kalender
  table_calendar: ^3.1.1

  # Habit Heatmap
  flutter_heatmap_calendar: ^1.0.5

  # Notifikasi
  flutter_local_notifications: ^17.1.2

  # HTTP Client (untuk Gemini API fallback)
  http: ^1.2.1
  dio: ^5.4.3+1

  # Shared Preferences
  shared_preferences: ^2.2.3

  # Icons
  flutter_svg: ^2.0.10+1
  lucide_icons: ^0.0.2

  # UI Helpers
  gap: ^3.0.1
  shimmer: ^3.0.0
  lottie: ^3.1.2
  animate_do: ^3.3.4
  flutter_slidable: ^3.1.0
  modal_bottom_sheet: ^3.0.0
  cached_network_image: ^3.3.1

  # Date & Time
  intl: ^0.19.0

  # Connectivity
  connectivity_plus: ^6.0.3

  # UUID generator
  uuid: ^4.4.0

  # Image Picker (untuk lampiran)
  image_picker: ^1.1.2

  # Permission Handler
  permission_handler: ^11.3.1

  # Markdown renderer
  flutter_markdown: ^0.7.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  build_runner: ^2.4.9
  riverpod_generator: ^2.4.0
  hive_generator: ^2.0.1

flutter:
  uses-material-design: true

  assets:
    - assets/fonts/
    - assets/icons/
    - assets/images/

  fonts:
    - family: SFPro
      fonts:
        - asset: assets/fonts/SF-Pro-Display-Regular.ttf
          weight: 400
        - asset: assets/fonts/SF-Pro-Display-Medium.ttf
          weight: 500
        - asset: assets/fonts/SF-Pro-Display-Bold.ttf
          weight: 700
```

> **CATATAN FONT:** Karena SF Pro adalah font Apple (tidak bisa didistribusikan bebas), gunakan **Plus Jakarta Sans** atau **DM Sans** dari Google Fonts sebagai pengganti yang terlihat mirip dan elegan. Tambahkan via `google_fonts` package atau download manual ke `assets/fonts/`.

---

## 🎨 DESAIN & TEMA

### Filosofi Desain:
- Terinspirasi dari **iOS Human Interface Guidelines** — bersih, tipografi kuat, spacing konsisten
- **Bukan** desain Material biasa — lebih premium, elegan, minimalis
- Support **Light Mode & Dark Mode** dengan toggle di settings
- Animasi halus dan micro-interaction yang responsif

### Palet Warna:

#### Light Mode:
```dart
// app_colors.dart
class AppColors {
  // Light
  static const lightBackground = Color(0xFFF5F5F7);      // putih abu Apple
  static const lightSurface = Color(0xFFFFFFFF);          // putih bersih
  static const lightPrimary = Color(0xFF007AFF);          // biru iOS
  static const lightSecondary = Color(0xFF34C759);        // hijau iOS
  static const lightAccent = Color(0xFFFF9F0A);           // oranye iOS
  static const lightTextPrimary = Color(0xFF1C1C1E);      // hitam iOS
  static const lightTextSecondary = Color(0xFF8E8E93);    // abu iOS
  static const lightDivider = Color(0xFFE5E5EA);          // divider halus
  static const lightCard = Color(0xFFFFFFFF);             // kartu putih

  // Dark
  static const darkBackground = Color(0xFF000000);        // hitam murni iOS
  static const darkSurface = Color(0xFF1C1C1E);           // surface dark
  static const darkPrimary = Color(0xFF0A84FF);           // biru dark iOS
  static const darkSecondary = Color(0xFF30D158);         // hijau dark iOS
  static const darkAccent = Color(0xFFFF9F0A);            // oranye
  static const darkTextPrimary = Color(0xFFFFFFFF);       // putih
  static const darkTextSecondary = Color(0xFF8E8E93);     // abu
  static const darkDivider = Color(0xFF2C2C2E);           // divider dark
  static const darkCard = Color(0xFF1C1C1E);              // kartu dark
}
```

### Border Radius: `16dp` untuk card, `12dp` untuk tombol, `24dp` untuk bottom sheet
### Font Size: 28 (heading), 20 (title), 17 (body), 15 (caption), 13 (label)
### Elevation: Gunakan shadow halus, bukan elevation Material yang keras

---

## ✨ FITUR LENGKAP YANG HARUS DIIMPLEMENTASI

### 1. 🔐 Autentikasi (Firebase Auth)
- Login dengan Email & Password
- Register akun baru dengan nama, email, password
- Logout
- Persistent login (tetap login setelah app ditutup)
- Validasi form yang lengkap dan informatif
- Tampilan loading state saat proses auth

### 2. 📝 Notes & Dokumen (Rich Text Editor)
- Editor teks lengkap menggunakan `flutter_quill`:
  - Bold, Italic, Underline, Strikethrough
  - Heading 1, 2, 3
  - Bullet list & numbered list
  - Quote block
  - Code block
  - Insert gambar dari galeri
  - Hyperlink
- Organisasi notes dengan **Folder/Workspace**
- Search notes secara real-time
- Sort by: tanggal dibuat, tanggal diubah, nama
- Tampilan grid & list
- Auto-save setiap perubahan (debounce 2 detik)
- Sync ke Firestore secara real-time
- **AI dalam Notes:** tombol "✨ AI" di toolbar untuk:
  - Rangkum note ini
  - Perbaiki tulisan
  - Lanjutkan tulisan
  - Terjemahkan
  - Buat poin-poin dari teks ini

### 3. ✅ Task & To-Do
- Tambah task dengan:
  - Judul
  - Deskripsi (opsional)
  - Tanggal deadline
  - Prioritas: Low / Medium / High / Urgent (dengan warna berbeda)
  - Tag/label
  - Sub-task (checklist)
- Filter task: Semua, Hari ini, Minggu ini, Terlambat, Selesai
- Sort by: prioritas, deadline, tanggal dibuat
- Swipe to complete & swipe to delete (flutter_slidable)
- Drag & drop untuk reorder task
- Progress bar di atas list (berapa % task selesai hari ini)
- **AI Task:** tombol "AI" untuk:
  - Pecah 1 task besar jadi sub-task otomatis
  - Estimasi waktu pengerjaan
  - Sarankan prioritas

### 4. 🔄 Habit Tracker
- Tambah habit dengan:
  - Nama habit
  - Ikon (pilih dari preset emoji)
  - Warna habit
  - Frekuensi: Harian / Mingguan (pilih hari) / Custom
  - Target per hari (misal: minum air 8 gelas)
  - Pengingat (notifikasi di jam tertentu)
- Tampilan **Heatmap kalender** seperti GitHub contribution graph
- **Streak counter** — berapa hari berturut-turut
- Statistik habit:
  - Total selesai
  - Persentase keberhasilan
  - Streak terpanjang
  - Grafik progress mingguan/bulanan
- **AI Habit Analysis:** analisis pola habit dan berikan saran motivasi
- Notifikasi pengingat habit harian

### 5. 📅 Kalender & Jadwal
- Tampilan kalender bulanan (table_calendar)
- Tampilan agenda/list event per hari
- Tambah event dengan:
  - Judul
  - Tanggal & waktu mulai/selesai
  - Deskripsi
  - Warna event
  - Pengingat (notifikasi)
  - Repeat: tidak, harian, mingguan, bulanan
- Tap tanggal untuk lihat event hari itu
- Integrasi dengan task (deadline task muncul di kalender)
- **AI Schedule:** "Bantu saya atur jadwal minggu ini"

### 6. 🗄️ Database & Tabel (seperti Notion Database)
- Buat database kustom dengan kolom:
  - Text
  - Number
  - Date
  - Checkbox
  - Select (dropdown pilihan)
  - Multi-select
  - URL
- Tampilan: **Tabel** dan **Kanban Board**
- Filter & sort per kolom
- Tambah, edit, hapus baris data
- Nama database kustom
- **AI Database:** "Buatkan template database untuk tracking buku yang sudah dibaca"

### 7. 🤖 AI Assistant (Gemini API)
- **Chat AI** layaknya ChatGPT dalam app:
  - Typing indicator animasi
  - Bubble chat user (kanan) & AI (kiri)
  - Markdown rendering di respons AI
  - Copy pesan AI
  - Clear conversation
  - Riwayat chat tersimpan di Firestore
- **Konteks Aplikasi:** AI bisa diajak bicara soal data di app ("Habit apa yang paling sering saya lewatkan minggu ini?")
- **Fitur AI Spesifik:**
  - Rangkum note yang dipilih
  - Analisis produktivitas mingguan
  - Bantu tulis & edit teks di note editor
  - Pecah task besar jadi sub-task
  - Sarankan jadwal harian dari task yang ada
  - Motivasi & coaching habit
- **Implementasi Gemini:**
  ```dart
  // gemini_datasource.dart
  import 'package:google_generative_ai/google_generative_ai.dart';
  
  class GeminiDatasource {
    final GenerativeModel _model = GenerativeModel(
      model: 'gemini-1.5-flash',   // model gratis dengan limit besar
      apiKey: 'YOUR_GEMINI_API_KEY', // simpan di environment variable
    );
  
    Future<String> sendMessage(String prompt) async {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Tidak ada respons dari AI';
    }
  
    Stream<String> sendMessageStream(String prompt) async* {
      final content = [Content.text(prompt)];
      final stream = _model.generateContentStream(content);
      await for (final chunk in stream) {
        yield chunk.text ?? '';
      }
    }
  }
  ```

### 8. ⚙️ Settings
- Toggle Dark/Light Mode (tersimpan di SharedPreferences)
- Info akun (nama, email, foto profil)
- Notifikasi on/off
- Tentang aplikasi (versi, nama developer)
- Logout

---

## 🤖 GITHUB ACTIONS — BUILD APK OTOMATIS

### File: `.github/workflows/build.yml`

```yaml
name: Build HabitsXD APK

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:   # bisa trigger manual dari GitHub UI

jobs:
  build:
    name: Build APK
    runs-on: ubuntu-latest

    steps:
      # 1. Checkout kode
      - name: Checkout Repository
        uses: actions/checkout@v4

      # 2. Setup Java (wajib untuk Android build)
      - name: Setup Java 17
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'

      # 3. Setup Flutter
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.22.0'
          channel: 'stable'
          cache: true

      # 4. Taruh google-services.json dari GitHub Secret
      - name: Create google-services.json
        run: |
          echo '${{ secrets.GOOGLE_SERVICES_JSON }}' > android/app/google-services.json

      # 5. Buat file .env untuk Gemini API Key
      - name: Create environment config
        run: |
          mkdir -p lib/core/constants
          echo "const String geminiApiKey = '${{ secrets.GEMINI_API_KEY }}';" > lib/core/constants/env_config.dart

      # 6. Install dependencies
      - name: Install Flutter Dependencies
        run: flutter pub get

      # 7. Generate kode (Riverpod, Hive)
      - name: Run Code Generation
        run: dart run build_runner build --delete-conflicting-outputs

      # 8. Analisis kode (opsional, bantu deteksi error)
      - name: Analyze Code
        run: flutter analyze --no-fatal-infos
        continue-on-error: true

      # 9. Build APK release
      - name: Build APK
        run: flutter build apk --release --no-tree-shake-icons

      # 10. Upload APK sebagai artifact (bisa didownload dari GitHub)
      - name: Upload APK Artifact
        uses: actions/upload-artifact@v4
        with:
          name: HabitsXD-release-apk
          path: build/app/outputs/flutter-apk/app-release.apk
          retention-days: 30
```

### 🔑 GitHub Secrets yang WAJIB ditambahkan:
Pergi ke **GitHub Repo → Settings → Secrets and variables → Actions → New repository secret**

| Secret Name | Isi |
|---|---|
| `GOOGLE_SERVICES_JSON` | Isi seluruh konten file `google-services.json` dari Firebase Console |
| `GEMINI_API_KEY` | API Key Gemini dari [Google AI Studio](https://aistudio.google.com/) |

---

## 📱 ANDROID CONFIG

### `android/app/build.gradle`:
```gradle
android {
    namespace "com.MaddazXD.HabitsXD"
    compileSdk 36

    defaultConfig {
        applicationId "com.MaddazXD.HabitsXD"
        minSdk 24
        targetSdk 36
        versionCode 1
        versionName "1.0.0"
        multiDexEnabled true
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug  // pakai debug signing untuk sekarang
            minifyEnabled false
            shrinkResources false
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = '17'
    }
}

dependencies {
    implementation 'androidx.multidex:multidex:2.0.1'
    implementation platform('com.google.firebase:firebase-bom:33.0.0')
    implementation 'com.google.firebase:firebase-analytics'
}

apply plugin: 'com.google.gms.google-services'
```

### `android/build.gradle` (project-level):
```gradle
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.3.0'
        classpath 'org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.23'
        classpath 'com.google.gms:google-services:4.4.1'
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
```

### `android/app/src/main/AndroidManifest.xml`:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    
    <!-- Permissions -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    <uses-permission android:name="android.permission.VIBRATE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT"/>
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>

    <application
        android:label="HabitsXD"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="false">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"/>
              
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>

        <!-- Flutter Local Notifications -->
        <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"/>
        <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
                <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
            </intent-filter>
        </receiver>
        
        <meta-data
            android:name="com.google.firebase.messaging.default_notification_channel_id"
            android:value="habitsxd_channel"/>
    </application>
</manifest>
```

---

## 🖼️ ICON PLACEHOLDER (Agar Tidak Error Saat Build)

Karena belum ada icon asli, buat icon default dengan cara ini di `main.dart` setup atau gunakan script:

**Opsi termudah:** Install package `flutter_launcher_icons` dan buat file `flutter_launcher_icons.yaml`:

```yaml
# flutter_launcher_icons.yaml
flutter_launcher_icons:
  android: true
  ios: false
  image_path: "assets/icons/app_icon.png"
  min_sdk_android: 24
  adaptive_icon_background: "#007AFF"
  adaptive_icon_foreground: "assets/icons/app_icon.png"
```

Tambahkan di `pubspec.yaml` dev_dependencies:
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1
```

Lalu jalankan:
```bash
dart run flutter_launcher_icons
```

**Untuk icon placeholder:** Buat file PNG 1024x1024 berwarna biru (#007AFF) dengan teks "H" putih di tengah. Simpan di `assets/icons/app_icon.png`. Ini akan di-generate otomatis oleh flutter_launcher_icons untuk semua ukuran mipmap.

Tambahkan step ini di `build.yml` setelah `flutter pub get`:
```yaml
- name: Generate App Icons
  run: dart run flutter_launcher_icons
```

---

## 🏠 NAVIGASI UTAMA

Gunakan **Bottom Navigation Bar** dengan 5 tab:

| Tab | Icon | Label |
|---|---|---|
| 1 | 🏠 | Home (Dashboard) |
| 2 | 📝 | Notes |
| 3 | ✅ | Tasks |
| 4 | 🔄 | Habits |
| 5 | 🤖 | AI |

Kalender & Database bisa diakses dari Home dashboard atau via drawer/menu tambahan.

---

## 🚀 HOME DASHBOARD

Tampilan home harus informatif dan elegan, berisi:
- **Greeting** ("Selamat pagi, [Nama]! ☀️")
- **Tanggal & hari ini**
- **Quick stats card:** Tasks hari ini (X/Y selesai), Habits aktif, Streak terpanjang
- **Habits hari ini** — list habit yang belum di-check hari ini
- **Tasks prioritas tinggi** — 3 task teratas yang deadline hari ini
- **Event hari ini** — dari kalender
- **Quick Add button** (+) floating di pojok kanan bawah dengan speed dial untuk tambah Note/Task/Habit/Event

---

## 📋 ATURAN PENTING UNTUK AI YANG MEMBUAT KODE

1. **Semua file harus dibuat sesuai struktur folder di atas.** Jangan skip file apapun.
2. **Gunakan Riverpod** sebagai state management. Jangan campurkan dengan Provider atau setState (kecuali untuk widget sederhana).
3. **Gunakan GoRouter** untuk semua navigasi. Jangan pakai Navigator langsung.
4. **Firebase WAJIB diinisialisasi** di `main.dart` sebelum `runApp()` menggunakan `await Firebase.initializeApp()`.
5. **API Key Gemini** jangan di-hardcode di kode. Baca dari `env_config.dart` yang di-generate oleh GitHub Actions.
6. **`google-services.json`** JANGAN dicommit ke GitHub. File ini di-generate saat build via GitHub Secret.
7. **Tambahkan `.gitignore`** yang meng-ignore: `google-services.json`, `*.keystore`, `env_config.dart`, `.env`, `build/`.
8. **Setiap screen** harus ada handling untuk: loading state, error state, empty state.
9. **Offline support:** Gunakan Hive untuk cache data lokal. App harus tetap bisa dibuka walau offline.
10. **Dark/Light Mode** harus bekerja di seluruh app tanpa terkecuali. Jangan hardcode warna.
11. **Build APK tidak boleh error.** Pastikan semua import benar, semua file yang di-import ada, dan versi package kompatibel.
12. **Gunakan `const` constructor** sebanyak mungkin untuk performa.
13. **Tambahkan komentar** di setiap fungsi/class penting untuk menjelaskan kegunaannya.
14. **`analysis_options.yaml`** harus ada dan dikonfigurasi dengan benar agar `flutter analyze` tidak banyak warning.

---

## 🔥 FIREBASE SETUP

Di Firebase Console (console.firebase.google.com), buat project baru:
1. Buat project bernama **HabitsXD**
2. Tambahkan Android App dengan package name `com.MaddazXD.HabitsXD`
3. Download `google-services.json`
4. Enable **Authentication** → Email/Password
5. Enable **Cloud Firestore** → Start in test mode (lalu update rules setelah selesai)
6. Enable **Firebase Storage**
7. Enable **Firebase Analytics**

### Firestore Security Rules (untuk production):
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId}/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

### Struktur Firestore:
```
users/
  {userId}/
    profile/
      name, email, photoUrl, createdAt
    notes/
      {noteId}/
        title, content, folderId, createdAt, updatedAt
    tasks/
      {taskId}/
        title, description, deadline, priority, tags, subtasks[], isCompleted, createdAt
    habits/
      {habitId}/
        name, icon, color, frequency, reminder, createdAt
      completions/
        {date}: { completed: true, count: number }
    events/
      {eventId}/
        title, description, startTime, endTime, color, repeat, reminder
    databases/
      {databaseId}/
        name, columns[], rows[]
    ai_conversations/
      {conversationId}/
        messages[], createdAt, updatedAt
```

---

## 📝 `.gitignore` WAJIB

```gitignore
# Flutter
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
build/
*.lock

# Android
android/app/google-services.json
android/.gradle/
android/local.properties
*.jks
*.keystore

# Secrets & Environment
lib/core/constants/env_config.dart
.env
.env.*

# IDE
.idea/
.vscode/
*.iml

# macOS
.DS_Store

# Test
coverage/
```

---

## ✅ CHECKLIST SEBELUM PUSH KE GITHUB

Pastikan semua ini sudah beres sebelum push:
- [ ] Semua file di struktur folder sudah dibuat
- [ ] `pubspec.yaml` sudah benar dan semua package ada
- [ ] `google-services.json` sudah di-gitignore
- [ ] `env_config.dart` sudah di-gitignore
- [ ] GitHub Secrets sudah ditambahkan (`GOOGLE_SERVICES_JSON` dan `GEMINI_API_KEY`)
- [ ] `.github/workflows/build.yml` sudah ada
- [ ] Icon placeholder sudah ada di `assets/icons/app_icon.png`
- [ ] `flutter pub get` berhasil dijalankan lokal
- [ ] `flutter analyze` tidak ada error fatal
- [ ] `flutter build apk --release` berhasil dijalankan lokal (tes sebelum push)

---

*Prompt ini dibuat untuk HabitsXD v1.0.0 — Productivity & Habit Tracker App*
*Package: com.MaddazXD.HabitsXD | Flutter 3.22+ | Min SDK 24 | Target SDK 36*

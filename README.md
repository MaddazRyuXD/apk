# HabitsXD

Skeleton Flutter project for HabitsXD with a functional initial UI, Riverpod state management, GoRouter navigation, and placeholder data models.

## What is included
- `main.dart` with Firebase and Hive initialization
- Bottom navigation home dashboard with notes, tasks, habits, and AI tabs
- Basic providers for auth, notes, tasks, habits, calendar, database, and AI chat
- Placeholder `flutter_quill` note editor and AI chat interface
- GitHub Actions workflow for APK build
- Android resource placeholders and `.gitignore` entries

## Next steps
1. Install Flutter locally
2. Run `flutter pub get`
3. Run `dart run flutter_launcher_icons:main` to generate adaptive app icons
4. Add Firebase config via GitHub Secrets or local `google-services.json`
5. Run `flutter build apk --release`

## GitHub Actions
The workflow in `.github/workflows/build.yml` will:
- checkout repository
- setup Java 17 and Flutter 3.22.0
- create `google-services.json` from `GOOGLE_SERVICES_JSON`
- create `lib/core/constants/env_config.dart` from `GEMINI_API_KEY`
- install dependencies
- generate app icons
- run code generation
- analyze code
- build release APK
- upload APK artifact

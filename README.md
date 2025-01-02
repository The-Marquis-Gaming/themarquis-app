# Marquis v2 App

## Prerequisites

Before you can run the app, you need to ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Version: 3.10.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (Version: 3.4.0 or higher)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) for IDE (with Flutter plugin)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development on Mac)
- [Android SDK](https://developer.android.com/studio)

## Getting Started

### 1. Clone the repository

First, clone the repository to your local machine using the following command:

```bash
git clone https://github.com/your-username/your-flutter-project.git
cd your-flutter-project
```

### 2. Install dependencies

Install the required Flutter packages:

```bash
flutter pub get
```

### 3. Set up your development environment

Make sure you have a connected device or emulator running:

- For Android, start an Android emulator using Android Studio.
- For iOS, start an iOS simulator or connect an iPhone (on macOS only).

You can check if Flutter detects your device by running:

```bash
flutter devices
```

### 4. Run the app

To run the app on your connected device or emulator, use:

```bash
flutter run
```

For running on a specific device (e.g., iOS, Android):

```bash
flutter run -d <device_id>
```

Replace `<device_id>` with the ID of the device shown by the `flutter devices` command.

### 5. Building the APK (for Android)

To build an APK for Android, run:

```bash
flutter build apk --release
```

The APK will be generated in the `build/app/outputs/flutter-apk` directory.

### 6. Building the app for iOS (on macOS)

To build the app for iOS, you will need to open the iOS project in Xcode:

```bash
open ios/Runner.xcworkspace
```

From Xcode, configure signing, then build and run the app.

### 7. Run Tests

To run all tests, use the command
```bash
flutter test
```
To run a specific test file, use
```bash
flutter test [PATH TO TEST FILE]
```

## Additional Commands

- **Cleaning the project**:  
  Clean up build files and other cache:

  ```bash
  flutter clean
  ```

## Troubleshooting

If you encounter issues, try these common fixes:

- Ensure Packages are up to date:

  ```bash
  flutter pub upgrade
  ```
- Ensure Flutter and Dart SDKs are up to date:

  ```bash
  flutter upgrade
  ```

- Run doctor to check for setup issues:

  ```bash
  flutter doctor
  ```

# Quick Social App

Simple social media UI prototype built with Flutter.

![Quick Social Banner](https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social_banner.png?raw=true)

## Features

- Feed with posts (like, comment, save)
- Instagram-like story view
- Notifications page
- User profile
- Responsive layout (mobile, tablet, desktop)
- Material 3 design
- Dummy data generation

## Screenshots

| Feed Page | Story View | My Profile Page |
| --- | --- | --- |
| <img src="https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social-0.jpg?raw=true" width="180px"> | <img src="https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social-1.jpg?raw=true" width="180px"> | <img src="https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social-2.jpg?raw=true" width="180px"> |
| Profile Page | Comment Bottom Sheet | Notification Page |
| <img src="https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social-3.jpg?raw=true" width="180px"> | <img src="https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social-4.jpg?raw=true" width="180px"> | <img src="https://github.com/ikhsan3adi/quick_social/blob/main/.screenshots/quick_social-5.jpg?raw=true" width="180px"> |

## Dependencies

| Package                                               | Usage                      |
| ----------------------------------------------------- | -------------------------- |
| [google_fonts](https://pub.dev/packages/google_fonts) | DM Sans text theme         |
| [faker](https://pub.dev/packages/faker)               | Dummy data generation      |
| [story](https://pub.dev/packages/story)               | Instagram-style story view |

## Prerequisites

- Flutter SDK 3.22+ / Dart SDK ^3.5.3
- Internet connection to load Google Fonts & images

## Getting Started

```bash
git clone https://github.com/ikhsan3adi/quick_social.git
cd quick_social
flutter pub get
flutter run
```

## Run for Web

```bash
flutter run -d chrome
```

## Build for Web

```bash
flutter build web --base-href /quick_social/
```

## Deployment

Push to `main` branch triggers GitHub Actions workflow (`.github/workflows/deploy.yml`) that:

1. Builds Flutter web app
2. Uploads artifact
3. Deploys to GitHub Pages

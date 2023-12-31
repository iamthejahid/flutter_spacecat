

  # Flutter Riverpod DDD App

This Flutter application is built with Riverpod state management and follows the Clean (or DDD) architectural pattern. It includes features for theme and language switching, a login page, registration page, and a home page that displays user information from a JSON Placeholder source.

  [![Home Page](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000849.png)](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000849.png) [![Drawer Navigation](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000854.png)](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000854.png) [![Login  Page](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000863.png)](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000863.png) 

![Registration Page Page](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000889.png)](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000889.png) 

![Theme chanage demonstration](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000889.png)](https://github.com/iamthejahid/flutter_space_cat_task/blob/main/media/Screenshot_1698000889.png) 

## Features

1.  **Theme and Language Switching:**
    
    -   Users can switch between light and dark themes.
    -   Language can be switched between Bangla, English, and Arabic. English is the default language.
2.  **Login Page:**
    
    -   A fully functional login page with user authentication.
    -   Demonstrates user authentication using Firebase Authentication.
3.  **Registration Page:**
    
    -   A user-friendly registration page for signing up.
    -   User registration functionality with secure data storage.
4.  **Home Page:**
    
    -   The home page displays user information retrieved from a JSON Placeholder source.
    -   Utilizes Riverpod for state management.
5.  **Drawer:**
    
    -   A navigation drawer provides access to theme and language switching.
    -   Offers navigation to different pages within the app.


This project is powered by the VG CLI, a versatile command-line interface that simplifies your development process. You can learn more about the VG CLI by visiting [this link](https://cli.vgv.dev/docs/overview).

  

While VG CLI initially utilizes the BLoC pattern for state management, we've chosen to implement Riverpod as the core state management solution for this starter project. Riverpod offers a more flexible and modern approach to managing application state. Learn more about Riverpod at [riverpod.dev](https://riverpod.dev/).

  

In this boilerplate, we've adopted a "feature-first" architecture to enhance modularity and maintainability. We've also incorporated three custom dependencies to streamline various aspects of your Flutter app:




**1. Api Client:**

  

- We've implemented a robust API client for handling network calls and related issues. It leverages the following dependencies:

- dio

- equatable

- flutter_easylogger

- fpdart (used for `Either` capability; a transition to `records` is planned in the future)

  

For insights into error handling with `records` in Dart, check out this informative article: [Dart Error Handling Using Records - Golang Style](https://medium.com/@torben-keller/dart-error-handling-using-records-golang-style-9b1faaec769c).

  

**2. App UI:**

  

- This module is dedicated to managing all aspects of your app's user interface. We've carefully selected several dependencies to enhance your app's visual appeal and functionality:

- cached_network_image

- flutter_animate

- flutter_easylogger

- flutter_screenutil

- gap

- google_fonts

- hooks_riverpod

- image_picker

  

Feel free to tailor these pre-configured settings to align with your project's specific requirements.

  

**Folder Structure:**

```

├── lib

│ ├── app_ui.dart

│ └── src

│ ├── colors

│ │ ├── app_colors.dart

│ │ └── color_extension.dart

│ ├── images.dart

│ ├── spacing

│ │ ├── app_const_spacing.dart

│ │ └── app_spacing.dart

│ ├── theme

│ │ └── app_theme.dart

│ ├── typography

│ │ ├── app_font_weight.dart

│ │ ├── app_text_styles.dart

│ │ ├── text_style_extension.dart

│ │ └── typography.dart

│ └── widgets

│ ├── ...

├── pubspec.lock

├── pubspec.yaml

```

  
  

**App Utils:** This section houses various project utilities, primarily comprising extensions that enhance code readability and maintainability.

  

In addition to the aforementioned dependencies, we've integrated several other crucial tools to elevate your Flutter development experience:

  

-  `flutter_dotenv` for managing environment variables (see the example below).

-  `get_it` for dependency injection.

-  `go_router` for streamlined routing within your app.

-  `hive` for efficient data storage.

  

**Env Example:**

  

dotenvCopy code

  

`HIVE_STAGING="hive_staging"

BASEURL_STAGING=""

  

HIVE_PRODUCTION="hive_prod"

BASEURL_PRODUCTION=""

  

HIVE_DEVELOPMENT="hive_dev"

BASEURL_DEVELOPMENT=""`

  

For more insights and detailed documentation on this project, VG CLI has thoughtfully generated an automated README, which you can find below.

  

![coverage][coverage_badge]

  

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

  

[![License: MIT][license_badge]][license_link]

  

Generated by the [Very Good CLI][very_good_cli_link] 🤖

  

A Very Good Project created by Very Good CLI.

  

---

  

## Getting Started 🚀

  

This project contains 3 flavors:

  

- development

  

- staging

  

- production

  

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

  

```sh

  

# Development

  

$  flutter  run  --flavor  development  --target  lib/main_development.dart

  

  

# Staging

  

$  flutter  run  --flavor  staging  --target  lib/main_staging.dart

  

  

# Production

  

$  flutter  run  --flavor  production  --target  lib/main_production.dart

  

```

  

_\*Riverpod Ddd works on iOS, Android, Web, and Windows._

  

---

  

## Running Tests 🧪

  

To run all unit and widget tests use the following command:

  

```sh

  

flutter  test  --coverage  --test-randomize-ordering-seed  random

  

```

  

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

  

```sh

  

# Generate Coverage Report

  

$  genhtml  coverage/lcov.info  -o  coverage/

  

  

# Open Coverage Report

  

$  open  coverage/index.html

  

```

  

---

  

## Working with Translations 🌐

  

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

  

### Adding Strings

  

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

  

```arb

  

{

  

"@@locale": "en",

  

"counterAppBarTitle": "Counter",

  

"@counterAppBarTitle": {

  

"description": "Text shown in the AppBar of the Counter Page"

  

}

  

}

  

```

  

2. Then add a new key/value and description

  

```arb

  

{

  

"@@locale": "en",

  

"counterAppBarTitle": "Counter",

  

"@counterAppBarTitle": {

  

"description": "Text shown in the AppBar of the Counter Page"

  

},

  

"helloWorld": "Hello World",

  

"@helloWorld": {

  

"description": "Hello World Text"

  

}

  

}

  

```

  

3. Use the new string

  

```dart

  

import  'package:riverpod_ddd/l10n/l10n.dart';

  

  

@override

  

Widget  build(BuildContext context) {

  

final l10n = context.l10n;

  

return  Text(l10n.helloWorld);

  

}

  

```

  

### Adding Supported Locales

  

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

  

```xml

  

...

  

  

<key>CFBundleLocalizations</key>

  

<array>

  

<string>en</string>

  

<string>es</string>

  

</array>

  

  

...

  

```

  

### Adding Translations

  

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

  

```

  

├── l10n

  

│ ├── arb

  

│ │ ├── app_en.arb

  

│ │ └── app_es.arb

  

```

  

2. Add the translated strings to each `.arb` file:

  

`app_en.arb`

  

```arb

  

{

  

"@@locale": "en",

  

"counterAppBarTitle": "Counter",

  

"@counterAppBarTitle": {

  

"description": "Text shown in the AppBar of the Counter Page"

  

}

  

}

  

```

  

`app_es.arb`

  

```arb

  

{

  

"@@locale": "es",

  

"counterAppBarTitle": "Contador",

  

"@counterAppBarTitle": {

  

"description": "Texto mostrado en la AppBar de la página del contador"

  

}

  

}

  

```

  

[coverage_badge]: coverage_badge.svg

  

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

  

[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

  

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

  

[license_link]: https://opensource.org/licenses/MIT

  

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

  

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

  

[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

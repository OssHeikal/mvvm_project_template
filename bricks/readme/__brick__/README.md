# {{projectName}}

Short description or introduction of your project.

## Dependencies

Below is a list of default dependencies used in this project:
```yaml
dependencies:
  bot_toast:
  cached_network_image:
  connectivity_plus:
  country_code_picker:
  cupertino_icons:
  dio:
  dartz:
  easy_localization:
  equatable:
  flutter:
    sdk: flutter
  flutter_bloc:
  flutter_inappwebview:
  flutter_secure_storage:
  flutter_svg:
  flutter_screenutil:
  get_it:
  go_router:
  google_fonts:
  image_picker:
  logger:
  permission_handler:
  pin_code_text_field:
  rxdart:
  shared_preferences:
  shimmer:
  url_launcher:
```

## add new feature
    1. install mason if not already installed
    ```shell
    dart pub global activate mason_cli
    ```

    2. add new feature 
    ```shell
    mason make feature -o ./lib/features
    ```

    3. enter feature name 

## add assets folder

    1. install mason if not already installed
    ```shell
    dart pub global activate mason_cli
    ```

    2. add new feature 
    ```shell
    mason make assets -o ./assets
    ```
    ### this adds assets folder that contains icons, images, and lang folders. 

## generate file that contains localization keys:

```shell
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/core/utils" -o "locale_keys.g.dart" -f keys
```



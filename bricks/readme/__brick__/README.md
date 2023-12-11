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

## generate project template:
```shell
mason make project_template -o .././lib
```

## add new feature
- run this command and then enter feature name 
```shell
mason make feature -o .././lib/features
```

### generate assets folder
```shell
mason make assets -o ../assets
```
## Add assets paths in pubspec.yaml file
```yaml
  assets:
    - assets/images/
    - assets/icons/
    - assets/lang/
```

## generate file that contains localization keys:

```shell
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/core/resources" -o "locale_keys.g.dart" -f keys
```



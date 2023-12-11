# mvvm_project_template

This repository provides a set of bricks to streamline Flutter project setup and feature integration. Whether you're starting a new project or adding features to an existing one, this boilerplate generator can save you time and maintain consistency in your codebase.

## Project Structure

The project follows a modular structure to enhance organization and maintainability:
```shell
|-- assets
|-- |-- icons
|-- |-- images
|-- |-- lang
|-- |-- |-- ar.json
|-- |-- |-- en.json
|-- lib
|-- |-- core
|-- |-- |-- configs
|-- |-- |-- |-- extensions
|-- |-- |-- |-- locale
|-- |-- |-- |-- router
|-- |-- |-- |-- theme
|-- |-- |-- data
|-- |-- |-- |-- dio
|-- |-- |-- |-- error
|-- |-- |-- |-- local
|-- |-- |-- |-- remote
|-- |-- |-- models
|-- |-- |-- resources
|-- |-- |-- utils
|-- |-- features
|-- |-- |-- feature_1
|-- |-- |-- |-- models
|-- |-- |-- |-- repository
|-- |-- |-- |-- view
|-- |-- |-- |-- |-- screens
|-- |-- |-- |-- |-- widgets
|-- |-- |-- |-- view_models
|-- README.md
```

## Bricks

### MVVM Flutter Project Template

This brick generates a Flutter project template following the MVVM architecture, promoting a clean and scalable code structure.

### Add New Feature

Use this brick to add a new feature to your project. It ensures proper integration and follows established coding patterns.

### Generate Assets

This brick creates the necessary assets folder with icons, images, and language files, promoting a standardized resource management approach.

### Generate README

Automatically generate a README file for your project, ensuring consistent and informative documentation.


## Usage 

### install maosn cli 
```shell
dart pub global activate mason_cli
```

### add mason to your project 
```shell
mkdir mason
cd mason
mason init
```

### add bricks to mason.yaml file 
```yaml
bricks:
  readme:
    git:
      url: https://github.com/OssHeikal/mvvm_project_template.git
      path: bricks/readme
  assets:
    git:
      url: https://github.com/OssHeikal/mvvm_project_template.git
      path: bricks/assets
  project_template:
    git:
      url: https://github.com/OssHeikal/mvvm_project_template.git
      path: bricks/project_template
  feature:
    git:
      url: https://github.com/OssHeikal/mvvm_project_template.git
      path: bricks/feature   
```

### get bricks 
```shell
mason get
```

### Add default dependencies in pubspec.yaml file
```shell
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

### generate project template:
```shell
mason make project_template -o .././lib
```

### add new feature (enter feature name)
```shell
mason make feature -o .././lib/features 
```

### generate assets folder
```shell
mason make assets -o ../assets
```
### Add assets paths in pubspec.yaml file
```yaml
  assets:
    - assets/images/
    - assets/icons/
    - assets/lang/
```

### generate readme file (enter project name)
```shell
mason make readme -o ../
```

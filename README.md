# mvvm_project_template


This repository provides a set of bricks to streamline Flutter project setup and feature integration. Whether you're starting a new project or adding features to an existing one, this boilerplate generator can save you time and maintain consistency in your codebase.

## Project Structure

The project follows a modular structure to enhance organization and maintainability:

- `lib/`: Core application logic
- `assets/`: Generated assets, including icons, images, and language files
- `templates/`: Brick templates for MVVM project structure and feature additions

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
### Add default dependencies in pubspec.yaml file

Below is a list of default dependencies used in this project:
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
### generate new project template:

1. install mason if not already installed
   ```shell
    dart pub global activate mason_cli
   ```
2. add new project
   ```shell
    mason make project_template -o ./lib
   ```

### generate new feature
1. install mason if not already installed
   ```shell
    dart pub global activate mason_cli
   ```
2. add new feature
   ```shell
    mason make feature -o ./lib/features
   ```
3. enter feature name 

### add assets folder

1. install mason if not already installed
   ```shell
    mason make feature -o ./lib/features
   ```
   
2. add assets folder
    ```shell
    mason make assets -o ./assets
    ```

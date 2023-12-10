import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/{{featureName.snakeCase()}}_repository.dart';

part '{{featureName.snakeCase()}}_state.dart';

class {{featureName.pascalCase()}}Cubit extends Cubit<{{featureName.pascalCase()}}State> {
  final {{featureName.pascalCase()}}Repository {{featureName.camelCase()}}Repository;

  {{featureName.pascalCase()}}Cubit(this.{{featureName.camelCase()}}Repository) : super({{featureName.pascalCase()}}State());
}

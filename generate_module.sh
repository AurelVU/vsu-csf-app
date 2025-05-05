#!/bin/bash

# мне так впадлу перекопировать эти сервисы/менеджеры/презентеры
# что был написан этот скрипт
# генерирует файлы, текст для роутов и регистрации зависимостей
# обязательно принимает первым параметром имя, по которому будет все генерироваться
# и необязательно принимает путь, если нет - использует текущий 
# сразу генерирует фичу, то есть файл, и /presentation, /data и manager

if [ -z "$1" ]; then
    echo "Ошибка: Не передан параметр для генерации. Используйте: $0 <имя_модуля> [путь]"
    exit 1
fi

file_name="$1"

# заранее подготовленное слово с первой заглавной буквой
name="$(tr '[:lower:]' '[:upper:]' <<< "${file_name:0:1}")${file_name:1}"

mkdir ${2:-$PWD}/${file_name}
mkdir ${2:-$PWD}/${file_name}/presentation
mkdir ${2:-$PWD}/${file_name}/data
file_path_presenter="${2:-$PWD}/${file_name}/presentation/${file_name}_presenter.dart"
file_path_screen="${2:-$PWD}/${file_name}/presentation/${file_name}_screen.dart"
file_path_screen_view="${2:-$PWD}/${file_name}/presentation/${file_name}_screen_view.dart"

file_path_service="${2:-$PWD}/${file_name}/data/${file_name}_service.dart"
file_path_repository="${2:-$PWD}/${file_name}/data/${file_name}_repository.dart"
file_path_url="${2:-$PWD}/${file_name}/data/${file_name}_url.dart"

file_path_manager="${2:-$PWD}/${file_name}/${file_name}_manager.dart"




generated_text_for_presenter="import 'package:auto_route/auto_route.dart';

@RoutePage()
class ${name}ScreenPresenter extends LifecycleModule {
  ${name}ScreenPresenter({
    required this.router,
  });

  final StackRouter router;

}
"
generated_text_for_screen="import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


  // ${1}
  // @singleton
  // static final ${name}Repository _${1}Repository =
  //     ${name}Repository(${name}Service(_dio));
  //
  // @singleton
  // ${name}Repository get ${1}Repository => _${1}Repository;
  //
  // static final ${name}Manager _${1}Manager =
  //     ${name}Manager(_${1}Repository);
  //
  // @singleton
  // ${name}Manager get ${1}Manager => _${1}Manager;

  // for router
  // AutoRoute(
  //  page: ${name}Route.page,
  //  path: Routes.${1},
  // ),
  // in Routes
  // static const ${1} = '${name}Screen';



class ${name}Screen extends StatelessWidget {
  const ${name}Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Provider<${name}ScreenPresenter>(
      create: (context) => ${name}ScreenPresenter(
        router: context.router,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const ${name}ScreenView(),
    );
  }
}
"
generated_text_for_screen_view="import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ${name}ScreenView extends StatelessWidget {
  const ${name}ScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<${name}ScreenPresenter>();
    return Scaffold();
  }
}

"

generated_text_for_service="import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';


part '${1}_service.g.dart';

@RestApi()
abstract class ${name}Service {
  factory ${name}Service(Dio dio, {String baseUrl}) = _${name}Service;

  @GET(${name}Url.example)
  Future<void> getExample();

  @POST(${name}Url.example)
  Future<void> postExample({
    @Body() required Example example,
  }
  );


}
"
generated_text_for_repository="

class ${name}Repository {
  ${name}Repository(this._service);

  final ${name}Service _service;

  Future<void> getExample() async {

  }
}
"
generated_text_for_url="abstract class ${name}Url {
  static const example = '/example';
}
"

generated_text_for_manager="import 'package:rxdart/rxdart.dart';


class ${name}Manager extends LifecycleModule {
  ${name}Manager(
    this._${1}Repository,
  );


  final ${name}Repository _${1}Repository;


}
"

echo "$generated_text_for_presenter" >> "$file_path_presenter"
echo "$generated_text_for_screen" >> "$file_path_screen"
echo "$generated_text_for_screen_view" >> "$file_path_screen_view"
echo "$generated_text_for_service" >> "$file_path_service"
echo "$generated_text_for_repository" >> "$file_path_repository"
echo "$generated_text_for_url" >> "$file_path_url"
echo "$generated_text_for_manager" >> "$file_path_manager"
echo "Модуль $name сгенерирован"

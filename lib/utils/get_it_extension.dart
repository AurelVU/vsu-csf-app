import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

extension GetItWithProvider on BuildContext {
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return read<GetIt>().get<T>(param1: param1, param2: param2);
  }

  T? getNullAble<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    try {
      return read<GetIt>().get<T>(param1: param1, param2: param2);
    } catch (_) {
      return null;
    }
  }

  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return read<GetIt>().getAsync<T>(param1: param1, param2: param2);
  }

  Future<T?> getAsyncNullAble<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    try {
      return read<GetIt>().getAsync<T>(param1: param1, param2: param2);
    } catch (_) {
      return Future.value(null);
    }
  }
}

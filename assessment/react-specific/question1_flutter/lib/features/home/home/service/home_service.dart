import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:question1_flutter/features/home/home/model/home_model.dart';

enum _ServicePaths { todos }

abstract class IHomeService {
  late final Dio _dio;

  IHomeService() {
    _dio = Dio(BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/'));
  }
}

class HomeService extends IHomeService {
  @override
  Future<HomeModel?> fetchItems() async {
    try {
      final response = await _dio.get(
        _ServicePaths.todos.name,
        queryParameters: {
          '_start': 0,
          '_limit': 10,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return HomeModel.fromJson(_datas);
        }
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }
}

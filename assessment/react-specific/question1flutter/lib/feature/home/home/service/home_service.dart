import 'dart:io';
import 'package:dio/dio.dart';

import '../model/product_model.dart';

enum _ServicePaths { todos }

abstract class IHomeService {
  Future<List<dynamic>?> fetchItems();
  Future<dynamic> fetchPreviousItems();
  Future<List<dynamic>?> fetchNextItems();
}

class HomeService extends IHomeService {
  late final Dio _dio;
  int startVal = 0;

  HomeService() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'),
    );
  }

  @override
  Future<List<dynamic>?> fetchItems() async {
    try {
      final response = await _dio.get(
        _ServicePaths.todos.name,
        queryParameters: {
          '_start': startVal,
          '_limit': 10,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        return datas;
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }

  @override
  Future<dynamic> fetchPreviousItems() async {
    try {
      if (startVal > 0) {
        startVal -= 10;
        final response = await _dio.get(
          _ServicePaths.todos.name,
          queryParameters: {
            '_start': startVal,
            '_limit': 10,
          },
        );

        if (response.statusCode == HttpStatus.ok) {
          final datas = response.data;
          return datas;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      //
    }
  }

  @override
  Future<List<dynamic>?> fetchNextItems() async {
    try {
      startVal += 10;

      final response = await _dio.get(
        _ServicePaths.todos.name,
        queryParameters: {
          '_start': startVal,
          '_limit': 10,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        return datas;
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }
}

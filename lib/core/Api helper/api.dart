import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio = Dio();

  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response =
          await _dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('Error getting data: $e');
    }
  }

  Future<void> delete({required String url}) async {
    try {
      Response response = await _dio.delete(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        ),
      );

      if (response.statusCode == 200) {
        print('Product deleted successfully');
      } else {
        print('Failed to delete product: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  Future<dynamic> post(model, {required String url}) async {
    try {
      Response response = await _dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        ),
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        print(jsonEncode(model.toJson()));
        return response.data;
      }
    } catch (e) {
      print('Error posting data: $e');
    }
  }

  Future<dynamic> update(model, {required String url}) async {
    try {
      Response response = await _dio.patch(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        ),
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        print(jsonEncode(model.toJson()));
        print('Product updated successfully');
        return response.data;
      } else {
        print('Failed to update product: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error updating product: $e');
    }
  }
}

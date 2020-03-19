import 'dart:io';

import 'package:corona/model/country.dart';
import 'package:corona/widget/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = 'https://corona.lmao.ninja';
  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    dynamic data,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get(
        "$baseUrl$url",
      );
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          print("Error Test");
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }
 static Future<List<Country>> getCountry(
    BuildContext context, {
    Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/countries', params: params);
    return countryFromJson(response.data.toString());
  }
  // static Future<List<Country>> getCountry(
  //   BuildContext context,
  // ) async {
    
  //   var response = await _dio.get("https://corona.lmao.ninja/countries");
  //   // return List<Country>.from(response.data.map((x) => Country.fromJson(x)));
  //   return countryFromJson(response.data);
  // }
}

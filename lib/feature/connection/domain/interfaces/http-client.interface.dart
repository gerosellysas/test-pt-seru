import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Either<DioExceptionType?, Object?>> getData(String url);
}

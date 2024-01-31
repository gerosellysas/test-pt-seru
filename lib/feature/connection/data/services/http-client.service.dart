import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HttpClientService {
  HttpClientService({
    Dio? dio,
  }) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<Either<DioExceptionType?, Object?>> getData(String url) async {
    try {
      Response response = await _dio.get(url);
      return right(response.data);
    } on DioException catch (e) {
      return left(e.type);
    } catch (e) {
      return left(DioExceptionType.unknown);
    }
  }
}

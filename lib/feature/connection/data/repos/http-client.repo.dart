import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_pt_seru/feature/connection/data/services/services.dart';
import 'package:test_pt_seru/feature/connection/domain/interfaces/interfaces.dart';

class HttpClientRepo implements IHttpClient {
  HttpClientRepo({
    HttpClientService? service,
  }) : _service = service ?? HttpClientService();

  final HttpClientService _service;

  @override
  Future<Either<DioExceptionType?, Object?>> getData(String url) async {
    return await _service.getData(url);
  }
}

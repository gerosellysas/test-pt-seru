import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_pt_seru/feature/connection/data/repos/repos.dart';
import 'package:test_pt_seru/feature/connection/domain/interfaces/interfaces.dart';

class HttpClientGetUseCase {
  HttpClientGetUseCase({
    IHttpClient? repo,
  }) : _repo = repo ?? HttpClientRepo();

  final IHttpClient _repo;

  Future<Either<DioExceptionType?, Object?>> execute(String url) async {
    return await _repo.getData(url);
  }
}

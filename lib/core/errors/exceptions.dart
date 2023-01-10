class ServerException implements Exception{}
class EmptyCacheException implements Exception{}
class ConnectionException implements Exception{}
class BaseException implements Exception {
   String? message;
  int? code = 0;

  BaseException({ this.message, this.code});
}
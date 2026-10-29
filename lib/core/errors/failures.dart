import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with API server.');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with API server.');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with API server.');

      case DioExceptionType.badCertificate:
        return const ServerFailure('Invalid server certificate.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode ?? 500,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure('Request to API server was cancelled.');

      case DioExceptionType.connectionError:
        return const ServerFailure(
          'No internet connection. Please check your network.',
        );

      case DioExceptionType.unknown:
        return const ServerFailure(
          'Unexpected error occurred. Please try again.',
        );

      case DioExceptionType.transformTimeout:
        return const ServerFailure('Response transformation timeout.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    final message = _extractMessage(response);

    switch (statusCode) {
      case 400:
        return ServerFailure(
          message ?? 'Bad request. Please check your input.',
        );

      case 401:
        return ServerFailure(message ?? 'Unauthorized. Please log in again.');

      case 403:
        return ServerFailure(message ?? 'Access forbidden.');

      case 404:
        return ServerFailure(message ?? 'Requested resource was not found.');

      case 408:
        return ServerFailure(message ?? 'Request timeout.');

      case 422:
        return ServerFailure(message ?? 'Invalid data provided.');

      case 429:
        return ServerFailure(
          message ?? 'Too many requests. Please try again later.',
        );

      case 500:
        return ServerFailure(message ?? 'Internal server error.');

      case 502:
        return ServerFailure(message ?? 'Bad gateway.');

      case 503:
        return ServerFailure(message ?? 'Service temporarily unavailable.');

      case 504:
        return ServerFailure(message ?? 'Gateway timeout.');

      default:
        if (statusCode >= 500) {
          return ServerFailure(message ?? 'Server error occurred.');
        }

        return ServerFailure(
          message ?? 'Request failed with status code $statusCode.',
        );
    }
  }

  static String? _extractMessage(dynamic response) {
    if (response is! Map) {
      return null;
    }

    // Supports: {"Error": {"message": "..."}}
    final error = response['Error'];
    if (error is Map && error['message'] is String) {
      return error['message'] as String;
    }

    // Supports: {"message": "..."}
    if (response['message'] is String) {
      return response['message'] as String;
    }

    // Supports: {"error": "..."}
    if (response['error'] is String) {
      return response['error'] as String;
    }

    return null;
  }
}

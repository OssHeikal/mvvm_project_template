import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'error_model.dart';
import 'failure.dart';

mixin HandlingException {
  Future<Either<Failure, T>> wrapHandlingException<T>({
    required T Function(dynamic json) jsonConvert,
    required Future<Response<dynamic>> Function() function,
  }) async {
    try {
      final result = await function();
      if (result.statusCode == ResponseCode.SUCCESS ||
          result.statusCode == ResponseCode.NO_CONTENT) {
        // on success
        debugPrint(result.data.toString());
        return Right(jsonConvert(result.data));
      } else {
        return Left(ResponseStatusType.BAD_REQUEST.getFailure());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      print(error);
      failure =
          ServerFailure(message: error.toString(), statusCode: ResponseCode.BAD_REQUEST_Server);
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ResponseStatusType.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return ResponseStatusType.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return ResponseStatusType.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.UNAUTHORIZED:
            return const UnauthenticatedFailure(message: ErrorConstants.unauthorizedError);
          case ResponseCode.BLOCKED:
            return const UserBlockedFailure(message: ErrorConstants.blockedError);
          case ResponseCode.NOT_ALLOWED:
            return const UserNotAllowedFailure(message: ErrorConstants.notAllowed);
          case ResponseCode.Bad_Content:
            return ServerFailure(
                message: ErrorMessageModel.fromJson(error.response?.data).statusMessage,
                statusCode: ResponseCode.Bad_Content);
          case ResponseCode.BAD_REQUEST_Server:
            return ServerFailure(
                message: ErrorMessageModel.fromJson(error.response?.data).statusMessage,
                statusCode: ResponseCode.BAD_REQUEST_Server);
          case ResponseCode.BAD_REQUEST:
            return ServerFailure(
                message: ErrorMessageModel.fromJson(error.response?.data).statusMessage,
                statusCode: ResponseCode.BAD_REQUEST);
          default:
            return ServerFailure(
                message: error.response?.data.toString() ?? '',
                statusCode: error.response?.statusCode ?? ResponseCode.BAD_REQUEST);
        }
      case DioExceptionType.cancel:
        return ResponseStatusType.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return ResponseStatusType.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return ResponseStatusType.BAD_REQUEST.getFailure();
      case DioExceptionType.connectionError:
        return ResponseStatusType.NO_INTERNET_CONNECTION.getFailure();
    }
  }
}

extension ResponseStatusTypeExtension on ResponseStatusType {
  Failure getFailure() {
    switch (this) {
      case ResponseStatusType.SUCCESS:
        return ServerFailure(
            statusCode: ResponseCode.SUCCESS, message: ResponseMessage.SUCCESS.tr());
      case ResponseStatusType.NO_CONTENT:
        return ServerFailure(
            statusCode: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT.tr());
      case ResponseStatusType.BAD_REQUEST:
        return ServerFailure(
            statusCode: ResponseCode.BAD_REQUEST, message: ResponseMessage.BAD_REQUEST.tr());
      case ResponseStatusType.FORBIDDEN:
        return ServerFailure(
            statusCode: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN.tr());
      case ResponseStatusType.UNAUTHORIZED:
        return ServerFailure(
            statusCode: ResponseCode.UNAUTHORIZED, message: ResponseMessage.UNAUTHORIZED.tr());
      case ResponseStatusType.NOT_FOUND:
        return ServerFailure(
            statusCode: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND.tr());
      case ResponseStatusType.INTERNAL_SERVER_ERROR:
        return ServerFailure(
            statusCode: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR.tr());
      case ResponseStatusType.CONNECT_TIMEOUT:
        return ServerFailure(
            statusCode: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT.tr());
      case ResponseStatusType.CANCEL:
        return ServerFailure(statusCode: ResponseCode.CANCEL, message: ResponseMessage.CANCEL.tr());
      case ResponseStatusType.RECEIVE_TIMEOUT:
        return ServerFailure(
            statusCode: ResponseCode.RECEIVE_TIMEOUT,
            message: ResponseMessage.RECEIVE_TIMEOUT.tr());
      case ResponseStatusType.SEND_TIMEOUT:
        return ServerFailure(
            statusCode: ResponseCode.SEND_TIMEOUT, message: ResponseMessage.SEND_TIMEOUT.tr());
      case ResponseStatusType.CACHE_ERROR:
        return ServerFailure(
            statusCode: ResponseCode.CACHE_ERROR, message: ResponseMessage.CACHE_ERROR.tr());
      case ResponseStatusType.NO_INTERNET_CONNECTION:
        return ServerFailure(
            statusCode: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION.tr());
      case ResponseStatusType.DEFAULT:
        return ServerFailure(
            statusCode: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT.tr());
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // ServerFailure, API rejected request
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int NOT_ALLOWED = 405; // failure, not allowed
  static const int BLOCKED = 420; // failure,blocked
  static const int Bad_Content = 422; // failure, Bad_Content
  static const int BAD_REQUEST_Server = 402; // ServerFailure, API rejected request

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = ErrorConstants.success; // success with data
  static const String NO_CONTENT = ErrorConstants.success; // success with no data (no content)
  static const String BAD_REQUEST = ErrorConstants.badRequestError; // failure, API rejected request
  static const String UNAUTHORIZED =
      ErrorConstants.unauthorizedError; // failure, user is not authorized
  static const String FORBIDDEN = ErrorConstants.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ErrorConstants.internalServerError; // failure, crash in server side
  static const String NOT_FOUND = ErrorConstants.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = ErrorConstants.timeoutError;
  static const String CANCEL = ErrorConstants.defaultError;
  static const String RECEIVE_TIMEOUT = ErrorConstants.timeoutError;
  static const String SEND_TIMEOUT = ErrorConstants.timeoutError;
  static const String CACHE_ERROR = ErrorConstants.cacheError;
  static const String NO_INTERNET_CONNECTION = ErrorConstants.noInternetError;
  static const String DEFAULT = ErrorConstants.defaultError;
}

class ErrorConstants {
  ErrorConstants._();
  // error handler
  static const String success = "success";
  static const String badRequestError = "bad_request_error";
  static const String noContent = "no_content";
  static const String forbiddenError = "forbidden_error";
  static const String unauthorizedError = "unauthorized_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String blockedError = "blocked_error";
  static const String internalServerError = "internal_server_error";
  static const String notAllowed = "internal_server_error";

  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "default_error";
  static const String cacheError = "cache_error";
  static const String noInternetError = "no_internet_error";
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

enum ResponseStatusType {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

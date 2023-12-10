import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'error_constants.dart';
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
            return UnauthenticatedFailure(message: ErrorConstants.unauthorizedError);
          case ResponseCode.BLOCKED:
            return UserBlockedFailure(message: ErrorConstants.blockedError);
          case ResponseCode.NOT_ALLOWED:
            return UserNotAllowedFailure(message: ErrorConstants.notAllowed);
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

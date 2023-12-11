class ErrorConstants {
  ErrorConstants._();
  // error handler
  static String success = "success";
  static String badRequestError = "bad_request_error";
  static String noContent = "no_content";
  static String forbiddenError = "forbidden_error";
  static String unauthorizedError = "unauthorized_error";
  static String notFoundError = "not_found_error";
  static String conflictError = "conflict_error";
  static String blockedError = "blocked_error";
  static String internalServerError = "internal_server_error";
  static String notAllowed = "internal_server_error";

  static String unknownError = "unknown_error";
  static String timeoutError = "timeout_error";
  static String defaultError = "default_error";
  static String cacheError = "cache_error";
  static String noInternetError = "no_internet_error";
}

class ResponseMessage {
  static String SUCCESS = ErrorConstants.success;
  static String NO_CONTENT = ErrorConstants.success;
  static String BAD_REQUEST = ErrorConstants.badRequestError;
  static String UNAUTHORIZED = ErrorConstants.unauthorizedError;
  static String FORBIDDEN = ErrorConstants.forbiddenError;
  static String INTERNAL_SERVER_ERROR = ErrorConstants.internalServerError;
  static String NOT_FOUND = ErrorConstants.notFoundError;

  // local status code
  static String CONNECT_TIMEOUT = ErrorConstants.timeoutError;
  static String CANCEL = ErrorConstants.defaultError;
  static String RECEIVE_TIMEOUT = ErrorConstants.timeoutError;
  static String SEND_TIMEOUT = ErrorConstants.timeoutError;
  static String CACHE_ERROR = ErrorConstants.cacheError;
  static String NO_INTERNET_CONNECTION = ErrorConstants.noInternetError;
  static String DEFAULT = ErrorConstants.defaultError;
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

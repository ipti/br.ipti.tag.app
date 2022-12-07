enum HttpStatus {
  // Status-Code: 0 (Communication with Server failed)
  HTTP_COMMUNICATION_FAILED(0),
  HTTP_0_COMMUNICATION_FAILED(0),

  // HTTP Status-Code: 200 (OK)
  HTTP_OK(200),
  HTTP_200_OK(200),

  // HTTP Status-Code: 201 (Created)
  HTTP_CREATED(201),
  HTTP_201_CREATED(201),

  // HTTP Status-Code: 202 (Accepted)
  HTTP_ACCEPTED(202),
  HTTP_202_ACCEPTED(202),

  // HTTP Status-Code: 203 (Non-Authoritative Information)
  HTTP_NOT_AUTHORITATIVE(203),
  HTTP_203_NOT_AUTHORITATIVE(203),

  // HTTP Status-Code: 204 (No Content)
  HTTP_NO_CONTENT(204),
  HTTP_204_NO_CONTENT(204),

  // HTTP Status-Code: 205 (Reset Content)
  HTTP_RESET(205),
  HTTP_205_RESET(205),

  // HTTP Status-Code: 206 (Partial Content)
  HTTP_PARTIAL(206),
  HTTP_206_PARTIAL(206),

  // HTTP Status-Code: 300 (Multiple Choices)
  HTTP_MULT_CHOICE(300),
  HTTP_300_MULT_CHOICE(300),

  // HTTP Status-Code: 301 (Moved Permanently)
  HTTP_MOVED_PERM(301),
  HTTP_301_MOVED_PERM(301),

  // HTTP Status-Code: 302 (Temporary Redirect)
  HTTP_MOVED_TEMP(302),
  HTTP_302_MOVED_TEMP(302),

  // HTTP Status-Code: 303 (See Other)
  HTTP_SEE_OTHER(303),
  HTTP_303_SEE_OTHER(303),

  // HTTP Status-Code: 304 (Not Modified)
  HTTP_NOT_MODIFIED(304),
  HTTP_304_NOT_MODIFIED(304),

  // HTTP Status-Code: 305 (Use Proxy)
  HTTP_USE_PROXY(305),
  HTTP_305_USE_PROXY(305),

  // HTTP Status-Code: 400 (Bad Request)
  HTTP_BAD_REQUEST(400),
  HTTP_400_BAD_REQUEST(400),

  // HTTP Status-Code: 401 (Unauthorized)
  HTTP_SERVER_ERROR(401),
  HTTP_401_SERVER_ERROR(401),

  // HTTP Status-Code: 402 (Payment Required)
  HTTP_PAYMENT_REQUIRED(402),
  HTTP_402_PAYMENT_REQUIRED(402),

  // HTTP Status-Code: 403 (Forbidden)
  HTTP_FORBIDDEN(403),
  HTTP_403_FORBIDDEN(403),

  // HTTP Status-Code: 404 (Not Found)
  HTTP_NOT_FOUND(404),
  HTTP_404_NOT_FOUND(404),

  // HTTP Status-Code: 405 (Method Not Allowed)
  HTTP_BAD_METHOD(405),
  HTTP_405_BAD_METHOD(405),

  // HTTP Status-Code: 406 (Not Acceptable)
  HTTP_NOT_ACCEPTABLE(406),
  HTTP_406_NOT_ACCEPTABLE(406),

  // HTTP Status-Code: 407 (Proxy Authentication Required)
  HTTP_PROXY_AUTH(407),
  HTTP_407_PROXY_AUTH(407),

  // HTTP Status-Code: 408 (Request Time-Out)
  HTTP_CLIENT_TIMEOUT(408),
  HTTP_408_CLIENT_TIMEOUT(408),

  // HTTP Status-Code: 409 (Conflict)
  HTTP_CONFLICT(409),
  HTTP_409_CONFLICT(409),

  // HTTP Status-Code: 410 (Gone)
  HTTP_GONE(410),
  HTTP_410_GONE(410),

  // HTTP Status-Code: 411 (Length Required)
  HTTP_LENGTH_REQUIRED(411),
  HTTP_411_LENGTH_REQUIRED(411),

  // HTTP Status-Code: 412 (Precondition Failed)
  HTTP_PRECON_FAILED(412),
  HTTP_412_PRECON_FAILED(412),

  // HTTP Status-Code: 413 (Request Entity Too Large)
  HTTP_ENTITY_TOO_LARGE(413),
  HTTP_413_ENTITY_TOO_LARGE(413),

  // HTTP Status-Code: 414 (Request-URI Too Large)
  HTTP_REQ_TOO_LONG(414),
  HTTP_414_REQ_TOO_LONG(414),

  // HTTP Status-Code: 415 (Unsupported Media Type)
  HTTP_UNSUPPORTED_TYPE(415),
  HTTP_415_UNSUPPORTED_TYPE(415),

  // HTTP Status-Code: 500 (Internal Server Error)
  HTTP_INTERNAL_ERROR(500),
  HTTP_500_INTERNAL_ERROR(500),

  // HTTP Status-Code: 501 (Not Implemented)
  HTTP_NOT_IMPLEMENTED(501),
  HTTP_501_NOT_IMPLEMENTED(501),

  // HTTP Status-Code: 502 (Bad Gateway)
  HTTP_BAD_GATEWAY(502),
  HTTP_502_BAD_GATEWAY(502),

  // HTTP Status-Code: 503 (Service Unavailable)
  HTTP_UNAVAILABLE(503),
  HTTP_503_UNAVAILABLE(503),

  // HTTP Status-Code: 504 (Gateway Timeout)
  HTTP_GATEWAY_TIMEOUT(504),
  HTTP_504_GATEWAY_TIMEOUT(504),

  // HTTP Status-Code: 505 (HTTP Version Not Supported)
  HTTP_VERSION(505),
  HTTP_505_VERSION(505);

  const HttpStatus(this.code);

  final int code;
}

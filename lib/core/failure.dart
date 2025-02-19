abstract class Failures {
  String ErrorMessage;

  Failures({required this.ErrorMessage});
}

class ServerError extends Failures {
  ServerError({required super.ErrorMessage});
}

class NetworkError extends Failures {
  NetworkError({required super.ErrorMessage});
}

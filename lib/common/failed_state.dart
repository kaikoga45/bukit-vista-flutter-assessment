abstract class Failure {
  final String message;

  Failure(this.message);
}

class JsonParsingFailure extends Failure {
  JsonParsingFailure(String message) : super(message);
}

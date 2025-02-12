class Failure {
  final String message;

  const Failure({required this.message});
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super(message: 'Unknown failure occurred');
}

abstract class FailureInterface implements Exception {
  String get message;
}

class ErrorSaveTaskEntity implements FailureInterface {
  @override
  final String message;
  ErrorSaveTaskEntity({required this.message});
}

class ErrorFetchTaskEntity implements FailureInterface {
  @override
  final String message;
  ErrorFetchTaskEntity({required this.message});
}

class ErrorUpdateTaskEntity implements FailureInterface {
  @override
  final String message;
  ErrorUpdateTaskEntity({required this.message});
}

class ErrorRemoveTaskEntity implements FailureInterface {
  @override
  final String message;
  ErrorRemoveTaskEntity({required this.message});
}

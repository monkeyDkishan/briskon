part of utils;

class Result<T> {
  Status? state;
  T? response;
  String? msg;

  Result();

  Result.loading(this.msg) : state = Status.loading;

  Result.completed(this.response) : state = Status.completed;

  Result.error(this.msg) : state = Status.error;

  Result.unAuthorise(this.msg) : state = Status.unAuthorised;

  @override
  String toString() {
    return "Status : $state \n Message : $msg \n Data : $response";
  }
}


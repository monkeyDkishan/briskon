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

class ResultBuilder extends StatelessWidget {
  const ResultBuilder({Key? key, required this.result, required this.child}) : super(key: key);

  final Result result;
  final Widget child;

  @override
  Widget build(BuildContext context) {

    switch(result.state) {
      case Status.loading:
        return const Center(child: LoadingSmall());
      case Status.completed:
        return child;
      case Status.error:
        return Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(result.msg ?? ""),
        ));
      case Status.unAuthorised:
        return Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(result.msg ?? ""),
        ));
      default:
        return const SizedBox.shrink();
    }

  }
}

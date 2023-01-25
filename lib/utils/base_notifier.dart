part of utils;

class BaseNotifier extends ChangeNotifier{

  resIsLoading(Result res){

    res.state = Status.loading;

    notifyListeners();
  }

  resIsSuccess<T>(Result res,T data){

    res.state = Status.completed;

    res.response = data;

    notifyListeners();
  }

  resIsFailed(Result res,Object e){

    res.state = Status.error;

    res.msg = e.toString();

    notifyListeners();
  }

}
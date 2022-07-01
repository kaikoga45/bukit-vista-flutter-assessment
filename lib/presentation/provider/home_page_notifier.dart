import 'package:bukit_vista_flutter_assessment/common/enum_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/domain/use_case/get_guess.dart';
import 'package:flutter/material.dart';

class HomePageNotifier extends ChangeNotifier {
  HomePageNotifier({required this.getGuess});

  // This is the state of the request.
  List<Guess> _guess = [];
  List<Guess> get guess => _guess;

  RequestState _requestState = RequestState.none;
  RequestState get requestState => _requestState;

  //
  String _message = '';
  String get message => _message;

  final GetGuess getGuess;

  /*
    This is a method to get the guess list.
  */
  Future<void> getGuessList() async {
    /*
      Set state to loading and notify the listeners.
      So that the loading indicator will be shown to the user.
    */
    _requestState = RequestState.loading;
    notifyListeners();

    // Get the guess list.
    final result = await getGuess.execute();

    return result.fold((failed) {
      /*
        If the request failed, set the state to error and set the message.
        So that the error message will be shown to the user.
      */
      _requestState = RequestState.error;
      _message = failed.message;
      notifyListeners();
    }, (guess) {
      /*
        If the request succeeded, set the state to loaded and set the guess list.
        So that the guess list will be shown to the user.
      */
      _requestState = RequestState.loaded;
      _guess = guess;
      notifyListeners();
    });
  }
}

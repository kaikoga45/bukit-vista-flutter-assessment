import 'package:bukit_vista_flutter_assessment/domain/repository/guess_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failed_state.dart';
import '../entities/guess.dart';

class GetGuess {
  const GetGuess({required this.repository});

  final GuessRepository repository;

  Future<Either<Failure, List<Guess>>> execute() async {
    return await repository.getGuess();
  }
}

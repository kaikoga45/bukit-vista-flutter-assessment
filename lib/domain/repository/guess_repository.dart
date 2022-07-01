import 'package:bukit_vista_flutter_assessment/common/failed_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:dartz/dartz.dart';

// This is the interface of the repository.
abstract class GuessRepository {
  Future<Either<Failure, List<Guess>>> getGuess();
}

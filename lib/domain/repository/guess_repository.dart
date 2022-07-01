import 'package:bukit_vista_flutter_assessment/common/failed_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:dartz/dartz.dart';

abstract class GuessRepository {
  Future<Either<Failure, List<Guess>>> getGuess();
}

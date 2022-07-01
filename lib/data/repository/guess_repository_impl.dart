import 'package:bukit_vista_flutter_assessment/data/data_sources/guess_local_data_source.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';
import 'package:bukit_vista_flutter_assessment/common/failed_state.dart';
import 'package:bukit_vista_flutter_assessment/domain/repository/guess_repository.dart';
import 'package:dartz/dartz.dart';

class GuessRepositoryImpl implements GuessRepository {
  const GuessRepositoryImpl({required this.localDataSource});

  final GuessLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Guess>>> getGuess() async {
    try {
      final result = await localDataSource.getGuess();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(JsonParsingFailure(e.toString()));
    }
  }
}

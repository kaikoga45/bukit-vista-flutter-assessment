import 'package:bukit_vista_flutter_assessment/data/data_sources/guess_local_data_source.dart';
import 'package:bukit_vista_flutter_assessment/data/repository/guess_repository_impl.dart';
import 'package:bukit_vista_flutter_assessment/domain/repository/guess_repository.dart';
import 'package:bukit_vista_flutter_assessment/domain/use_case/get_guess.dart';
import 'package:bukit_vista_flutter_assessment/presentation/provider/home_page_notifier.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // Repository
  locator.registerLazySingleton<GuessRepository>(
    () => GuessRepositoryImpl(
      localDataSource: locator(),
    ),
  );

  // Data Source
  locator.registerLazySingleton<GuessLocalDataSource>(
      () => GuessLocalDataSourceImpl(client: locator()));

  // Provider
  locator.registerFactory(() => HomePageNotifier(getGuess: locator()));

  // Use Case
  locator.registerLazySingleton(() => GetGuess(repository: locator()));

  // External
  locator.registerLazySingleton(() => rootBundle);
}

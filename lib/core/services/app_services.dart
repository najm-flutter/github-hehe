import 'package:get_it/get_it.dart';
import 'package:github_hehe/features/home/data/datasources/home_remote_data.dart';
import 'package:github_hehe/features/home/data/repositories/home_repo_imp.dart';
import 'package:github_hehe/features/home/domain/repositories/home_repo.dart';
import 'package:github_hehe/features/home/domain/usecases/get_hehe_git_hub.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //!home
  //?cubit
  sl.registerFactory(() => GetHeheCubit(getHeheGitHub: sl()));
  //?useCase
  sl.registerLazySingleton(() => GetHeheGitHub(homeRepo: sl()));
  //?repo
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImp(homeRemoteData: sl()));
  //?dataSource
  sl.registerLazySingleton<HomeRemoteData>(() => HomeRemoteDataImp());
}

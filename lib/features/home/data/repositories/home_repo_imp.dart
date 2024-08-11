import 'package:github_hehe/core/constant/app_strings.dart';
import 'package:github_hehe/features/home/data/datasources/home_remote_data.dart';
import 'package:github_hehe/features/home/domain/repositories/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteData homeRemoteData   ;

  HomeRepoImp({required this.homeRemoteData});
  
  @override
  Future<String> getHeheGitHub(String userGitId , String language) async{
    try {
     return await homeRemoteData.getHeheGitHub(userGitId , language) ;
    } catch (e) {
      return AppStrings.errorGemini;
    }
  }
   

}
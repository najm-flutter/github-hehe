import 'package:github_hehe/features/home/domain/repositories/home_repo.dart';

class GetHeheGitHub {
  final HomeRepo homeRepo;

  GetHeheGitHub({required this.homeRepo});
  Future<String> call(String userGitId, String language) async {
    return await homeRepo.getHeheGitHub(userGitId, language);
  }
}

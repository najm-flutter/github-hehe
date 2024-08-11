import 'dart:convert';
import 'package:github_hehe/core/constant/app_strings.dart';
import 'package:github_hehe/features/home/data/datasources/static_home_data.dart';
import 'package:github_hehe/features/home/data/models/repos_user_model.dart';
import 'package:github_hehe/features/home/data/models/user_info_model.dart';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class HomeRemoteData {
  Future<String> getHeheGitHub(String userGitId, String language);
}

class HomeRemoteDataImp extends HomeRemoteData {
  @override
  Future<String> getHeheGitHub(String userGitId, String language) async {
    const apiKey = String.fromEnvironment('API_KEY');
    String? userData = await dataUserFromGitHub(userGitId, language);
    if (userData == null) {
      return AppStrings.errorGitUser;
    }

    final safetySettings = [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
    ];

    GenerativeModel? model = GenerativeModel(
        model: 'gemini-1.5-pro',
        apiKey: apiKey,
        systemInstruction: Content.system(StaticHomeData.prompt),
        safetySettings: safetySettings);
    ChatSession? chat = model.startChat(history: StaticHomeData.chat);
    final response = await chat.sendMessage(Content.text(userData));

    //rest chat
    chat = null;
    model = null;
    chat = model?.startChat(history: []);

    return response.text!;
  }

  //hleping function

  Future<String?> dataUserFromGitHub(String userGitId, String language) async {
    //get user info and user repos info
    Map<String, String>? headers = {"Accept": "application/vnd.github+json", "X-GitHub-Api-Version": "2022-11-28"};
    try {
      var responseUserInfo =
          await http.get(Uri.parse("https://api.github.com/users/${userGitId.trim()}"), headers: headers);
      if (responseUserInfo.statusCode != 200 && responseUserInfo.statusCode != 201) {
        return null;
      }
      final data = jsonDecode(responseUserInfo.body);
      UserInfoModel userInfoModel = UserInfoModel.fromjson(data);
      var responseUserRepos = await http.get(Uri.parse(userInfoModel.reposUrl!), headers: headers);
      List reposUser = jsonDecode(responseUserRepos.body);
      List repos = reposUser.map((toElement) => ReposUserModel.fromJson(toElement).toJson()).toList();
      print(showLastRepos(repos));
      return """
give a  harsh roasting be $language language  for the following github profile: $userGitId. Here are the details: "user info on gitHub  :
${userInfoModel.toJson()}
user repos Info : 
${showLastRepos(repos)}"

""";
    } catch (e) {
      return null;
    }
  }

  String showLastRepos(List repos) {
    String data = "";
    for (var i = 0; i < repos.length; i++) {
      int index = repos.length - i;
      if (repos.length >= 30) {
        if (index > 15) {
          data += "\n${repos[index - 1]},\n";
        }
      } else {
        data += "\n${repos[i]},\n";
      }
    }

    return "[$data]";
  }
}

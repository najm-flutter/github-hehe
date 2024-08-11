import 'package:github_hehe/features/home/domain/entities/repos_user_ent.dart';

class ReposUserModel extends ReposUserEnt {
  const ReposUserModel(
      {required super.name,
      required super.description,
      required super.size,
      required super.language,
      required super.openIssuesCount,
      required super.forks,
      required super.openIssues,
      required super.watchers});
      factory ReposUserModel.fromJson(Map<String, dynamic> json) {
    return ReposUserModel(
      name: json['name'],
      description: json['description'],
      size: json['size'],
      language: json['language'],
      openIssuesCount: json['open_issues_count'],
      forks: json['forks'],
      openIssues: json['open_issues'],
      watchers: json['watchers'],
    );
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    data['name'] = name;
    data['description'] = description;
    data['size'] = size;
    data['language'] = language;
    data['open_issues_count'] = openIssuesCount;
    data['forks'] = forks;
    data['open_issues'] = openIssues;
    data['watchers'] = watchers;
    return data;
  }
}

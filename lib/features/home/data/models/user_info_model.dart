import 'package:github_hehe/features/home/domain/entities/user_info_ent.dart';

class UserInfoModel extends UserInfoEnt {
  const UserInfoModel({
    required super.login,
    required super.reposUrl,
    required super.type,
    required super.name,
    required super.company,
    required super.blog,
    required super.location,
    required super.email,
    required super.bio,
    required super.publicRepos,
    required super.publicGists,
    required super.followers,
    required super.following,
    required super.privateGists,
    required super.totalPrivateRepos,
    required super.ownedPrivateRepos,
  });
  factory UserInfoModel.fromjson(Map<String, dynamic> json) {
    return UserInfoModel(
      login: json['login']??"",
      reposUrl: json['repos_url']??"",
      type: json['type']??"",
      name: json['name']??"",
      company: json['company']??"",
      blog: json['blog']??"",
      location: json['location']??"",
      email: json['email']??"",
      bio: json['bio']??"",
      publicRepos: json['public_repos'],
      publicGists: json['public_gists'],
      followers: json['followers'],
      following: json['following'] ,
      privateGists: json['private_gists'],
      totalPrivateRepos: json['total_private_repos'],
      ownedPrivateRepos: json['owned_private_repos'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['repos_url'] = reposUrl;
    data['type'] = type;
    data['name'] = name;
    data['company'] = company;
    data['blog'] = blog;
    data['location'] = location;
    data['email'] = email;
    data['bio'] = bio;
    data['public_repos'] = publicRepos;
    data['public_gists'] = publicGists;
    data['followers'] = followers;
    data['following'] = following;
    data['private_gists'] = privateGists;
    data['total_private_repos'] = totalPrivateRepos;
    data['owned_private_repos'] = ownedPrivateRepos;
    return data;
  }
}

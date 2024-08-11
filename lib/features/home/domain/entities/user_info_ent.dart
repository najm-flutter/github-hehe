import 'package:equatable/equatable.dart';

class UserInfoEnt extends Equatable {
  final String? login;
  final String? reposUrl;
  final String? type;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final String? bio;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final int? privateGists;
  final int? totalPrivateRepos;
  final int? ownedPrivateRepos;

  const UserInfoEnt({
    required this.login,
    required this.reposUrl,
    required this.type,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.privateGists,
    required this.totalPrivateRepos,
    required this.ownedPrivateRepos,
  });

  @override
  List<Object?> get props => [
        login,
        reposUrl,
        type,
        name,
        company,
        blog,
        location,
        email,
        bio,
        publicRepos,
        publicGists,
        followers,
        following,
        privateGists,
        totalPrivateRepos,
        ownedPrivateRepos,
      ];
}

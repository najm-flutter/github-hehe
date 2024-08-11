import 'package:equatable/equatable.dart';

class ReposUserEnt extends Equatable {
  final String? name;
  final String? description;
  final int? size;
  final String? language;
  final int? openIssuesCount;
  final int? forks;
  final int ?openIssues;
  final int ?watchers;

  const ReposUserEnt({
    required this.name,
   required this.description,
   required this.size,
   required this.language,
   required this.openIssuesCount,
   required this.forks,
   required this.openIssues,
   required this.watchers,
  });

  

  @override
  List<Object?> get props => [
        name,
        description,
        size,
        language,
        openIssuesCount,
        forks,
        openIssues,
        watchers,
      ];
}

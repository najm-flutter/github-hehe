import 'package:flutter/material.dart';
import 'package:github_hehe/core/constant/app_strings.dart';

class TitleWidget extends StatelessWidget {
const TitleWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Text(
                  AppStrings.githubHehe,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                );
  }
}
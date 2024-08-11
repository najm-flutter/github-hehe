import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/features/home/data/datasources/static_home_data.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';

class ChooseLangWidget extends StatelessWidget {
  const ChooseLangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: DropdownMenu(
        initialSelection: BlocProvider.of<GetHeheCubit>(context).languageSelected,
        onSelected: (value) {
          BlocProvider.of<GetHeheCubit>(context).languageSelected = value;
          BlocProvider.of<GetHeheCubit>(context).checkIsReadyToDSend();
        },
        dropdownMenuEntries: StaticHomeData.languages
            .map((toElement) => DropdownMenuEntry(value: toElement["lang"], label: toElement["lang"]))
            .toList(),
        expandedInsets: const EdgeInsets.all(0),
        menuHeight: 300,
      ),
    );
  }
}

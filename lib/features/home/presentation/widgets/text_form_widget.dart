import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/core/constant/app_strings.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.maxFinite,
      child: TextFormField(
        controller: BlocProvider.of<GetHeheCubit>(context).textCo ,
        onChanged: (value) {
          BlocProvider.of<GetHeheCubit>(context).checkIsReadyToDSend();
        },
        cursorColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        decoration: InputDecoration(
          hintText: AppStrings.enterName,
          isDense: true,
          border: const OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(0.6), width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.3), width: 2)),
        ),
      ),
    );
  }
}

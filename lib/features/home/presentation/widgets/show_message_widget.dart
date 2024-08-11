import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/core/constant/app_strings.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';

class ShowMessageWidget extends StatelessWidget {
  const ShowMessageWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            textAlign: TextAlign.center,
            textDirection: context.watch<GetHeheCubit>().textDirection ? TextDirection.rtl : TextDirection.ltr ,
          ),
          _changeDirectionWidget(context),
          _button(
              context: context,
              title: AppStrings.copy,
              color: const Color(0xffc084fc),
              onTap: () => context.read<GetHeheCubit>().copyText(context)),
        ]),
      ),
    );
  }

  Widget _button({required BuildContext context, required String title, required Color color, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.maxFinite,
        height: 40,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }

  Widget _changeDirectionWidget(BuildContext context) {
    return SwitchListTile(
        value: (context.read<GetHeheCubit>().textDirection),
        title: const Text("Change text direction"),
        onChanged: (value) {
          context.read<GetHeheCubit>().changeDirection(value);
        });
  }
}

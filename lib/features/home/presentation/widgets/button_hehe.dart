import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/core/constant/app_strings.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';

class ButtonHehe extends StatelessWidget {
  const ButtonHehe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHeheCubit, GetHeheState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: !(state.status == GetHeheStatus.loading
              ? !(state.status == GetHeheStatus.loading)
              : context.read<GetHeheCubit>().readyToSend),
          child: Opacity(
            opacity: (state.status == GetHeheStatus.loading
                    ? !(state.status == GetHeheStatus.loading)
                    : context.read<GetHeheCubit>().readyToSend)
                ? 1
                : 0.5,
            child: InkWell(
              onTap: () => context.read<GetHeheCubit>().getHeheFromGitHub(),
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: BoxDecoration(color: const Color(0xffA855f7), borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    state.status == GetHeheStatus.loading ? AppStrings.loading : AppStrings.start,
                    style:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';
import 'package:github_hehe/features/home/presentation/widgets/button_hehe.dart';
import 'package:github_hehe/features/home/presentation/widgets/choose_lang_widget.dart';
import 'package:github_hehe/features/home/presentation/widgets/show_message_widget.dart';
import 'package:github_hehe/features/home/presentation/widgets/star_ai_tools_banner.dart';
import 'package:github_hehe/features/home/presentation/widgets/text_form_widget.dart';
import 'package:github_hehe/features/home/presentation/widgets/title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 416),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TitleWidget(),
                TextFormWidget(),
                ChooseLangWidget(),
                ButtonHehe(),
                BlocBuilder<GetHeheCubit, GetHeheState>(
                  builder: (context, state) {
                    return state.status == GetHeheStatus.success ||
                            context.read<GetHeheCubit>().currentMessage.isNotEmpty
                        ? state.status == GetHeheStatus.loading
                            ? SizedBox()
                            : ShowMessageWidget(message: state.message)
                        : SizedBox();
                  },
                ),
                StarAIToolsBanner()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

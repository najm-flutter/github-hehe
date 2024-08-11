import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_hehe/core/constant/app_strings.dart';
import 'package:github_hehe/features/home/domain/usecases/get_hehe_git_hub.dart';
import 'package:url_launcher/url_launcher.dart';
part 'get_hehe_state.dart';

class GetHeheCubit extends Cubit<GetHeheState> {
  final TextEditingController textCo = TextEditingController();
  String languageSelected = "English"; //? defult lang \\init language//
  bool readyToSend = false;
  String currentMessage = "";
  bool  textDirection = false;
  final GetHeheGitHub getHeheGitHub;
  GetHeheCubit({required this.getHeheGitHub}) : super(const GetHeheState());
//
  Future<void> getHeheFromGitHub() async {
    emit(state.copyWith(status: GetHeheStatus.loading));
    final message = await getHeheGitHub.call(textCo.text, languageSelected);
    currentMessage = message;
    emit(state.copyWith(status: GetHeheStatus.success, message: message));
  }

  // Other function

  void checkIsReadyToDSend() {
    if (textCo.text.isNotEmpty) {
      readyToSend = true;
      emit(state.copyWith(status: GetHeheStatus.onReadyToSend));
    } else {
      readyToSend = false;
      emit(state.copyWith(status: GetHeheStatus.noTReadyToSend));
    }
  }

  void copyText(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: currentMessage)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.doneCopy)));
    });
  }

  void openUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }

  void changeDirection(bool value) {
    emit(state.copyWith(status: GetHeheStatus.noTReadyToSend));
    textDirection = value  ;
    emit(state.copyWith(status: GetHeheStatus.onReadyToSend));
  }
}

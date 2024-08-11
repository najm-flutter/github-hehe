import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/core/constant/app_images.dart';
import 'package:github_hehe/core/constant/app_links.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';
// import 'package:url_launcher/url_launcher.dart';

class StarAIToolsBanner extends StatelessWidget {
  const StarAIToolsBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.maxFinite,
              child: Image.network(
                "https://m.media-amazon.com/images/I/71RUBGC0BJL.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text("Star AI Tools"),
                          subtitle: Text(
                              "Video and text translation - spell checker - text extraction, all of this is free in Star AI."),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage("https://m.media-amazon.com/images/I/51Tf4fB1lJL.png"),
                          ),
                          titleAlignment: ListTileTitleAlignment.top,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
                    decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _button(AppImages.amazon, () => context.read<GetHeheCubit>().openUrl(AppLinks.starAiAmazon)),
                        const SizedBox(
                          height: 15,
                        ),
                        _button(AppImages.drive, () => context.read<GetHeheCubit>().openUrl(AppLinks.starAiDrive)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String image, void Function()? onTap) {
    return InkWell(onTap: onTap, child: SizedBox(width: 90, child: Image.asset(image)));
  }
}

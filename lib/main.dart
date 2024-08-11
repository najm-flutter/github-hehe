import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_hehe/features/home/presentation/bloc/get_hehe_cubit/get_hehe_cubit.dart';
import 'package:github_hehe/features/home/presentation/pages/home_page.dart';
import 'package:github_hehe/core/services/app_services.dart' as id;

void main() async {
  await id.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Hehe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9333ea), primary: const Color(0xFF9333ea)),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => id.sl<GetHeheCubit>(),
        child: const HomePage(),
      ),
    );
  }
}

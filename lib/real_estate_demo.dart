import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/landing/presentation/pages/landing_page.dart';

class RealEstateDemo extends StatefulWidget {
  const RealEstateDemo({super.key});

  @override
  State<RealEstateDemo> createState() => _RealEstateDemoState();
}

class _RealEstateDemoState extends State<RealEstateDemo> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        //print('CHAT ID is... My Canvas Builder :: ${chatId}');
        return const MyApp();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: ScreenUtilInit(
        designSize: const Size(390, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Real Estate',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LandingPage(),
        ),
      ),
    );
  }
}

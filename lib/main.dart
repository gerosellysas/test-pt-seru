import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/sources/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
        child: GetMaterialApp(
          initialRoute: initialRoute,
          getPages: Nav.routes,
          theme: ThemeData(
            colorSchemeSeed: Hues.primary,
            fontFamily: "Inter",
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}

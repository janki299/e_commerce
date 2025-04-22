import 'package:e_commerce/binding/genral_binding.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/router/app_route.dart';
import 'package:e_commerce/theme_widgets/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/repositories/authentication_repository.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  await Supabase.initialize(
    url: 'https://qwekdyblijpkbzeefpht.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3ZWtkeWJsaWpwa2J6ZWVmcGh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM2NTkyMDksImV4cCI6MjA1OTIzNTIwOX0.z6GlRD9dAAsmPKrz8X9lxXXYmTjS5-2F_5-7NIeiq7Q',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      initialBinding: GeneralBinding(),
      darkTheme: TAppTheme.dartTheme,
      getPages: AppRoutes.pages,
      // routes: {
      //   "/": (context) => Scaffold(
      //         body: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       )
      //   // Center(
      //   //     child: CircularProgressIndicator(
      //   //   color: Colors.blue,
      //   // ))
      // },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/networking/local/cache_helper.dart';
import 'core/networking/remote/DioHelper.dart';
import 'core/networking/remote/bloc_observer.dart';
import 'features/auth_verification/presentation/cubit/otp_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterCubit(),
                ),
                BlocProvider(
                  create: (context) => LoginCubit(),
                ),
                BlocProvider(
                  create: (context) => OtpCubit(),
                ),
                BlocProvider(
                  create: (context) => HomeCubit(),
                ),
              ],
              child: const MaterialApp(
                title: 'Flutter Demo',
                home: SplashScreen(),
                debugShowCheckedModeBanner: false,
              ),
            );
        }
    );
  }
}

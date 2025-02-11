import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/firebase_utils/firebase_utils.dart';
import 'package:ai_weather/core/utils/bloc_observer.dart';
import 'package:ai_weather/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ai_weather/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ai_weather/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:ai_weather/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ai_weather/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return SignupCubit(
              signupUseCase: SignupUseCase(
                authRepo: AuthRepoImpl(
                  AuthRemoteDataSourceImpl(FirebaseAuthService()),
                ),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return LoginCubit(
              loginUseCase: LoginUseCase(
                authRepo: AuthRepoImpl(
                  AuthRemoteDataSourceImpl(FirebaseAuthService()),
                ),
              ),
            );
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      ),
    );
  }
}


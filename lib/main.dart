import 'package:ai_weather/core/api/api_manger.dart';
import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/firebase_utils/firebase_utils.dart';
import 'package:ai_weather/core/injectable/injectable.dart';
import 'package:ai_weather/core/utils/bloc_observer.dart';
import 'package:ai_weather/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ai_weather/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ai_weather/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:ai_weather/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ai_weather/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ai_weather/features/home/data/data_sources/get_user_name_data_source.dart';
import 'package:ai_weather/features/home/data/repositories/get_user_name_repo_impl.dart';
import 'package:ai_weather/features/home/data/repositories/prediction_repo_impl.dart';
import 'package:ai_weather/features/home/domain/use_cases/get_user_name_use_case.dart';
import 'package:ai_weather/features/home/domain/use_cases/prediction_use_case.dart';
import 'package:ai_weather/features/home/presentation/manager/prediction_cubit/prediction_cubit.dart';
import 'package:ai_weather/features/home/presentation/manager/user_name_cubit/user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();
  Bloc.observer = SimpleBlocObserver();

  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('userId');

  runApp(MyApp(isLoggedIn: userId != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

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
        ),
        BlocProvider(
          create: (context) => UserCubit(
            getUserNameUseCase: GetUserNameUseCase(
              getUserNameRepo: GetUserNameRepoImpl(
                GetUserNameDataSourceImpl(FirebaseFirestore.instance),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PredictionCubit(
            PredictionUseCase(
              PredictionRepoImpl(ApiManger()),
            ),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.getRouter(isLoggedIn),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      ),
    );
  }
}

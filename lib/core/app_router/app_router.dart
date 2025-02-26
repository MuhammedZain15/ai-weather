import 'package:ai_weather/core/firebase_utils/firebase_utils.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ai_weather/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ai_weather/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:ai_weather/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ai_weather/features/auth/presentation/pages/login.dart';
import 'package:ai_weather/features/auth/presentation/pages/register.dart';
import 'package:ai_weather/features/auth/presentation/pages/signup.dart';
import 'package:ai_weather/features/home/presentation/pages/forecast_page.dart';
import 'package:ai_weather/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';

class AppRouter {
  static const register = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const forecast = '/forecast';

  static GoRouter getRouter(bool isLoggedIn) {
    return GoRouter(
      initialLocation: isLoggedIn ? home : register,
      routes: [
        GoRoute(
          path: register,
          builder: (context, state) => const Register(),
        ),
        GoRoute(
          path: signup,
          builder: (context, state) =>  BlocProvider(
            create: (context) {
              return SignupCubit(
                signupUseCase: SignupUseCase(
                  authRepo: AuthRepoImpl(
                    AuthRemoteDataSourceImpl(FirebaseAuthService()),
                  ),
                ),
              );
            },
            child: const Signup(),
          ),
        ),
        GoRoute(
          path: login,
          builder: (context, state) =>  BlocProvider(
            child: Login(),
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
        ),
        GoRoute(
          path: home,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: forecast,
          builder: (context, state) => ForecastPage(),
        ),
      ],
    );
  }
}

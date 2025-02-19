import 'package:ai_weather/features/auth/presentation/pages/login.dart';
import 'package:ai_weather/features/auth/presentation/pages/register.dart';
import 'package:ai_weather/features/auth/presentation/pages/signup.dart';
import 'package:ai_weather/features/home/presentation/pages/forecast_page.dart';
import 'package:ai_weather/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

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
          path: login,
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: signup,
          builder: (context, state) => const Signup(),
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

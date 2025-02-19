import 'package:ai_weather/features/home/domain/use_cases/get_user_name_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<String?> {
  final GetUserNameUseCase getUserNameUseCase;

  UserCubit({required this.getUserNameUseCase}) : super(null);

  Future<void> fetchUserFirstName(String userId) async {
    final firstName = await getUserNameUseCase.call(userId);
    emit(firstName);
  }
}

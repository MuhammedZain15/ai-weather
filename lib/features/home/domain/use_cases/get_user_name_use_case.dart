import 'package:ai_weather/features/home/domain/repositories/get_user_name_repo.dart';

class GetUserNameUseCase {
  final GetUserNameRepo getUserNameRepo;

  GetUserNameUseCase({required this.getUserNameRepo});

  Future<String?> call(String userId) async {
    return await getUserNameRepo.getUserName(userId);
  }
}

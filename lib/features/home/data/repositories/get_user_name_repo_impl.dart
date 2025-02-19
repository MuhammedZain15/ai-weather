import 'package:ai_weather/features/home/data/data_sources/get_user_name_data_source.dart';
import 'package:ai_weather/features/home/domain/repositories/get_user_name_repo.dart';

 class GetUserNameRepoImpl implements GetUserNameRepo {
  final GetUserNameDataSource getUserNameDataSource;

  GetUserNameRepoImpl(this.getUserNameDataSource);

  @override
  Future<String?> getUserName(String userId) async {
    return await getUserNameDataSource.getUserName(userId);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetUserNameDataSource {
  Future<String?> getUserName(String userId);
}

class GetUserNameDataSourceImpl implements GetUserNameDataSource {
  final FirebaseFirestore firestore;

  GetUserNameDataSourceImpl(this.firestore);

  @override
  Future<String?> getUserName(String userId) async {
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      return (userDoc.data() as Map<String, dynamic>)['fullName']
          ?.split(" ")[0];
    }
    return null;
  }
}

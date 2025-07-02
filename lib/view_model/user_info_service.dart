import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Auth/UserModel.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserByUid(String uid) async {
    final doc = await _firestore.collection('Users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}

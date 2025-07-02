import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String emailId;
  final String? userName;
  final String? mobileNumber;
  final DateTime? createdAt;
  final DateTime? updatedDate;

  UserModel({
    required this.uid,
    required this.emailId,
    this.userName,
    this.mobileNumber,
    this.createdAt,
    this.updatedDate,
  });

  /// Factory to create a UserModel from Firestore data
  factory UserModel.fromMap(String uid, Map<String, dynamic> data) {
    return UserModel(
      uid: uid,
      emailId: data['emailId'] ?? '',
      userName: data['userName'],
      mobileNumber: data['mobileNumber'],
      createdAt: (data['createdAt'] is Timestamp)
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
      updatedDate: (data['UpdatedDate'] is Timestamp)
          ? (data['UpdatedDate'] as Timestamp).toDate()
          : null,
    );
  }

  /// Converts this UserModel into a map suitable for Firestore
  Map<String, dynamic> toMap() {
    return {
      'emailId': emailId,
      'userName': userName,
      'mobileNumber': mobileNumber,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      if (updatedDate != null) 'UpdatedDate': Timestamp.fromDate(updatedDate!),
    };
  }
}

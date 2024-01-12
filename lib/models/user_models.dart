import 'dart:io';

class UserModel {
  String nameSurname;
  String role;
  int cardNumber;
  int hourlySalary;

  UserModel({
    required this.nameSurname,
    required this.role,
    required this.cardNumber,
    required this.hourlySalary,

  });

  factory UserModel.fromMap(Map<String,dynamic> map) {
    return UserModel(
        nameSurname: map['nameSurname'] ?? '',
        role: map['role'] ?? '',
        cardNumber: map['cardNumber'] ?? '',
      hourlySalary: map['hourlySalary'] ?? ''

    );

  }

  Map<String,dynamic> toMap() {
    return {
      "nameSurname": nameSurname,
      "role": role,
      "cardNumber": cardNumber,
      "hourlySalary": hourlySalary
    };
  }


}
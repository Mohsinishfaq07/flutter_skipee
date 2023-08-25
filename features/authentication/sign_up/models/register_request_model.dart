import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  const RegisterRequestModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
  final String fullName;
  final String phoneNumber;
  final String email;
  final String password;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      fullName: json['FullName'],
      phoneNumber: json['Mobile'],
      email: json['Email'],
      password: json['Password'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['FullName'] = fullName;
    _data['Mobile'] = phoneNumber;
    _data['Email'] = email;
    _data['Password'] = password;
    return _data;
  }

  @override
  List<Object?> get props => [password, phoneNumber, email, fullName];
}

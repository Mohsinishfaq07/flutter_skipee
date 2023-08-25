import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  const LoginRequestModel({
    required this.phoneNumber,
    required this.password,
  });
  final String phoneNumber;
  final String password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      phoneNumber: json['Mobile'],
      password: json['Password'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Mobile'] = phoneNumber;
    _data['Password'] = password;
    return _data;
  }

  @override
  List<Object?> get props => [password, phoneNumber];
}

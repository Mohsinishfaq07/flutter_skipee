import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  const LoginResponseModel({
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
    required this.token,
  });
  final int userId;
  final String fullName;
  final String phoneNumber;
  final String emailAddress;
  final String password;
  final String token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userId: int.parse(json['UserID'].toString()),
      fullName: json['FullName'],
      phoneNumber: json['Mobile'],
      emailAddress: json['Email'],
      password: json['Password'],
      token: json['Token'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserID'] = userId;
    _data['FullName'] = fullName;
    _data['Mobile'] = phoneNumber;
    _data['Email'] = emailAddress;
    _data['Password'] = password;
    _data['Token'] = token;
    return _data;
  }

  LoginResponseModel copyWith({
    int? userId,
    String? fullName,
    String? phoneNumber,
    String? emailAddress,
    String? password,
    String? token,
  }) {
    return LoginResponseModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [userId, fullName, emailAddress, token, password, phoneNumber];
}

import 'package:equatable/equatable.dart';

class UpdateProfileRequestModel extends Equatable {
  const UpdateProfileRequestModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.imageUrl,
    required this.authToken,
  });
  final int id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String? imageUrl;
  final String authToken;

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileRequestModel(
      id: int.parse(json['ID'].toString()),
      fullName: json['FullName'],
      phoneNumber: json['Mobile'],
      email: json['Email'],
      imageUrl: json['PImage'],
      authToken: '',
    );
  }

  factory UpdateProfileRequestModel.withAuthToken(UpdateProfileRequestModel params, String authToken) {
    return UpdateProfileRequestModel(
      id: params.id,
      fullName: params.fullName,
      phoneNumber: params.phoneNumber,
      email: params.email,
      imageUrl: params.imageUrl,
      authToken: '',
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = id;
    _data['FullName'] = fullName;
    _data['Mobile'] = phoneNumber;
    _data['Email'] = email;
    _data['PImage'] = imageUrl;
    return _data;
  }

  @override
  List<Object?> get props => [id, fullName, phoneNumber, email, imageUrl, authToken];
}

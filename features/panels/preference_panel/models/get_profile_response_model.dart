import 'package:equatable/equatable.dart';

class GetProfileResponseModel extends Equatable {
  const GetProfileResponseModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.imageUrl,
  });
  final int id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String? imageUrl;

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return GetProfileResponseModel(
      id: int.parse(json['ID'].toString()),
      fullName: json['FullName'],
      phoneNumber: json['Mobile'],
      email: json['Email'],
      imageUrl: json['PImage'],
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
  List<Object?> get props => [id, fullName, phoneNumber, email, imageUrl];
}

import 'package:equatable/equatable.dart';

class GetProfileRequestModel extends Equatable {
  const GetProfileRequestModel({
    required this.phoneNumber,
    required this.authToken,
  });
  final String phoneNumber;
  final String authToken;

  factory GetProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return GetProfileRequestModel(
      phoneNumber: json['Mobile'],
      authToken: '',
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Mobile'] = phoneNumber;
    return _data;
  }

  @override
  List<Object?> get props => [phoneNumber];
}

// Package imports:
import 'package:equatable/equatable.dart';

class ClientInfoModel extends Equatable {
  final String? name;
  final String? cardNumber;
  final String? expirationDate;

  const ClientInfoModel({
    this.name,
    this.cardNumber,
    this.expirationDate,
  });

  factory ClientInfoModel.fromJson(Map<String, dynamic> json) {
    return ClientInfoModel(
      name: json['name'] as String?,
      cardNumber: json['cardNumber'] as String?,
      expirationDate: json['expirationDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cardNumber'] = cardNumber;
    data['expirationDate'] = expirationDate;
    return data;
  }

  @override
  List<Object?> get props => [
        name,
        cardNumber,
        expirationDate,
      ];
}

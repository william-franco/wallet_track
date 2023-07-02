// Package imports:
import 'package:equatable/equatable.dart';

class PurchaseModel extends Equatable {
  final String? date;
  final String? store;
  final String? description;
  final double? value;

  const PurchaseModel({
    this.date,
    this.store,
    this.description,
    this.value,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      date: json['date'] as String?,
      store: json['store'] as String?,
      description: json['description'] as String?,
      value: json['value'].toDouble() as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['store'] = store;
    data['description'] = description;
    data['value'] = value;
    return data;
  }

  @override
  List<Object?> get props => [
        date,
        store,
        description,
        value,
      ];
}

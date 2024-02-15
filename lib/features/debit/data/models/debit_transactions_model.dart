import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'debit_transactions_model.freezed.dart';
part 'debit_transactions_model.g.dart';

@unfreezed
class DebitTransactionsModel extends HiveObject with _$DebitTransactionsModel {
  @HiveType(typeId: 3, adapterName: 'DebitTransactionsModelAdapter')
  factory DebitTransactionsModel({
    @HiveField(1) double? amount,
    @HiveField(2) DateTime? now,
    @HiveField(4, defaultValue: -1) int? parentId,
    @HiveField(3) int? superId,
  }) = _DebitTransactionsModel;

  DebitTransactionsModel._();

  factory DebitTransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$DebitTransactionsModelFromJson(json);
}

import 'package:flutter/material.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/features/transaction/data/model/transaction_model.dart';
import 'package:paisa/features/transaction/domain/entities/transaction.dart';

class FilterOverviewWidget extends StatelessWidget {
  const FilterOverviewWidget({
    super.key,
    required this.valueNotifier,
    required this.builder,
    required this.expenses,
  });

  final Widget Function(List<TransactionEntity> expenses) builder;
  final Iterable<TransactionModel> expenses;
  final ValueNotifier<TransactionType> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TransactionType>(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return builder.call(expenses.budgetOverView(value));
      },
    );
  }
}

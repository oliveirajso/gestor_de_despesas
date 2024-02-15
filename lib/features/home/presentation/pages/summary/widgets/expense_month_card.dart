import 'package:flutter/material.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/custom_color.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:paisa/features/home/presentation/pages/summary/widgets/expense_list_widget.dart';
import 'package:paisa/features/transaction/domain/entities/transaction.dart';
import 'package:provider/provider.dart';

class ExpenseMonthCardWidget extends StatelessWidget {
  const ExpenseMonthCardWidget({
    Key? key,
    required this.title,
    required this.total,
    required this.expenses,
  }) : super(key: key);

  final List<TransactionEntity> expenses;
  final String title;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            title,
            style: context.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.onBackground,
            ),
          ),
          trailing: Text(
            total.toFormateCurrency(
              context,
              selectedCountry: context.read<AccountEntity>().country,
            ),
            style: context.titleSmall?.copyWith(
              color: total.isNegative
                  ? Theme.of(context).extension<CustomColors>()!.red
                  : Theme.of(context).extension<CustomColors>()!.green,
            ),
          ),
        ),
        ExpenseListWidget(
          expenses: expenses,
        ),
      ],
    );
  }
}

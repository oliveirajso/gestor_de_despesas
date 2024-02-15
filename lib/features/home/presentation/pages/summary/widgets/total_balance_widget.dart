import 'package:flutter/material.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/account/domain/entities/account_entity.dart';
import 'package:provider/provider.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  final double amount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.85),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                amount.toFormateCurrency(
                  context,
                  selectedCountry: context.read<AccountEntity>().country,
                ),
                style: context.headlineMedium?.copyWith(
                  color: context.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            paisaAlertDialog(
              context,
              child:
                  const Text('Home screen data will be always default account'),
              title: Text(context.loc.accountInformationTitle),
              confirmationButton: null,
            );
          },
          icon: const Icon(Icons.info),
        )
      ],
    );
  }
}

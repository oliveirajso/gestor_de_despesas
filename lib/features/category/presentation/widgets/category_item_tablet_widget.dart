import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/uteis/icon_data.dart';

import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/category/domain/entities/category.dart';

class CategoryItemTabletWidget extends StatelessWidget {
  const CategoryItemTabletWidget({
    Key? key,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  final CategoryEntity category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PaisaFilledCard(
      child: InkWell(
        onTap: () => context.pushNamed(
          editCategoryName,
          pathParameters: <String, String>{'cid': category.superId.toString()},
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                IconDataCustom().getAccountIconData(category.icon ?? 0),
                color: Color(category.color ?? context.primary.value),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.bodyMedium?.copyWith(
                        color: context.onSurface,
                      ),
                    ),
                    if (category.description != null)
                      Text(
                        category.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.labelMedium?.copyWith(
                          color: context.onSurface.withOpacity(0.55),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

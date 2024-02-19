import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_annotate_region_widget.dart';
import 'package:paisa/features/settings/presentation/widgets/app_language_changer.dart';
import 'package:provider/provider.dart';

class AppLanguageChangerPage extends StatelessWidget {
  const AppLanguageChangerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LanguageEntity> languages = Languages.languages.sorted(
      (a, b) => a.value.compareTo(b.value),
    );

    late String selectedCode = Provider.of<Box<dynamic>>(context, listen: false)
        .get(appLanguageKey, defaultValue: 'pt');

    return PaisaAnnotatedRegionWidget(
        color: context.background,
        child: Scaffold(
          appBar: context.materialYouAppBar(context.loc.chooseAppLanguage),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (_, index) {
              final LanguageEntity entity = languages[index];
              return ListTile(
                onTap: () {
                  Provider.of<Box<dynamic>>(_, listen: false)
                      .put(appLanguageKey, entity.code)
                      .then((_) => context.pop());
                },
                title: Text(
                  entity.value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: selectedCode == entity.code
                          ? Theme.of(context).colorScheme.primary
                          : null),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  context.loc.cancel,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {},
                child: Text(context.loc.ok),
              ),
            ),
          ],
        ));
  }
}

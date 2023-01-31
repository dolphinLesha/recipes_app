import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/bloc/navigation/bloc.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/modules/settings/navigation/settings_routes.dart';

class SettingsMainPage extends StatelessWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _SettingAppearance(),
          _SettingAppearance(),
        ],
      ),
    );
  }
}

class _SettingAppearance extends StatelessWidget {
  const _SettingAppearance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DI.navigationBloc.add(RoutePush(route: const RouteSettingsAppearance()));
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AdditionalColors.background,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: PlatformText(
                'Внешний вид',
              ),
            ),
            Flexible(
              flex: 0,
              child: PlatformIconButton(
                // onPressed: () {
                //
                // },
                icon: Icon(
                  PlatformIcons(context).rightChevron,
                  color: AdditionalColors.grey,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

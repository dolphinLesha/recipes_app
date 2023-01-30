import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/model/redux/theme/theme_state/theme_state.dart';
import 'package:recipes_app/src/presentation/redux/theme/theme_actions.dart';

class SettingsAppearancePage extends StatelessWidget {
  const SettingsAppearancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeState>(
        converter: (store) => store.state.themeState,
        distinct: true,
        builder: (context, state) {
          print(state.currentThemeMode);
        return Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: PlatformText(
                    'Темная тема',
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: PlatformSwitch(
                    value: state.currentThemeMode,
                    onChanged: (val) {
                      DI.store.dispatch(ThemeChanged(themeMode: val));
                    },
                  ),
                ),
              ],
            )
          ],
        );
      }
    );
  }
}

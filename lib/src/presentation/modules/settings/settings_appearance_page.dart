import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/bloc/theme/actions.dart';
import 'package:recipes_app/src/model/bloc/theme/bloc.dart';
import 'package:recipes_app/src/model/bloc/theme/state/theme_state.dart';

class SettingsAppearancePage extends StatelessWidget {
  const SettingsAppearancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        bloc: DI.themeBloc,
        builder: (context, state) {
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
                      DI.themeBloc.add(ThemeChanged(val));
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

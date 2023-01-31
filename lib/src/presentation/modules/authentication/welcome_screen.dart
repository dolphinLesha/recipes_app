import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';
import 'package:recipes_app/src/model/bloc/welcome_screen/actions.dart';
import 'package:recipes_app/src/model/bloc/welcome_screen/bloc.dart';
import 'package:recipes_app/src/presentation/common/other/app_logo.dart';
import 'package:recipes_app/src/presentation/common/other/loading_indicator.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeScreenBloc>(
      create: (context) =>
          WelcomeScreenBloc()..add(const WelcomeScreenInitLoad()),
      child: BlocBuilder<WelcomeScreenBloc, WelcomeScreenState>(
          buildWhen: (p, n) => p.formStage != n.formStage,
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: state.formStage.isLoading
                  ? const Center(
                      key: ValueKey('1'),
                      child: LoadingIndicator(),
                    )
                  : const Center(
                      child: _InfoForm(
                        key: ValueKey('2'),
                      ),
                    ),
            );
          }),
    );
  }
}

class _InfoForm extends StatelessWidget {
  const _InfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(40),
            child: Align(
              alignment: Alignment.center,
              child: AppLogo(size: 30),
            ),
          ),
          PlatformText(
            'Добро пожаловать!',
            style: AT.h2,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: PlatformText(
              'Давайте познакомимся',
              style: AT.body1,
              textAlign: TextAlign.center,
            ),
          ),
          PlatformTextFormField(
            onChanged: (val) {
              context
                  .read<WelcomeScreenBloc>()
                  .add(WelcomeScreenFirstNameChanged(val));
            },
            hintText: 'Имя',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            child: PlatformTextFormField(
              onChanged: (val) {
                context
                    .read<WelcomeScreenBloc>()
                    .add(WelcomeScreenLastNameChanged(val));
              },
              hintText: 'Фамилия',
            ),
          ),
          BlocBuilder<WelcomeScreenBloc, WelcomeScreenState>(
              buildWhen: (p, n) => p.validToEnter != n.validToEnter,
              builder: (context, state) {
                return PlatformElevatedButton(
                  onPressed: state.validToEnter ? () {
                    context
                        .read<WelcomeScreenBloc>()
                        .add(const WelcomeScreenConfirmRegister());
                  } : null,
                  color: MainColors.darkGreen,
                  child: PlatformText('Далее'),
                  cupertino: (ctx, platform) => CupertinoElevatedButtonData(
                      disabledColor: MainColors.darkGreen.withOpacity(0.3)),
                );
              }),
          PlatformTextButton(
            onPressed: () {},
            child: PlatformText(
              'пропустить',
              style: const TextStyle(
                fontSize: 16,
                color: MainColors.darkGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

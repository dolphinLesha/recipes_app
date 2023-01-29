abstract class WelcomeScreenAction {
  const WelcomeScreenAction();
}

class WelcomeScreenInitLoad extends WelcomeScreenAction {

  const WelcomeScreenInitLoad();
}

class WelcomeScreenConfirmRegister extends WelcomeScreenAction {

  const WelcomeScreenConfirmRegister();
}

class WelcomeScreenFirstNameChanged extends WelcomeScreenAction {
  final String text;

  const WelcomeScreenFirstNameChanged(this.text);
}

class WelcomeScreenLastNameChanged extends WelcomeScreenAction {
  final String text;

  const WelcomeScreenLastNameChanged(this.text);
}
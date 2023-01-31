abstract class ThemeAction{
  const ThemeAction();
}

class ThemeChanged extends ThemeAction{
  final bool themeMode;

  const ThemeChanged(this.themeMode);
}
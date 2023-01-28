enum FormStage {
  initial,
  loading,
  success,
  common,
  failed,
}

extension FormStageX on FormStage {
  bool get isInitial => this == FormStage.initial;

  bool get isLoading => this == FormStage.loading;

  bool get isSuccess => this == FormStage.success;

  bool get isCommon => this == FormStage.common;

  bool get isFailed => this == FormStage.failed;
}

class SOCInfoModel {
  String? manufacture;
  String? model;
  String? build;
  int? sdkVersionCode;
  String? codeName;

  SOCInfoModel(
      {this.build,
      this.codeName,
      this.manufacture,
      this.model,
      this.sdkVersionCode});
}

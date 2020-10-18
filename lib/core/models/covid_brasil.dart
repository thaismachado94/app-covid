class CovidBrasilModel {
  final String country;
  final int cases;
  final int confirmed;
  final int deaths;
  final int recovered;
  final String update_at;

  CovidBrasilModel(this.country, this.cases, this.confirmed, this.deaths,
      this.recovered, this.update_at);

  factory CovidBrasilModel.fromJson(Map<String, dynamic> json) {
    return CovidBrasilModel(
      json["data"]["country"],
      json["data"]["cases"],
      json["data"]["confirmed"],
      json["data"]["deaths"],
      json["data"]["recovered"],
      json["data"]["update_at"],
    );
  }
}

class CovidEstadoModel {
  final int uid;
  final String uf;
  final String state;
  final int cases;
  final int deaths;
  final int suspects;
  final int refuses;
  final String datetime;

  CovidEstadoModel(this.uid, this.uf, this.state, this.cases, this.deaths,
      this.suspects, this.refuses, this.datetime);

  factory CovidEstadoModel.fromJson(Map<String, dynamic> json) {
    return CovidEstadoModel(
      json["uid"],
      json["uf"],
      json["state"],
      json["cases"],
      json["deaths"],
      json["suspects"],
      json["refuses"],
      json["datetime"],
    );
  }
}

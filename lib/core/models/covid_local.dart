/* classe de dados para teste da api */
class CovidLocalModel {
  final int id;
  final String cidade;
  final String uf;
  final String ativos;
  final String confirmados;
  final String recuperados;
  final String mortes;

  CovidLocalModel(this.id, this.cidade, this.uf, this.ativos, this.confirmados,
      this.recuperados, this.mortes);

  factory CovidLocalModel.fromJson(Map<String, dynamic> json) {
    return CovidLocalModel(
      json["id"],
      json["cidade"],
      json["uf"],
      json["ativos"],
      json["confirmados"],
      json["recuperados"],
      json["mortes"],
    );
  }
}

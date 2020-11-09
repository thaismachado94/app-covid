/* classe de dados de cidades da api */
class CovidCidadeModel {
  final int id;
  final String cidade;
  final String uf;
  final String ativos;
  final String confirmados;
  final String recuperados;
  final String mortes;

  CovidCidadeModel(this.id, this.cidade, this.uf, this.ativos, this.confirmados,
      this.recuperados, this.mortes);

  factory CovidCidadeModel.fromJson(Map<String, dynamic> json) {
    return CovidCidadeModel(
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

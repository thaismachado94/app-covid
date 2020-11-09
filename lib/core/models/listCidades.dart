//* classe para criar lista de cidades para o source no dropList *//

class ListCidadesModel {
  final String cidade;
  final String cidade_low;
  final String uf;

  ListCidadesModel(this.cidade, this.cidade_low, this.uf);

  factory ListCidadesModel.fromJson(Map<String, dynamic> json) {
    return ListCidadesModel(json["cidade"], json["cidade_low"], json["uf"]);
  }
}

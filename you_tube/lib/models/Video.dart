class Video {
  String id = "";
  String titulo = "";
  String imagem = "";
  String canal = "";
  String descricao = "";

  Video(
      {this.id = "",
      this.titulo = "",
      this.imagem = "",
      this.canal = "",
      this.descricao = ""});

  /*static converterJson(Map<String, dynamic> json) {
    return Video (
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }*/

  // com factory, o retorno será de um unico objeto
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}

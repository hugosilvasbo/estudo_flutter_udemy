import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:you_tube/models/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAatg5sf3bA92dYvs6DvEJLT7qHA5xiKdw";
const ID_CANAL = "UCbulh9WdLtEXiooRcYK7SWw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
      /*for (var video in videos) {
        print("resultado> " + video.titulo);
      }*/
    } else {
      return Future.error(response.statusCode);
    }
  }
}

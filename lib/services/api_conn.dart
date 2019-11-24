import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class GifsDevelopermentService{
  static String search;
  static int offset = 0;
  static final String trendingNow = "https://api.giphy.com/v1/gifs/trending?api_key=fs5858EIRBu49jpMI6TieYihAUifAMA6&limit=20&rating=G";

  static Future<Map> getSearch() async{
    http.Response response;

    try{
      if(search == null || search.isEmpty){
        response = await http.get(trendingNow);
      }else{
        response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=fs5858EIRBu49jpMI6TieYihAUifAMA6&q=$search&limit=19&offset=$offset&rating=G&lang=en");
      }
      return jsonDecode(response.body);
    }catch (e){
      throw SocketException(e);
    }
  }
}
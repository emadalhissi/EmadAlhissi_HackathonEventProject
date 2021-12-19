import 'dart:convert';
import 'package:emad_alhissi_hackathon/api/api_helper.dart';
import 'package:emad_alhissi_hackathon/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:emad_alhissi_hackathon/models/api_models/category.dart';

class CategoriesApiController with ApiHelper {
  Future<List<Category>> getCategory() async {
    var url = Uri.parse(ApiSettings.categories.replaceFirst('/{id}', ''));
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var cityJsonArray = jsonDecode(response.body)['list'] as List;
      return cityJsonArray.map((obj) => Category.fromJson(obj)).toList();
    }
    return [];
  }
}

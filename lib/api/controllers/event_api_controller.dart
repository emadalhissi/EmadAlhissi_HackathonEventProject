import 'dart:convert';
import 'package:emad_alhissi_hackathon/api/api_helper.dart';
import 'package:emad_alhissi_hackathon/api/api_settings.dart';
import 'package:emad_alhissi_hackathon/models/api_models/event.dart';
import 'package:http/http.dart' as http;
import 'package:emad_alhissi_hackathon/models/api_models/category.dart';

class EventsApiController with ApiHelper {
  Future<List<Event>> getEvent({required Category category}) async {
    var url = Uri.parse(ApiSettings.categories.replaceFirst('/{id}', '/${category.id.toString()}'));
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var cityJsonArray = jsonDecode(response.body)['list'] as List;
      return cityJsonArray.map((obj) => Event.fromJson(obj)).toList();
    }
    return [];
  }

  Future<Event?> eventDetails({required Event event}) async {
    var url = Uri.parse(ApiSettings.event.replaceFirst('/{id}', '/${event.id.toString()}'));
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var event = jsonDecode(response.body)['list'];
      return event;
    }
    return null;
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:emad_alhissi_hackathon/api/api_helper.dart';
import 'package:emad_alhissi_hackathon/api/api_settings.dart';
import 'package:emad_alhissi_hackathon/models/api_models/event.dart';
import 'package:emad_alhissi_hackathon/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef UploadImageCallback = void Function({
  required bool status,
  required String message,
  Event? event,
});

class ImagesApiController with ApiHelper {
  Future<void> uploadImage(
    BuildContext context, {
    required String path,
    required UploadImageCallback uploadImageCallback,
    required String id,
    required String name,
    required String info,
    required String date,
    required String time,
    required String address,
    required String hours,
  }) async {
    var url = Uri.parse(ApiSettings.event.replaceFirst('/{id}', ''));
    var request = http.MultipartRequest('POST', url);
    http.MultipartFile imageFile =
        await http.MultipartFile.fromPath('image', path);
    request.files.add(imageFile);
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPreferencesController().getToken;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.fields['category_id'] = id;
    request.fields['name'] = name;
    request.fields['info'] = info;
    request.fields['date'] = date;
    request.fields['time'] = time;
    request.fields['address'] = address;
    request.fields['duration_hours'] = hours;

    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      print('StatusCode: ${response.statusCode}');
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(value);
        Event eventImage = Event.fromJson(jsonResponse['object']);

        uploadImageCallback(
          status: true,
          message: jsonResponse['message'],
          event: eventImage,
        );

        // showSnackBar(context: context, message: jsonResponse['message']);

      } else if (response.statusCode == 400) {
        uploadImageCallback(
          status: false,
          message: jsonDecode(value)['message'],
        );

        // showSnackBar(context: context, message: jsonDecode(value)['message'],error: true);

      } else if (response.statusCode == 500) {
        uploadImageCallback(
          status: false,
          message: 'Something went wrong, try again!',
        );

        // showSnackBar(context: context, message: 'Something went wrong, try again!',error: true);
      }
    });
  }

  // Future<List<StudentImage>> images(BuildContext context) async {
  //   var url = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
  //   var response = await http.get(url, headers: {
  //     HttpHeaders.acceptHeader: 'application/json',
  //     HttpHeaders.authorizationHeader: SharedPrefController().token,
  //   });
  //   if (response.statusCode == 200) {
  //     var imagesJsonArray = jsonDecode(response.body)['data'] as List;
  //     return imagesJsonArray
  //         .map((imageJsonObject) => StudentImage.fromJson(imageJsonObject))
  //         .toList();
  //   } else {
  //     showSnackBar(
  //       context: context,
  //       message: 'Something went wrong, try again!',
  //       error: true,
  //     );
  //   }
  //   return [];
  // }
  //
  // Future<bool> deleteImage(BuildContext context, {required int id}) async {
  //   var url = Uri.parse(ApiSettings.images.replaceFirst('{id}', id.toString()));
  //   var response = await http.delete(url, headers: {
  //     HttpHeaders.acceptHeader: 'application/json',
  //     HttpHeaders.authorizationHeader: SharedPrefController().token,
  //   });
  //
  //   if (response.statusCode == 200) {
  //     showSnackBar(
  //       context: context,
  //       message: jsonDecode(response.body)['message'],
  //     );
  //     return true;
  //   } else {
  //     showSnackBar(
  //         context: context,
  //         message: 'Something went wrong, try again',
  //         error: true);
  //   }
  //   return false;
  // }
}

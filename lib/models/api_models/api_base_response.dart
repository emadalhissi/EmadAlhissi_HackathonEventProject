class ApiBaseResponse {
  late bool status;
  late String message;

  ApiBaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

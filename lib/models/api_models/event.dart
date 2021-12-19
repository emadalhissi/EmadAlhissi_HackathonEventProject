class Event {
  late int id;
  late String name;
  late String info;
  late String date;
  late String time;
  late String address;
  late int durationHours;
  late String image;
  late int categoryId;
  late int userId;
  late String createdAt;
  late int commentsCount;
  late int imagesCount;
  late String imageUrl;
  late String status;

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    durationHours = json['duration_hours'];
    image = json['image'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    commentsCount = json['comments_count'];
    imagesCount = json['images_count'];
    imageUrl = json['image_url'];
    status = json['status'];
  }
}

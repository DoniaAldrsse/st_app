// ignore: camel_case_types
class trip {
  String? id;
  String? title;
  String? imageurl;
  String? price;
  String? description;
  String? phone;
  double? rating;
  // ignore: non_constant_identifier_names
  double? Lat;
  // ignore: non_constant_identifier_names
  double? Lng;

  trip(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.price,
      required this.description,
      required this.phone,
      required this.rating,
      // ignore: non_constant_identifier_names
      this.Lat,
      // ignore: non_constant_identifier_names
      this.Lng});

  trip.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageurl = json['imageurl'];
    price = json['price'];
    description = json['description'];
    phone = json['phone'];
    rating = json['rating'];
    Lat = json['Lat'];
    Lng = json['Lng'];
  }
}

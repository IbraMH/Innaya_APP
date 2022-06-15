class Sliders {
  Sliders({
    this.id,
    this.image,
    this.status,
    this.link,
    this.gender,
    this.imageUrl,
    this.description,
  });

  int ?id;
  String ?image;
  dynamic? status;
  String ?link;
  String? gender;
  String? imageUrl;
  String ?description;

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
    id: json["id"],
    image: json["image"],
    status: json["status"],
    link: json["link"],
    gender: json["gender"],
    imageUrl: json["image_url"],
    description: json["description"],
  );


}

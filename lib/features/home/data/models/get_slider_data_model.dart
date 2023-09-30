class GetSliderModel {
  final String image;

  GetSliderModel({
    required this.image,
  });

  factory GetSliderModel.fromJson(Map<String, dynamic> json) {
    return GetSliderModel(
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'image': image,
  };
}
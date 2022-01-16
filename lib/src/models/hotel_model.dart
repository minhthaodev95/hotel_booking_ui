import 'dart:convert';

class HotelModel {
  final String id;
  final String name;
  final String featureImage;
  final String location;
  final int starRate;
  final int numberReviewers;
  final int pricePerNight;
  final List<String> listPictures;
  final String description;
  bool isFavorite;

  HotelModel(
      {required this.id,
      required this.name,
      required this.featureImage,
      required this.location,
      required this.starRate,
      required this.numberReviewers,
      required this.pricePerNight,
      required this.isFavorite,
      required this.listPictures,
      required this.description});
}

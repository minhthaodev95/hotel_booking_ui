import 'package:hive/hive.dart';

part 'info_hotel_searching.g.dart';

@HiveType(typeId: 0)
class InfoHotelSearching {
  @HiveField(0)
  String? location;
  @HiveField(1)
  DateTime? arrivalDate;
  @HiveField(2)
  DateTime? departureDate;
  @HiveField(3)
  List<int>? guests;
  InfoHotelSearching(
      {this.location, this.arrivalDate, this.departureDate, this.guests});
}

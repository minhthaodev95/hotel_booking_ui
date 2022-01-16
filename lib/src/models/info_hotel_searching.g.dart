// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_hotel_searching.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoHotelSearchingAdapter extends TypeAdapter<InfoHotelSearching> {
  @override
  final int typeId = 0;

  @override
  InfoHotelSearching read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoHotelSearching(
      location: fields[0] as String?,
      arrivalDate: fields[1] as DateTime?,
      departureDate: fields[2] as DateTime?,
      guests: (fields[3] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, InfoHotelSearching obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.arrivalDate)
      ..writeByte(2)
      ..write(obj.departureDate)
      ..writeByte(3)
      ..write(obj.guests);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoHotelSearchingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

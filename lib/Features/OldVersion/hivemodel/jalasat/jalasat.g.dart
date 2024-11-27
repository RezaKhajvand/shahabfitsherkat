// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jalasat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveJalaseAdapter extends TypeAdapter<HiveJalase> {
  @override
  final int typeId = 2;

  @override
  HiveJalase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveJalase(
      shagerId: fields[0] as int,
      jalaseDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveJalase obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.shagerId)
      ..writeByte(1)
      ..write(obj.jalaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveJalaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

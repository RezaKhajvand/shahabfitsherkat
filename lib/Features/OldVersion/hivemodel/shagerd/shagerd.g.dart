// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shagerd.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveShagerdAdapter extends TypeAdapter<HiveShagerd> {
  @override
  final int typeId = 1;

  @override
  HiveShagerd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveShagerd(
      name: fields[0] as String,
      jalase: fields[2] as int,
      khosusi: fields[3] as bool,
      id: fields[4] as int,
      plan: fields[5] as int,
      registerdate: fields[6] as DateTime,
      phone: fields[7] as String,
      workouttime: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveShagerd obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.jalase)
      ..writeByte(3)
      ..write(obj.khosusi)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.plan)
      ..writeByte(6)
      ..write(obj.registerdate)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.workouttime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveShagerdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_hive_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrewHiveVOAdapter extends TypeAdapter<CrewHiveVO> {
  @override
  final int typeId = 13;

  @override
  CrewHiveVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrewHiveVO(
      (fields[0] as List?)?.cast<CrewVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CrewHiveVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.crewList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrewHiveVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenresVOAdapter extends TypeAdapter<GenresVO> {
  @override
  final int typeId = 9;

  @override
  GenresVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenresVO(
      fields[1] as int?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GenresVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresVO _$GenresVOFromJson(Map<String, dynamic> json) => GenresVO(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$GenresVOToJson(GenresVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

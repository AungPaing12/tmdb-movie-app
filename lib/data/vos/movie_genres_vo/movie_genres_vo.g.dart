// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genres_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieGenresVOAdapter extends TypeAdapter<MovieGenresVO> {
  @override
  final int typeId = 5;

  @override
  MovieGenresVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieGenresVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieGenresVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieGenresVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGenresVO _$MovieGenresVOFromJson(Map<String, dynamic> json) =>
    MovieGenresVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isSelect: json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieGenresVOToJson(MovieGenresVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelect': instance.isSelect,
    };

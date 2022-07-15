// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class themesettingAdapter extends TypeAdapter<themesetting> {
  @override
  final int typeId = 1;

  @override
  themesetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return themesetting()
      ..name = fields[0] as String
      ..version = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, themesetting obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is themesettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

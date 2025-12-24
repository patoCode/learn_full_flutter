// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paid_summary_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaidSummaryTableAdapter extends TypeAdapter<PaidSummaryTable> {
  @override
  final int typeId = 0;

  @override
  PaidSummaryTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaidSummaryTable()
      ..id = fields[0] as String
      ..ammount = fields[1] as double
      ..people = fields[2] as int
      ..percentaje = fields[3] as double
      ..total = fields[4] as double
      ..date = fields[5] as DateTime
      ..tag = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, PaidSummaryTable obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ammount)
      ..writeByte(2)
      ..write(obj.people)
      ..writeByte(3)
      ..write(obj.percentaje)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.tag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaidSummaryTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

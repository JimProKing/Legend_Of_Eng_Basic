import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  int get random1 => getField<int>('random1')!;
  set random1(int value) => setField<int>('random1', value);

  int get ramdom2 => getField<int>('ramdom2')!;
  set ramdom2(int value) => setField<int>('ramdom2', value);

  int get idx => getField<int>('idx')!;
  set idx(int value) => setField<int>('idx', value);
}

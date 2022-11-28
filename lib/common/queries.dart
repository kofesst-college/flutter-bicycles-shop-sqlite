import 'package:bicycles_shop/common/tables.dart';

abstract class DatabaseQuery {
  static String getCreateTableQuery(Table table) =>
      "create table if not exists ${table.tableName}(${table.columnsQuery});";

  static String getDeleteTableQuery(Table table) =>
      "drop table if exists ${table.tableName};";
}

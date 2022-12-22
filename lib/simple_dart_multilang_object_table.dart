import 'package:simple_dart_multilang_table/simple_dart_multilang_table.dart';
import 'package:simple_dart_object_table/simple_dart_object_table.dart';

class MultilangObjectTable<T> extends ObjectTable<T> {
  MultilangObjectTable(ObjectTableRowAdapter<T> objectRowAdapter, {selectable = false})
      : super(objectRowAdapter, selectable: selectable) {
    columnToHeaderCell = tableColumnToHeaderCellMultilang;
    valueToCell = tableValueToCellMultilang;
    valueToString = tableValueToStringMultilang;
  }
}

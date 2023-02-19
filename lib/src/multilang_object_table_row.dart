import 'package:simple_dart_multilang_table/simple_dart_multilang_table.dart';
import 'package:simple_dart_object_table/simple_dart_object_table.dart';
import 'package:simple_dart_table/simple_dart_table.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class MultilangObjectTableRow<T> extends ObjectTableRow<T> {
  MultilangObjectTableRow(ObjectListAdapter<T> rowAdapter, List<TableColumnDescr> newCols)
      : super(rowAdapter, newCols) {
    cellFactory = CellRendererMultilang();
  }
}

import 'package:simple_dart_multilang_checkbox/simple_dart_multilang_checkbox.dart';
import 'package:simple_dart_multilang_table/simple_dart_multilang_table.dart';
import 'package:simple_dart_table/simple_dart_table.dart';

class MultilangObjectTableHeaderRow extends TableRow {
  MultilangCheckbox checkbox = MultilangCheckbox()..visible = false;

  MultilangObjectTableHeaderRow(List<TableColumnDescr> newCols) : super(newCols) {
    final cell = ComponentTableCell(checkbox);
    add(cell);
    for (final columnDescr in newCols) {
      final cell = MultilangColumnHeaderCell(columnDescr);
      cells.add(cell);
      add(cell);
    }
  }
}

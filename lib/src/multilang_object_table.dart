import 'package:simple_dart_object_table/simple_dart_object_table.dart';
import 'package:simple_dart_table/simple_dart_table.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

import '../simple_dart_multilang_object_table.dart';

class MultilangObjectTable<T> extends ObjectTable<T> {
  bool _checkboxVisible = false;

  MultilangObjectTable(ObjectListAdapter<T> objectRowAdapter) : super(objectRowAdapter);

  @override
  void initColumns(List<TableColumnDescr> columns) {
    this.columns = columns;
    headersRow = MultilangObjectTableHeaderRow(columns)
      ..addCssClass('Header')
      ..checkbox.onValueChange.listen(headerCheckboxValueChange);
    for (var i = 0; i < columns.length; i++) {
      final columnDescr = columns[i];
      final headerCell = headersRow.cells[i];
      if (columnDescr.sortable) {
        headerCell.element.onClick.listen((event) {
          onSortClick(headerCell, i);
        });
      }
    }
    addAll([headersRow, scrollablePanel]);
  }

  @override
  ObjectTableRow createObjectRow(T object) {
    final newRow = MultilangObjectTableRow(objectRowAdapter, columns)
      ..object = object
      ..checkbox.visible = checkboxVisible;
    newRow.checkbox.onValueChange.listen((event) {
      fireOnCheckBoxSelect(ObjectTableSelectEvent(object, selected: event.newValue));
      var allSelected = true;
      var allUnselected = true;
      for (final row in rows) {
        final objectRow = row as MultilangObjectTableRow<T>;
        if (objectRow.checkbox.value) {
          if (allUnselected) {
            allUnselected = false;
          }
        } else {
          if (allSelected) {
            allSelected = false;
          }
        }
      }
      if (allSelected) {
        (headersRow as MultilangObjectTableHeaderRow).checkbox.value = true;
      } else if (allUnselected) {
        (headersRow as MultilangObjectTableHeaderRow).checkbox.value = false;
      } else {
        (headersRow as MultilangObjectTableHeaderRow).checkbox.isIndeterminate = true;
      }
    });
    formatRow(newRow);
    rows.add(newRow);
    scrollablePanel.add(newRow);
    return newRow;
  }

  @override
  set checkboxVisible(bool value) {
    _checkboxVisible = value;
    (headersRow as MultilangObjectTableHeaderRow).checkbox.visible = value;
    for (final row in rows) {
      final objectRow = row as ObjectTableRow<T>;
      objectRow.checkbox.visible = value;
    }
  }

  @override
  bool get checkboxVisible => _checkboxVisible;
}

// class ProductManager {
//   final GSheets _gsheets = GSheets(_credential);
//   Spreadsheet _spreadsheet;
//   Worksheet _productSheet;

//   Future<void> init() async {
//     _spreadsheet ??= await _gsheets.spreadsheet(_spreadSheetId);
//     _productSheet ??= _spreadsheet.worksheetByTitle('Note1');
//   }

//   Future<List<Product>> getAll() async {
//     await init();
//     final products = await _productSheet.values.map.allRows();
//     return products.map((json) => Product.fromGsheets(json)).toList();
//   }

//   Future<Product> getById(int id) async {
//     await init();
//     final map = await _productSheet.values.map.rowByKey(id);
//     return map == null ? null : Product.fromGsheets(map);
//   }

//   Future<bool> insert(Product product) async {
//     await init();
//     return _productSheet.values.map.appendRow(product.toGsheets());
//   }

//   Future<bool> update(Product product) async {
//     await init();
//     final index = await _productSheet.values.map.rowIndexOf(product.id);
//     if (index > 0) {
//       return _productSheet.values.map.insertRowByIndex(
//         index,
//         product.toGsheets(),
//         insertAsNewRow: false,
//       );
//     }
//     return false;
//   }

//   Future<bool> deleteById(int id) async {
//     await init();
//     final index = await _productSheet.values.map.rowIndexOf(id);
//     if (index > 0) {
//       return _productSheet.deleteRow(index);
//     }
//     return false;
//   }

//   Future<bool> delete(Product product) => deleteById(product.id);
// }

// static Future<List<NoteModel>> getAll() async {
//     try {
//       if (_worksheet != null) {
//         final notes = await _worksheet?.values.map.allRows();
//         if (notes != null) {
//           return notes.map((json) => NoteModel.fromGSheets(json)).toList();
//         } else {
//           log("No Notes Found");
//           return [];
//         }
//       } else {
//         log("Worksheet Null");
//         return [];
//       }
//     } catch (e) {
//       log("Error Get All Note: $e");
//       return [];
//     }
//   }
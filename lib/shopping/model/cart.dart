import 'package:flutter/foundation.dart';
import 'catelog.dart';

class CardModel extends ChangeNotifier {
  final CatalogModel _catalog;
  final List<int> _itemIds;

  CardModel(this._catalog, CardModel previous) :
      assert(_catalog != null), _itemIds = previous?._itemIds ?? [];

  CardModel.empty() : _catalog = null, _itemIds = [];

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
}
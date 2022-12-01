import 'package:ecoresturant/services/model/category_model.dart';
import 'package:ecoresturant/services/model/item_model.dart';
import 'package:ecoresturant/services/service/item_service.dart';

class ItemRepository {
  ItemServices itemServices = ItemServices();

  Future<List<ItemModel?>> getItemList() async {
    return itemServices.getItemList();
  }

  Future<List<ItemModel?>> getItemBycategoryId(categoryId) async {
    return itemServices.getItemBycategoryId(categoryId);
  }
}

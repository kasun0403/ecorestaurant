import 'dart:convert';
import 'package:ecoresturant/services/model/item_model.dart';
import 'package:http/http.dart' as http;

class ItemServices {
  Future<List<ItemModel>> getItemList() async {
    List<ItemModel> _itemList = [];
    var response = await http
        .get(Uri.parse("https://ecorestaurant.free.beeceptor.com/items"));
    if (response.statusCode == 200) {
      var body = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      _itemList =
          body.map<ItemModel>((json) => ItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Items');
    }
    return _itemList;
  }

  Future<List<ItemModel>> getItemBycategoryId(categoryId) async {
    List<ItemModel> _itemList = [];
    var response = await http.get(Uri.parse(
        "https://ecorestaurant.free.beeceptor.com/items?category_id=$categoryId"));
    if (response.statusCode == 200) {
      var body = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      _itemList =
          body.map<ItemModel>((json) => ItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Items');
    }
    return _itemList;
  }
}

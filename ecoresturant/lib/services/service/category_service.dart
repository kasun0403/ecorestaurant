import 'dart:convert';
import 'package:ecoresturant/services/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryModel>> getCategoryData() async {
    List<CategoryModel> _categoryList = [];
    var response = await http
        .get(Uri.parse("https://ecorestaurant.free.beeceptor.com/categories"));
    if (response.statusCode == 200) {
      var body = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      _categoryList = body
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Categories');
    }
    return _categoryList;
  }
}

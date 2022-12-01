import 'package:ecoresturant/services/model/category_model.dart';
import 'package:ecoresturant/services/service/category_service.dart';

class CategoryRepository {
  CategoryService categoryService = CategoryService();

  Future<List<CategoryModel?>> getCategoryData() async {
    return categoryService.getCategoryData();
  }
}

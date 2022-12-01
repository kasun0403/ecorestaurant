part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategories extends CategoryEvent {
  const GetAllCategories();
}

class GetCategoryById extends CategoryEvent {
  const GetCategoryById();
}

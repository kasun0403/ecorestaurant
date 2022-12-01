part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryLoaded extends CategoryState {
  final CategoryModel categoryModel;
  const CategoryLoaded(this.categoryModel);
}

class AllCategoryLoaded extends CategoryState {
  final List<CategoryModel?> categories;
  const AllCategoryLoaded(this.categories);
}

class CategoryError extends CategoryState {
  const CategoryError();
}

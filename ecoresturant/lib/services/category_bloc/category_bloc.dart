import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../model/category_model.dart';
import '../repository/category_repository.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is GetAllCategories) {
      yield* _mapGetAllCategoriesEventToState(event);
    }

    if (event is GetCategoryById) {
      yield* _mapGetCategoryByIdEventToState(event);
    }
  }

  Stream<CategoryState> _mapGetAllCategoriesEventToState(
      GetAllCategories event) async* {
    yield CategoryLoading();
    var allCategories = await categoryRepository.getCategoryData();
    yield AllCategoryLoaded(allCategories);
  }

  Stream<CategoryState> _mapGetCategoryByIdEventToState(
      GetCategoryById event) async* {}
}

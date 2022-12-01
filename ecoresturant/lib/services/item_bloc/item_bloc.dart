import 'package:ecoresturant/services/model/item_model.dart';
import 'package:ecoresturant/services/repository/item_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc(this.itemRepository) : super(const ItemInitial());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is GetAllItems) {
      yield* _mapGetAllItemEventToState(event);
    }
    if (event is GetItemsBycategoryId) {
      yield* _mapGetItemByCategoryIdEventToState(event);
    }
  }

  Stream<ItemState> _mapGetAllItemEventToState(GetAllItems event) async* {
    yield const ItemLoading();
    var allItems = await itemRepository.getItemList();
    yield AllItemLoaded(allItems);
  }

  Stream<ItemState> _mapGetItemByCategoryIdEventToState(
      GetItemsBycategoryId event) async* {
    yield const ItemByCategoryLoading();
    var itemsBycategory =
        await itemRepository.getItemBycategoryId(event.categoryId);
    yield ItemByCategoryLoaded(itemsBycategory);
  }
}

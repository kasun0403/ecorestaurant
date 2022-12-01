part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {
  const ItemInitial();
}

class ItemLoading extends ItemState {
  const ItemLoading();
}

class AllItemLoaded extends ItemState {
  final List<ItemModel?> items;
  const AllItemLoaded(this.items);
}

class ItemByCategoryLoading extends ItemState {
  const ItemByCategoryLoading();
}

class ItemByCategoryLoaded extends ItemState {
  final List<ItemModel?> items;
  const ItemByCategoryLoaded(this.items);
}

class ItemError extends ItemState {
  const ItemError();
}

part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetAllItems extends ItemEvent {
  const GetAllItems();
}

class GetItemsBycategoryId extends ItemEvent {
  final String? categoryId;

  GetItemsBycategoryId(this.categoryId);

  @override
  List<Object> get props => [categoryId!];
}

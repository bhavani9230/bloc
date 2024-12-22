part of 'whishlist_bloc_bloc.dart';

@immutable
sealed class WhishlistBlocEvent {}

class WhishlistIntialEvent extends WhishlistBlocEvent {

}

class RemoveWhishListItemFromEvent extends  WhishlistBlocEvent {
  final ProductModal productModal;

  RemoveWhishListItemFromEvent({required this.productModal});
}

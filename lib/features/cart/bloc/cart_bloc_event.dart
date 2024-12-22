part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}


class CartIntialEvent extends CartBlocEvent {

}
class RemoveItemFromCartEvent extends CartBlocEvent{
  final ProductModal productModal;

  RemoveItemFromCartEvent({required this.productModal});

}

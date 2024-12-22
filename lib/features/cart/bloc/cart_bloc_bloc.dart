import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbasic/data/cart_items.dart';
import 'package:blocbasic/model/product_modal.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartIntialEvent>(cartIntialEvent);
    on<RemoveItemFromCartEvent>(removeItemFromCartEvent);
  }

  FutureOr<void> cartIntialEvent(CartIntialEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuceessState(cartItems: cartItems));
  }

  FutureOr<void> removeItemFromCartEvent(RemoveItemFromCartEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.productModal);
    emit(CartSuceessState(cartItems: cartItems));
  }
}


import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocbasic/data/cart_items.dart';
import 'package:blocbasic/data/grocery_data.dart';
import 'package:blocbasic/data/whishlist_items.dart';
import 'package:blocbasic/model/product_modal.dart';
import 'package:meta/meta.dart';
part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
     on<HomeProductWhishlistButtonEvent>(homeProductWhishlistButtonEvent);
    on<HomeProductCartButtonEvent>(homeProductCartButtonEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWhishListButtonNavigateEvent>(homeWhishListButtonNavigateEvent);
  }
  
   FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadingSuccessState(products:GroceryData.groceryItems.map((e)=>ProductModal(
      id: e['id'], 
      image:e['image'],
       name: e['name'], 
       price: e['price'])).toList()));
  }
 FutureOr<void> homeProductWhishlistButtonEvent(
      HomeProductWhishlistButtonEvent event, Emitter<HomeBlocState> emit) {
    print("Wishlist Product clicked");
    whishlistItems.add(event.clickedProducts); // Add product to wishlist
    // emit(WhishListActionState()); // Emit Wishlist action state
  }

  FutureOr<void> homeProductCartButtonEvent(
      HomeProductCartButtonEvent event, Emitter<HomeBlocState> emit) {
    print("Cart Product clicked");
    cartItems.add(event.clickedProducts); // Add product to cart
    // emit(CartItemActionState()); // Emit Cart action state
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
     print("Cart clicked");
     emit(HomeNaviagtetoCartListState());
  }

  FutureOr<void> homeWhishListButtonNavigateEvent(HomeWhishListButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
     print("whishlist clicked");
     emit(HomeNavigateToWhishListState());
  }
}

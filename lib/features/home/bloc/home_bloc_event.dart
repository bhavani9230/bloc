part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {
  
}
class HomeProductWhishlistButtonEvent extends HomeBlocEvent {
   final ProductModal clickedProducts;

  HomeProductWhishlistButtonEvent({required this.clickedProducts});
}

class HomeProductCartButtonEvent extends HomeBlocEvent {
    final ProductModal clickedProducts;

  HomeProductCartButtonEvent({required this.clickedProducts});

}

class HomeWhishListButtonNavigateEvent extends HomeBlocEvent {

}
class HomeCartButtonNavigateEvent extends HomeBlocEvent {

}
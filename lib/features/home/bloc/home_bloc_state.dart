part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeInitialState extends HomeBlocState {

}
class HomeLoadingState extends HomeBlocState {
  
}

class HomeLoadingSuccessState extends HomeBlocState {
  final List<ProductModal> products;
  HomeLoadingSuccessState({required this.products});

}
class HomeErrorState extends HomeBlocState {

}

class HomeNavigateToWhishListState extends HomeBlocState {

}
class HomeNaviagtetoCartListState extends HomeBlocState {

}

class WhishListActionState extends HomeBlocState {

}
class CartItemActionState extends HomeBlocState {
  
}
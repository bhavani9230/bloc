part of 'whishlist_bloc_bloc.dart';

@immutable
sealed class WhishlistBlocState {}

final class WhishlistBlocInitial extends WhishlistBlocState {}

final class WhishListActionState extends WhishlistBlocState {

}

class WhishListSuccessState extends WhishlistBlocState{
  final List<ProductModal> whishlistItems;

  WhishListSuccessState({required this.whishlistItems});
}

class WhishListIntialState extends WhishlistBlocState{}

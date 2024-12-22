part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

final class CartActionState extends CartBlocState {}

class CartSuceessState extends CartBlocState{
     final List<ProductModal> cartItems;
     CartSuceessState({required this.cartItems});

}
class CartIntialState extends CartBlocState{
   

  
}
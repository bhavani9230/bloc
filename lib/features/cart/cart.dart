import 'package:blocbasic/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:blocbasic/features/cart/cartTile.dart';
import 'package:blocbasic/features/home/productTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartIntialEvent());
  }
  final CartBlocBloc cartBloc = CartBlocBloc();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(onPressed: (){
            Navigator.pop(context);
        },
         icon:const Icon(CupertinoIcons.back)),
            backgroundColor: Colors.purpleAccent,
            middle: Text("Cart Screen",style: TextStyle( 
              color: Colors.white
            ),),),
          child: BlocConsumer(
            bloc: cartBloc,
             listener: (context,state){},
             listenWhen: (previous, current) => current is CartActionState,
             buildWhen: (previous, current) => current is !CartActionState,
            builder:(context,state) {
             switch (state.runtimeType) {
              case CartSuceessState:
              final succeessState = state as CartSuceessState;
              return ListView.builder(
                itemCount: succeessState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTile(
                    cartBloc: cartBloc,
                    productModal: succeessState.cartItems[index]);
                     });
                default:
                return Container();
             }
            },
            )
    );
  }
}
import 'package:blocbasic/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:blocbasic/features/home/bloc/home_bloc_bloc.dart';
import 'package:blocbasic/model/product_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final ProductModal productModal;
  final CartBlocBloc cartBloc;
  const CartTile({super.key, required this.productModal, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productModal.image),
                    fit: BoxFit.cover)),
          ),
          Expanded(flex: 2, child: Text("${productModal.name}")),
          Expanded(flex: 2, child: Text("Price: ${productModal.price}")),
          // IconButton(
          //     onPressed: () {
          //     //  homeBloc.add(HomeProductWhishlistButtonEvent(clickedProducts: productModal
                
          //     //  ));
          //     },
          //     icon: const Icon(CupertinoIcons.heart, color: Colors.purple)),
          IconButton(
              onPressed: () {
                cartBloc.add(RemoveItemFromCartEvent(productModal: productModal));
                
              },
              icon: const Icon(CupertinoIcons.delete_solid, color: Colors.purple)),
        ],
      ),
    );
  }
}

import 'package:blocbasic/features/home/bloc/home_bloc_bloc.dart';
import 'package:blocbasic/model/product_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModal productModal;
  final HomeBlocBloc homeBloc;
  const ProductTile({super.key, required this.productModal, required this.homeBloc});

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
          IconButton(
              onPressed: () {
               homeBloc.add(HomeProductWhishlistButtonEvent(clickedProducts: productModal
                
               ));
              },
              icon: const Icon(CupertinoIcons.heart, color: Colors.purple)),
          IconButton(
              onPressed: () {
                 homeBloc.add(HomeProductCartButtonEvent(clickedProducts: productModal));
              },
              icon: const Icon(CupertinoIcons.cart, color: Colors.purple)),
        ],
      ),
    );
  }
}

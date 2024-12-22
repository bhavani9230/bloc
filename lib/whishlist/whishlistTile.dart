import 'package:blocbasic/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:blocbasic/features/home/bloc/home_bloc_bloc.dart';
import 'package:blocbasic/model/product_modal.dart';
import 'package:blocbasic/whishlist/bloc/whishlist_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhishListTile extends StatelessWidget {
  final ProductModal productModal;
  final WhishlistBlocBloc whishlistBloc;
  const WhishListTile({super.key, required this.productModal, required this.whishlistBloc});

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
                whishlistBloc.add(RemoveWhishListItemFromEvent(productModal: productModal));
                
              },
              icon: const Icon(CupertinoIcons.delete_solid, color: Colors.purple)),
        ],
      ),
    );
  }
}

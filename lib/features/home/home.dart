import 'package:blocbasic/features/cart/cart.dart';
import 'package:blocbasic/features/home/bloc/home_bloc_bloc.dart';
import 'package:blocbasic/features/home/productTile.dart';
import 'package:blocbasic/whishlist/whishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBlocBloc homeBloc = HomeBlocBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeNaviagtetoCartListState || current is HomeNavigateToWhishListState,
      buildWhen: (previous, current) => current is! HomeNaviagtetoCartListState && current is! HomeNavigateToWhishListState,
      listener: (context, state) {
        if (state is HomeNaviagtetoCartListState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        } else if (state is HomeNavigateToWhishListState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WhishLitScreen()));
        }else if(state is WhishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added in WhishList")));

        }else if(state is CartItemActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added in Cart")));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const CupertinoPageScaffold(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HomeLoadingSuccessState) {
          final successState = state as HomeLoadingSuccessState;
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.purpleAccent,
              middle: const Text(
                "Grocery App",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWhishListButtonNavigateEvent());
                      },
                      icon: const Icon(CupertinoIcons.heart,
                          color: Colors.white)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(CupertinoIcons.cart,
                          color: Colors.white)),
                ],
              ),
            ),
            child:ListView.builder(
              itemCount: successState.products.length,
              itemBuilder: (context, index) {
                return ProductTile(productModal: successState.products[index], homeBloc:homeBloc, 
                 

                );
              })
          );
        } else if (state is HomeErrorState) {
          return CupertinoPageScaffold(
            child: Center(child: Text('Error')),
          );
        }
        return CupertinoPageScaffold(
          child: Center(child: Text('Unexpected State')),
        );
      },
    );
  }
}

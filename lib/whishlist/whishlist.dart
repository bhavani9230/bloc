import 'package:blocbasic/whishlist/bloc/whishlist_bloc_bloc.dart';
import 'package:blocbasic/whishlist/whishlistTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhishLitScreen extends StatefulWidget {
  const WhishLitScreen({super.key});

  @override
  State<WhishLitScreen> createState() => _WhishLitScreenState();
}

class _WhishLitScreenState extends State<WhishLitScreen> {
  final WhishlistBlocBloc whishlistBloc = WhishlistBlocBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whishlistBloc.add(WhishlistIntialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(CupertinoIcons.back)),
            backgroundColor: Colors.purpleAccent,
            middle: Text("WhishList Screen",style: TextStyle( 
              color: Colors.white
            ),),),
          child: BlocConsumer(
            bloc: whishlistBloc,
             listener: (context,state){},
             listenWhen: (previous, current) => current is WhishListActionState,
             buildWhen: (previous, current) => current is !WhishListActionState,
            builder:(context,state) {
             switch (state.runtimeType) {
              case WhishListSuccessState:
              final succeessState = state as WhishListSuccessState;
              return ListView.builder(
                itemCount: succeessState.whishlistItems.length,
                itemBuilder: (context, index) {
                  return WhishListTile(
                    whishlistBloc: whishlistBloc,
                    productModal: succeessState.whishlistItems[index]);

                });

                default:
                return Container();
             }
            },
            ),
    );
  }
}
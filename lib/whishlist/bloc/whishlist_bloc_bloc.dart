import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbasic/data/whishlist_items.dart';
import 'package:blocbasic/model/product_modal.dart';
import 'package:meta/meta.dart';

part 'whishlist_bloc_event.dart';
part 'whishlist_bloc_state.dart';

class WhishlistBlocBloc extends Bloc<WhishlistBlocEvent, WhishlistBlocState> {
  WhishlistBlocBloc() : super(WhishlistBlocInitial()) {
   on<WhishlistIntialEvent>(whishlistIntialEvent);
   on<RemoveWhishListItemFromEvent>(removeWhishListItemFromEvent);
  }

  FutureOr<void> whishlistIntialEvent(WhishlistIntialEvent event, Emitter<WhishlistBlocState> emit) {
    emit(WhishListSuccessState(whishlistItems: whishlistItems));
  }

  FutureOr<void> removeWhishListItemFromEvent(RemoveWhishListItemFromEvent event, Emitter<WhishlistBlocState> emit) {
    whishlistItems.remove(event.productModal);
    emit(WhishListSuccessState(whishlistItems: whishlistItems));
  }
}

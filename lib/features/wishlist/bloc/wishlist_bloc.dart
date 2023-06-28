import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/wishlist_item.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveItemEvent>(wishlistRemoveItemEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveItemEvent(WishlistRemoveItemEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.clickedToRemoveProduct);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
    emit(WishListRemoveItemActionState());
  }
}

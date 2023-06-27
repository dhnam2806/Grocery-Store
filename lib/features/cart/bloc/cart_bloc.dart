import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/cart_item.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemEvent>(cartRemoveItemEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveItemEvent(
      CartRemoveItemEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.clickedToRemoveProduct);
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartRemoveItemActionState());
  }
}

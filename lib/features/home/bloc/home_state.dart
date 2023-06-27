part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageState extends HomeActionState {}

class HomeNavigateToCartPageState extends HomeActionState {}

class HomeProductWishlistedActionState extends HomeActionState {

}

class HomeProductCartedActionState extends HomeActionState {

}

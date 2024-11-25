part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeCartButtonEvent extends HomeEvent {
  final ProductDataModel clickedProducts;

  HomeCartButtonEvent({required this.clickedProducts});
}

class HomeWishlistButtonEvent extends HomeEvent {
  final ProductDataModel clickedProducts;

  HomeWishlistButtonEvent({required this.clickedProducts});
}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeWishlistNavigateEvent extends HomeEvent {}


// In this event -- will add event like botton_click and navigation like this

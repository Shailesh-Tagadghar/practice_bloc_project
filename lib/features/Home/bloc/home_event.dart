part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeCartButtonEvent extends HomeEvent {}

class HomeWishlistButtonEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeWishlistNavigateEvent extends HomeEvent {}

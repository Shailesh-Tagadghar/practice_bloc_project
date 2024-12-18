part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeCartNavigateActionState extends HomeActionState {}

class HomeWishlistNavigateActionState extends HomeActionState {}

class HomeWishlistAddedAction extends HomeActionState {}

class HomeCartAddedAction extends HomeActionState {}


// home state -- here will define states of our page like loading, success, error and Action state.

part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({
    required this.cartItems,
  });
}

final class CartRemoveSuccessState extends CartActionState {}

final class CartErrorState extends CartState {}

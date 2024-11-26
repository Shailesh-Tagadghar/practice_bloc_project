part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSucessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistSucessState({required this.wishlistItems});
}

final class WishlistRemoveSuccessState extends WishlistActionState {}

final class WishlistErrorState extends WishlistState {}

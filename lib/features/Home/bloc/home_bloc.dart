import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_bloc_project/features/Home/UI/models/product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeWishlistButtonEvent>(homeWishlistButtonEvent);

    on<HomeCartButtonEvent>(homeCartButtonEvent);

    on<HomeCartNavigateEvent>(homeCartNavigateEvent);

    on<HomeWishlistNavigateEvent>(homeWishlistNavigateEvent);
  }

  FutureOr<void> homeWishlistButtonEvent(
      HomeWishlistButtonEvent event, Emitter<HomeState> emit) {
    print('Wishlist icon clicked');
  }

  FutureOr<void> homeCartButtonEvent(
      HomeCartButtonEvent event, Emitter<HomeState> emit) {
    print('Cart icon clicked');
  }

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    print('Navigating to Cart Screen');
    emit(HomeCartNavigateActionState());
  }

  FutureOr<void> homeWishlistNavigateEvent(
      HomeWishlistNavigateEvent event, Emitter<HomeState> emit) {
    print('Navigating to Wishlist Screen');
    emit(HomeWishlistNavigateActionState());
  }
}


//in this bloc -- will write logic like navigate the page or click on icon 

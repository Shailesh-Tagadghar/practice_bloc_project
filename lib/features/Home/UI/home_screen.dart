import 'package:flutter/material.dart';
import 'package:practice_bloc_project/features/Cart/UI/cart_screen.dart';
import 'package:practice_bloc_project/features/Home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc_project/features/Wishlist/UI/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeCartNavigateActionState) {
          print('working but not navigate');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeWishlistNavigateActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text(
              'Grocery List',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            toolbarHeight: 60,
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistNavigateEvent());
                  },
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartNavigateEvent());
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
        );
      },
    );
  }
}

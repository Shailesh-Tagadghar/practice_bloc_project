import 'package:flutter/material.dart';
import 'package:practice_bloc_project/features/Home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      // buildWhen: (previous, current) {},
      // listenWhen: (previous, current) {},
      listener: (context, state) {},
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

import 'package:flutter/material.dart';
import 'package:practice_bloc_project/features/Cart/UI/cart_screen.dart';
import 'package:practice_bloc_project/features/Home/UI/models/product_data_model.dart';
import 'package:practice_bloc_project/features/Home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc_project/features/Wishlist/UI/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeCartNavigateActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeWishlistNavigateActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (HomeLoadingSuccessState):
            final ProductDataModel productDataModel;
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text(
                  'Grocery App',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                toolbarHeight: 70,
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
              body: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                  ),
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    final productDataModel = successState.products[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        productDataModel.imageUrl))),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Name : ${productDataModel.name}',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price : \$ ${productDataModel.price.toString()}',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            );
          case const (HomeErrorState):
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

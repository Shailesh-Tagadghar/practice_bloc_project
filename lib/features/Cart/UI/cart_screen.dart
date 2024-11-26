import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc_project/features/Cart/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Cart Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartRemoveSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item Remove from Cart')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (CartSuccessState):
              final successState = state as CartSuccessState;
              return ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                  ),
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    final productDataModel = successState.cartItems[index];
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
                                    onPressed: () {
                                      // cartBloc.add(HomeWishlistButtonEvent(
                                      //   clickedProducts: productDataModel,
                                      // ));
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartBloc.add(CartRemoveEvent(
                                        productDataModel: productDataModel,
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.shopping_cart,
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
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}

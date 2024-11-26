import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc_project/features/Wishlist/bloc/wishlist_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Wishlist Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistRemoveSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item Remove from Favorite')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (WishlistSucessState):
              final successState = state as WishlistSucessState;
              return ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                  ),
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    final productDataModel = successState.wishlistItems[index];
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
                                      wishlistBloc.add(WishlistRemoveEvent(
                                        productDataModel: productDataModel,
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
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

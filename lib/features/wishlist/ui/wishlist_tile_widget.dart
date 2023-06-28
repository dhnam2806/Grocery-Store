import 'package:flutter/material.dart';
import 'package:learn_bloc/features/home/models/home_product_data_model.dart';
import 'package:learn_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(productDataModel.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          productDataModel.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(productDataModel.description),
        SizedBox(height: 12),
        Text("\$ " + productDataModel.price.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                wishlistBloc.add(WishlistRemoveItemEvent(clickedToRemoveProduct: productDataModel));
              },
              icon: Icon(Icons.bookmark_remove_outlined),
            ),
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
      ]),
    );
  }
}

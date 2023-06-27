import 'package:flutter/material.dart';
import 'package:learn_bloc/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

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
                // cartBloc.add();
              },
              icon: Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {
                cartBloc.add(CartRemoveItemEvent(clickedToRemoveProduct: productDataModel));
              },
              icon: Icon(Icons.remove_shopping_cart_outlined),
            ),
          ],
        ),
      ]),
    );
  }
}

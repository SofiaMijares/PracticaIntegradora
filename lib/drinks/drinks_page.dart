import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/profile.dart';

class DrinksPage extends StatelessWidget {
  final Map<String, List> products;
  DrinksPage({
    Key key,
    @required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bebidas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              //Navigator.of(context).push(
                //MaterialPageRoute(builder: (_) => Cart()),
              //);
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(products);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: products["DRINKS"].length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDrinks(
            drink: products["DRINKS"][index],
            onProdAddedToCart: _cartUpdated,
          );
        },
      ),
    );
  }

  void _cartUpdated(ProductCart value) {
    if (products["CART"] == null)
      products["CART"] = value.drinks;
    else
      for (var item in value.drinks) products["CART"].add(item);
  }

  
}

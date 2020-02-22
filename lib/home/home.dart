import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/cups_page.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/grains/grains_page.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, List> _products;
  @override
  void initState() {
    _products = Map();
    _products["DRINKS"] = ProductRepository.loadProducts(ProductType.BEBIDAS);
    _products["GRAINS"] = ProductRepository.loadProducts(ProductType.GRANO);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
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
            onPressed: _openCartPage,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
            title: "Cafe en grano",
            image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          
          GestureDetector(
            onTap: _openCupsPage,
            child: ItemHome(
            title: "Tazas",
            image:
                "https://www.homestratosphere.com/wp-content/uploads/2018/07/types-of-coffee-glasses-072618.jpg",
          ),)
          
        ],
      ),
    );
  }




  void _openDrinksPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DrinksPage(products: _products);
        },
      ),
    ).then((updatedDrinks) {
      _products = updatedDrinks;
    });
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GrainsPage(products: _products)),
    );
  }

  void _openCupsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CupsPage(products: _products)),
    );
  }

  void _openCartPage() {
    List<ProductItemCart> _cartProds = List();
    if (_products["CART"] != null) {
      for (var item in _products["CART"]) {
        var prod = ProductItemCart(
          productTitle: item.productTitle,
          productAmount: item.productAmount,
          productPrice: item.productPrice,
        );
        _cartProds.add(prod);
      }
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Cart(productsList: _cartProds)),
    );
  }
}

// TODO: Crear producto "ProductCup" siguiendo la logica de Drinks y Grains
// TODO: Agregar al ProductRepository una lista de estos productos.
import 'dart:math';
import 'package:flutter/foundation.dart';

enum ProductColor { AZUL, BLANCO, ANARANJADO }

class ProductCups {
  String productTitle; // nombre del producto
  String productDescription; // descripcion del producto
  String productImage; // url de imagen del producto
  ProductColor productColor; // tamano del producto
  double productPrice; // precio del producto autocalculado
  int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductCups({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo a la size del producto
    productPrice = productPriceCalculator();
  }

  // Mandar llamar este metodo cuando se cambie el tamanio del producto
  // De esta manera el precio del nuevo tamanio del producto se autocalcula
  // Por ejemplo cuando se cambie a M
  //
  // FlatButton(
  //   child: Text("M"),
  //   onPressed: () {
  //     setState(() {
  //       prod.productSize = ProductSize.M;
  //       prod.productPrice = prods.productPriceCalculator();
  //     });
  //   },
  // ),
  //
  //
  double productPriceCalculator() {
    if (this.productColor == ProductColor.ANARANJADO)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productColor == ProductColor.AZUL)
      return (40 + Random().nextInt(60)).toDouble();
    if (this.productColor == ProductColor.BLANCO)
      return (60 + Random().nextInt(80)).toDouble();
    return 999.0;
  }
}

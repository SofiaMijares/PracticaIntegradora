import 'package:flutter/foundation.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  int productSize;
  final ProductType typeOfProduct;

  ProductItemCart({
    this.typeOfProduct,
    this.productSize,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
  });
}

import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_cups.dart';

class ProductCart {
  List<ProductDrinks> drinks;
  List<ProductGrains> grains;
  List<ProductGrains> cups;

  ProductCart({
    this.drinks,
    this.grains,
    this.cups,
  });
}
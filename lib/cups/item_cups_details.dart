import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_cups.dart';

class ItemCupsDetails extends StatefulWidget {
  final ProductCups cup;
  ItemCupsDetails({
    Key key,
    @required this.cup,
  }) : super(key: key);

  @override
  _ItemCupsDetailsState createState() => _ItemCupsDetailsState();
}

class _ItemCupsDetailsState extends State<ItemCupsDetails> {
  ProductCart cartProducts = ProductCart();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detalles"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(cartProducts);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                color: Color(0xffEC9762),
                margin: EdgeInsets.all(24),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        "${widget.cup.productImage}",
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.favorite,
                        color: widget.cup.liked ? Colors.red : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text("${widget.cup.productTitle}", style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 20,
                    ),
                    ),
            Text("${widget.cup.productDescription}", style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 18,
                    ),),
            Text("${widget.cup.productPrice}", style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 25,
                    ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Text("Tamaños disponibles:${widget.drink.productSize}"),
                Text("."),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: MaterialButton(
                      color: Color(0xffbcb0a1),
                      child: Text("AGREGAR AL CARRITO",style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 12,
                    color: Colors.white,
                    ),),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: MaterialButton(
                      color: Color(0xffbcb0a1),
                      child: Text("COMPRAR AHORA",style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 12,
                    color: Colors.white,
                    ),),
                      onPressed: () {
                        print("Prod Added ...");
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Product added..."),
                            ),
                          );
                        /*if (cartProducts.cups == null) {
                          cartProducts.cups = List<ProductCups>();
                          widget.cup.productAmount += 1;
                          cartProducts.cups.add(widget.cup);
                        } else {
                          int i = 0;
                          for (var item in cartProducts.cups) {
                            if (item.productTitle ==
                                widget.cup.productTitle) {
                              cartProducts.cups[i].productAmount += 1;
                            }
                            ++i;
                          }
                        }*/
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

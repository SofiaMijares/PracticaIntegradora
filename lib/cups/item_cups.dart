import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/Cups/item_Cups_details.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_cups.dart';

class ItemCups extends StatefulWidget {
  final ProductCups cup;
  final ValueChanged<ProductCart> onProdAddedToCart;
  ItemCups({
    Key key,
    @required this.onProdAddedToCart,
    @required this.cup,
  }) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ItemCupsDetails(
                cup: widget.cup,
              ),
            ),
          )
              .then(
            (cartProducts) {
              if ((cartProducts as ProductCart).cups != null) {
                widget.onProdAddedToCart(cartProducts);
              }
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xffbcb0a1), Color(0xff8b8175)])
          ),
          height: 180,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(child: Text("Cafe",style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 16,
                    ),
                    textAlign: TextAlign.center
                    ),
                    ),
                    Expanded(child: Text("${widget.cup.productTitle}",style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 18,
                    color: Colors.white,
                    ),
                    textAlign: TextAlign.center
                    )
                    ),
                    Expanded(child: Text("${widget.cup.productPrice}", style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Medium',
                    fontSize: 20,
                    ),
                    textAlign: TextAlign.left)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  child: Image.network(
                    "${widget.cup.productImage}",
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: widget.cup.liked ? Colors.red : Colors.black,
                ),
                onPressed: _likedProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _likedProduct() {
    setState(() {
      widget.cup.liked = !widget.cup.liked;
    });
  }
}

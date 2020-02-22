import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/grains/item_grains_details.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  final ValueChanged<ProductCart> onProdAddedToCart;
  ItemGrains({
    Key key,
    @required this.onProdAddedToCart,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
              builder: (context) => ItemGrainsDetails(
                grain: widget.grain,
              ),
            ),
          )
              .then(
            (cartProducts) {
              if ((cartProducts as ProductCart).grains != null) {
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
                    Expanded(child: Text("${widget.grain.productTitle}",style: TextStyle(
                    fontFamily: 'Akzidenz Grotesk Light',
                    fontSize: 18,
                    color: Colors.white,
                    ),
                    textAlign: TextAlign.center
                    )
                    ),
                    Expanded(child: Text("${widget.grain.productPrice}", style: TextStyle(
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
                    "${widget.grain.productImage}",
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: widget.grain.liked ? Colors.red : Colors.black,
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
      widget.grain.liked = !widget.grain.liked;
    });
  }
}

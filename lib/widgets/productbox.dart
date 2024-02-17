//packages
import 'package:flutter/material.dart';

//providers
import '/providers/products.dart';

class ProductBox extends StatelessWidget {
  final Product prod;
  ProductBox({required this.prod});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(41, 0, 0, 0),
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                child: Text(
                  prod.name,
                  style: const TextStyle(
                    fontFamily: 'iosReg',
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 2.5),
              Text(
                'EGP ${prod.price}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                  fontFamily: 'ios',
                ),
              ),
              const SizedBox(height: 12.5),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 7,
          child: SizedBox(
            width: 130,
            // height: 100,
            child: Image.asset(
              prod.imgs[0][0],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

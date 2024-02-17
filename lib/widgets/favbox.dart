//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:like_button/like_button.dart';

//providers
import '/providers/products.dart';

class FavBox extends StatelessWidget {
  final Product prod;
  FavBox({required this.prod});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: 150,
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 2.5),
              FittedBox(
                child: Text(
                  prod.brand,
                  style: TextStyle(
                    fontFamily: 'ios',
                    color: Theme.of(context).primaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 7,
          child: SizedBox(
            width: 130,
            child: Image.asset(
              prod.imgs[0][0],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 7.5,
          right: 20,
          child: LikeButton(
            likeBuilder: (isLiked) {
              return isLiked
                  ? const Icon(Icons.favorite_rounded, color: Colors.pink)
                  : const Icon(
                      Icons.favorite_rounded,
                      color: Colors.white,
                    );
            },
            isLiked:
                provider.favorites.where((element) => element == prod).length ==
                    1,
            onTap: (isLiked) async {
              HapticFeedback.mediumImpact();
              isLiked ? provider.removeFav(prod) : provider.addFav(prod);
              return !isLiked;
            },
          ),
        ),
      ],
    );
  }
}

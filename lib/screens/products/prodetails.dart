//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:like_button/like_button.dart';
// ignore: depend_on_referenced_packages
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//widgets
import '/widgets/badge.dart';
import '/widgets/imgview.dart';
import '/widgets/colourview.dart';

// ignore: use_key_in_widget_constructors
class ProdDetails extends StatelessWidget {
  static const routeName = './prodetails.dart';

  @override
  Widget build(BuildContext context) {
    final prod = ModalRoute.of(context)?.settings.arguments as Product;
    final form = Provider.of<FormProvider>(context);
    final provider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
          size: 22,
        ),
        actions: [
          Badges(
            color: const Color.fromRGBO(235, 190, 170, 1),
            value: provider.cart.length,
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: prod.type == 'Car Seats' ? 885 : 870,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Image.asset(
                  prod.imgs[form.prodColour][form.img],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ImgView(prod: prod),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  prod.name,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontFamily: 'iosReg',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  prod.type,
                  style: const TextStyle(
                    color: Color.fromARGB(121, 158, 158, 158),
                    fontSize: 15,
                    fontFamily: 'iosReg',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  prod.details,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontFamily: 'iosReg',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 90,
                  child: ColourView(prod: prod),
                ),
              ),
              Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rental price per day',
                        style: TextStyle(
                          fontFamily: 'iosReg',
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'EGP ${prod.price}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'iosReg',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ' Customers Raiting',
                        style: TextStyle(
                          fontFamily: 'iosReg',
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SmoothStarRating(
                        rating: prod.rating,
                        size: 20,
                        color: Colors.amber,
                        borderColor: Colors.amber,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 1,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  const SizedBox(width: 19),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      provider.add2Cart(prod);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            textColor: Colors.amber,
                            label: 'Undo   ',
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              provider.remove4Cart(prod);
                            },
                          ),
                          content: const Text(
                            '  Item added to cart',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      width: 220,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 37, 164, 160),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.5),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              wordSpacing: 2,
                              color: Colors.white,
                              fontFamily: 'iosReg',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 110,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(235, 190, 170, 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.5),
                      ),
                    ),
                    child: LikeButton(
                      size: 23,
                      likeBuilder: (isLiked) {
                        return isLiked
                            ? const Icon(Icons.favorite_rounded,
                                color: Colors.pink)
                            : const Icon(
                                Icons.favorite_rounded,
                                color: Colors.white,
                              );
                      },
                      isLiked: provider.favorites
                              .where((element) => element == prod)
                              .length ==
                          1,
                      onTap: (isLiked) async {
                        HapticFeedback.mediumImpact();
                        isLiked
                            ? provider.removeFav(prod)
                            : provider.addFav(prod);
                        return !isLiked;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

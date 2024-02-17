//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/addcard.dart';
import '/widgets/creditCard.dart';

class CardView extends StatefulWidget {
  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context);
    CreditCard creditCard =
        user.getByUsername(user.currentUser).creditCards.isNotEmpty
            ? user.getByUsername(user.currentUser).creditCards[0]
            : CreditCard(cvv: '', name: '', number: '', expiryDate: '');
    return Column(
      children: <Widget>[
        //text
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Avaliable Credit Cards: ${user.getByUsername(user.currentUser).creditCards.length}',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        user.getByUsername(user.currentUser).creditCards.isEmpty
            ? Column(
                children: <Widget>[
                  Image.asset(
                    './assets/images/addcredit.gif',
                    height: 225,
                  ),
                  const Text(
                    "You don't have creditcards added.",
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Open Sans',
                      fontSize: 15,
                    ),
                  )
                ],
              )
            : CarouselSlider(
                items: user
                    .getByUsername(user.currentUser)
                    .creditCards
                    .map((card) {
                  return CreditCardWidget(
                    name: card.name,
                    number:
                        '************${card.number.substring(card.number.length - 3, card.number.length)}',
                    expiryDate: card.expiryDate,
                    cvv: '***',
                  );
                }).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) => creditCard =
                      user.getByUsername(user.currentUser).creditCards[index],
                  height: 240,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  enlargeCenterPage:
                      user.getByUsername(user.currentUser).creditCards.length ==
                              1
                          ? false
                          : true,
                ),
              ),
        const SizedBox(height: 30),
        //buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //addButton
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AddCreditCard.routeName);
              },
              child: Container(
                height: 60,
                width: 155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset(2, 10),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.25,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Add",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontFamily: 'Open Sans'),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),

            //deleteButton
            GestureDetector(
              onTap: () {
                user.deleteCredit(creditCard);
              },
              child: Container(
                height: 60,
                width: 155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset(2, 10), // Shadow position
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.25,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.delete_outline_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

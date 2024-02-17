//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';

//screens
import '/screens/products/prodgate.dart';

//widgets
import '/widgets/homegrid2.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  provider.reset();

                  provider.setCategory('Car Seats');
                  Navigator.pushNamed(context, ProdGate.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: 165,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(7, 0, 0, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Car Seats',
                        style: TextStyle(
                          color: Color.fromARGB(180, 0, 0, 0),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          './assets/images/seat.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  provider.reset();
                  provider.setCategory('Strollers');
                  Navigator.pushNamed(context, ProdGate.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: 170,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(7, 0, 0, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Strollers\n& Wagons',
                        style: TextStyle(
                          color: Color.fromARGB(180, 0, 0, 0),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          './assets/images/stroller.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: HomeGrid2(),
        ),
      ],
    );
  }
}

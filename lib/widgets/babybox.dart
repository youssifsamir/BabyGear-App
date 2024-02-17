//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

class BabyBox extends StatelessWidget {
  final Baby baby;
  final bool last;
  BabyBox({required this.baby, required this.last});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        provider.setCurrentBaby(baby);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: last ? Colors.white : const Color.fromARGB(13, 0, 0, 0),
            ),
          ),
        ),
        padding: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //image
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    baby.gender == 'Boy'
                        ? './assets/images/boy.png'
                        : './assets/images/girl.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            //detials
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //name
                  Text(
                    baby.name,
                    style: const TextStyle(
                      color: Color.fromARGB(153, 0, 0, 0),
                      fontSize: 24,
                      fontFamily: 'Freehand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //age
                  Text(
                    baby.months
                        ? baby.age == 0
                            ? 'New Born'
                            : '${baby.age.toString()} months'
                        : '${baby.age.toString()} years',
                    style: const TextStyle(
                      color: Color.fromARGB(153, 0, 0, 0),
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 90),
            provider.currentBaby == baby
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 17,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 15,
                      child: const Icon(
                        Icons.done_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

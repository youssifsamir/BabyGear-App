//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/addbaby.dart';
import '/widgets/babyview.dart';

// ignore: use_key_in_widget_constructors
class SelectBaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: const EdgeInsets.only(right: 12),
        child: GestureDetector(
          onTap: () {
            HapticFeedback.heavyImpact();
            showModalBottomSheet(
              enableDrag: false,
              backgroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (context) {
                return SizedBox(
                  height: provider
                              .getByUsername(provider.currentUser)
                              .babies
                              .length !=
                          1
                      ? 400
                      : 310,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 15),
                      Container(
                        width: 40,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Shop For',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 28,
                            fontFamily: 'Freehand',
                          ),
                        ),
                      ),
                      const Center(
                        child: SizedBox(
                          width: 250,
                          child: Divider(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: BabyView(),
                      ),
                      AddBaby(),
                      const SizedBox(height: 30)
                    ],
                  ),
                );
              },
            );
          },
          child: Consumer<AccountsProvider>(
            builder: (context, account, _) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      provider.currentBaby.gender == 'Boy'
                          ? './assets/images/boy.png'
                          : provider.currentBaby.gender == 'null'
                              ? './assets/images/babyavatar.png'
                              : './assets/images/girl.png',
                    ),
                  ),
                ),
                provider.currentBaby.name == ''
                    ? const SizedBox(height: 7)
                    : Text(
                        provider.currentBaby.name,
                        style: const TextStyle(
                          fontSize: 9,
                          fontFamily: 'Freehand',
                          color: Colors.black54,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

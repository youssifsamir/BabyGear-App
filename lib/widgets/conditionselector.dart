//packages
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';

//providers
import '/providers/form.dart';

// ignore: use_key_in_widget_constructors
class ConditionSelector extends StatefulWidget {
  @override
  State<ConditionSelector> createState() => _ConditionSelectorState();
}

class _ConditionSelectorState extends State<ConditionSelector> {
  int cond = 2;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    // ignore: no_leading_underscores_for_local_identifiers
    final _scrollController =
        FixedExtentScrollController(initialItem: provider.index2);
    // ignore: no_leading_underscores_for_local_identifiers
    final List<String> _conditions = [
      'Poor',
      'Fair',
      'Good',
      'Excellent',
      'Brand New',
    ];

    return GestureDetector(
      onTap: () {
        provider.setCondition(_conditions[cond]);

        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.grey[100],
          context: context,
          builder: (context) => SizedBox(
            height: 350,
            child: ClickableListWheelScrollView(
              scrollController: _scrollController,
              itemHeight: 0,
              itemCount: _conditions.length,
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: 40,
                physics: const FixedExtentScrollPhysics(),
                overAndUnderCenterOpacity: 0.1,
                perspective: 0.01,
                onSelectedItemChanged: (index) {
                  setState(() {
                    cond = index;
                  });
                  HapticFeedback.mediumImpact();
                  provider.setCondition(_conditions[index]);
                  provider.setIndex2(index);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color.fromARGB(24, 0, 0, 0)),
                          bottom:
                              BorderSide(color: Color.fromARGB(24, 0, 0, 0)),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _conditions[index],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: _conditions.length,
                ),
              ),
            ),
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black38,
                width: 0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            width: 140,
            height: 30,
          ),
          Positioned(
            top: 5,
            left: 10,
            child: Text(
              provider.condition,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Positioned(
            top: 5,
            right: 5,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black26,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

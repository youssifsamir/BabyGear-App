//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';

//providers
import '/providers/form.dart';

// ignore: use_key_in_widget_constructors
class ColorSelector extends StatefulWidget {
  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int col = 6;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    // ignore: no_leading_underscores_for_local_identifiers
    final _scrollController =
        FixedExtentScrollController(initialItem: provider.index);

    final List<String> color = [
      'Red',
      'Brown',
      'Organe',
      'Yellow',
      'Lime',
      'Green',
      'Teal',
      'Navy Blue',
      'Blue',
      'Baby Blue',
      'Indigo',
      'Purple',
      'Pink',
      'Black',
      'White',
    ];

    // ignore: no_leading_underscores_for_local_identifiers
    final List<Color> _colors = [
      Colors.red,
      Colors.brown,
      Colors.orange,
      Colors.yellow,
      Colors.lime,
      Colors.green,
      Colors.teal,
      Colors.blueAccent,
      Colors.blue,
      Colors.lightBlue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.black,
      Colors.white,
    ];

    return GestureDetector(
      onTap: () {
        provider.setColor(_colors[col]);

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
              itemCount: _colors.length,
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: 45,
                physics: const FixedExtentScrollPhysics(),
                overAndUnderCenterOpacity: 0.15,
                perspective: 0.01,
                onSelectedItemChanged: (index) {
                  setState(() {
                    col = index;
                  });
                  HapticFeedback.mediumImpact();
                  provider.setColor(_colors[index]);
                  provider.setIndex(index);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) => Container(
                    height: 10,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color.fromARGB(24, 0, 0, 0)),
                        bottom: BorderSide(color: Color.fromARGB(24, 0, 0, 0)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          color[index],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          margin: const EdgeInsets.only(top: 3.5),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: _colors[index],
                          ),
                        )
                      ],
                    ),
                  ),
                  childCount: _colors.length,
                ),
              ),
            ),
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 30,
            decoration: BoxDecoration(
              color: provider.color,
              border: Border.all(
                color: Colors.black38,
                width: 0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: provider.color != Colors.white &&
                      provider.color != Colors.black
                  ? Colors.white
                  : Colors.black26,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

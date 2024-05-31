import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatefulWidget {
  final Function(List<String>) updateSelectedChoices;

  Footer({required this.updateSelectedChoices});

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<String> choices = [
    'cinema',
    'petanque',
    'fitness',
    'League Of Legend',
    'basket',
    'shopping',
    'programmation'
  ];

  List<String> selectedChoices = [];

  void _onChoiceSelected(String choice) {
    setState(() {
      if (selectedChoices.contains(choice)) {
        selectedChoices.remove(choice);
      } else {
        selectedChoices.add(choice);
      }
      widget.updateSelectedChoices(selectedChoices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Wrap(
          spacing: 4,
          runSpacing: 6,
          children: choices
              .map((choice) => ChoiceItem(
            choice: choice,
            isSelected: selectedChoices.contains(choice),
            onSelected: _onChoiceSelected,
          ))
              .toList(),
        ),
      ),
    );
  }
}

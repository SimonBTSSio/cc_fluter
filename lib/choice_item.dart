import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String choice;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  ChoiceItem({required this.choice, required this.isSelected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(choice),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          choice
        ),
      ),
    );
  }
}

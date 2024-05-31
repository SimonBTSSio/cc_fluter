import 'package:flutter/material.dart';
import 'detail.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;
  final List<Map<String, String>> choiceDetails;

  Header({this.selectedChoices = const [], required this.choiceDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vos choix :',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          selectedChoices.isEmpty
              ? const Text(
            "Cliquez sur les choix en-dessous !",
            style: TextStyle(color: Colors.white),
          )
              : Wrap(
            children: selectedChoices
                .map((choice) {
              final detail = choiceDetails.firstWhere((element) => element['title'] == choice);
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          choiceDetail: detail,
                        ),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text(choice),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )
                  ),
                ),
              );
            })
                .toList(),
          ),
        ],
      ),
    );
  }
}

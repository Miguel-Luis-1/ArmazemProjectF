import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final String title;
  final String text;

  const ShowText({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey), // Adiciona cor à borda
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}

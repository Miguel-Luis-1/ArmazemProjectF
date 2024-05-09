import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBase extends StatelessWidget {
  final String title;
  final String alert;
  final TextEditingController textController;
  final bool isNuber;
  final bool isPassword;

  const InputBase({
    required this.title,
    required this.alert,
    required this.textController,
    this.isNuber = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    getTipe(isNuber) {
      if (isNuber) {
        return const TextInputType.numberWithOptions(decimal: true);
      } else {
        return TextInputType.text;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
        child: TextFormField(
          controller: textController,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: title,
            border: InputBorder.none,
          ),
          keyboardType: getTipe(isNuber),
          validator: (value) {
            if (value!.isEmpty) {
              return alert;
            }
            return null;
          },
        ),
      ),
    );
  }
}

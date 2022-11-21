import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pesquisa extends StatelessWidget {
  Function(String)? onChanged;
  Pesquisa({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      color: Colors.blueGrey,
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          hintText: 'Pesquisar',
          hintStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(31.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(31.0)),
              borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(31.0)),
            borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
          ),
        ),
      ),
    );
  }
}

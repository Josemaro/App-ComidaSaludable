/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {

  String img;
  Card1(this.img);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          child: Image.network(
            img,
            fit: BoxFit.cover,
          )
        )
      ),
    );
  }
}
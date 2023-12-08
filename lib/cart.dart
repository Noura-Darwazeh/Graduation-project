import 'package:flutter/material.dart';
import 'package:soft/bottom_bar.dart';

import 'CartAppBar.dart';
import 'cartItemSamples.dart';
import 'cartbar.dart';

class cart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      body: cartItemSamples(),
      bottomNavigationBar: cartbar(),
    );
  }}
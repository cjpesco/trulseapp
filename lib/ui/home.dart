import 'package:flutter/material.dart';
import 'package:trulseapp/ui/trulsepage.dart';

class TrulseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('How Filipino Are You?'),
        centerTitle: true,
        //    backgroundColor: Colors.blueGrey,
      ),
      body: TrulsePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
          actions: [
            IconButton(
              icon: Icon(CarbonIcons.help),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                CarbonIcons.pills_add,
                size: 64.0,
                color: Colors.orange,
              ),
              Icon(
                CarbonIcons.phone,
                color: Colors.blue,
                size: 64.0,
              ),
              Icon(
                CarbonIcons.car_front,
                color: Colors.red,
                size: 64.0,
              ),
              Icon(
                CarbonIcons.shopping_cart,
                color: Colors.green,
                size: 64.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

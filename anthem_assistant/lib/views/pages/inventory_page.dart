import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text("This page will be used for inventory management. " +
        "Destiny players know how useful this can be. I would " +
        "like to create something like Ishar Commander and Destiny " +
        "Item Manager (DIM). Maybe even add crafting functionality. " +
        "This all depends on what the Anthem Api will allow me to do. " +
        "It would be amazing to have an option to save loadouts and change " +
        "and with the click of a button change your loadout in-game."),
      ),
    );
  }
}
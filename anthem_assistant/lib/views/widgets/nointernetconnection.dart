import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final VoidCallback action;

  NoInternetConnection({@required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[        
        Text(
          'Connect to the internet & refresh',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: FloatingActionButton(
            backgroundColor: ColorConstants.primaryColorRed,
            child: Icon(Icons.refresh, size: 30.0,),
            onPressed: action,
          ),
        ),
      ],
    );
  }
}
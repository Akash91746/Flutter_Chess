import 'package:chess_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:chess_flutter/providers/chess_piece_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ChessTracker(),
      child: MaterialApp(
         theme: ThemeData(
           textTheme: ThemeData.light().textTheme.copyWith(
             headline4: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
          home: HomeScreen(),
      ),
    );
  }
}

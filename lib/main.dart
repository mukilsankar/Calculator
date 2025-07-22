// import 'package:flutter/material.dart';
//  void main(){
//    runApp(Calc());
//  }
//
//  class Calc extends StatelessWidget {
//    const Calc({super.key});
//
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: Firstscreen(),
//      );
//    }
//  }
//
//
//
//  class Firstscreen extends StatefulWidget {
//    const Firstscreen({super.key});
//
//    @override
//    State<Firstscreen> createState() => _FirstscreenState();
//  }
//
//  class _FirstscreenState extends State<Firstscreen> {
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          backgroundColor:Colors.black ,
//          title: Center(child: Text('Calculator',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)),
//        ),
//        backgroundColor: Colors.white,
//        body: Column(
//          children: [
//            Row(
//              children: [
//                Container(
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius:BorderRadius.circular(100),
//                  ),
//                  height: 60,
//                  width: 60,
//                  child: Text("7",style:TextStyle(color: Colors.black) ,),
//                ),
//                Container(
//                  decoration: BoxDecoration(
//                    color: Colors.white ,
//                  ),
//                  child: Text("4",style: TextStyle(color:Colors.black ),),
//                )
//              ],
//            )
//          ],
//        )
//
//      );
//    }
//  }

// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(Calc());
// }
//
// class Calc extends StatelessWidget {
//   const Calc({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: FirstScreen(),
//     );
//   }
// }
//
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});
//
//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Calculator',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: Container(
//         alignment: Alignment.bottomRight,
//         child: Column(
//           children: [
//             Expanded(child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Container(
//                 alignment: Alignment.bottomRight,
//                 child: Text("0",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
//               ),
//             )),
//             Row(
//               children: [
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//               ],
//             ),
//             Row(
//               children: [
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//               ],
//             ),
//             Row(
//               children: [
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//               ],
//             ),
//             Row(
//               children: [
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//               ],
//             ),
//             Row(
//               children: [
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//                 CustomOutlinedButton(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget CustomOutlinedButton() {
//     return Expanded(
//       child: OutlinedButton(
//         onPressed: () {},
//         child: Text(
//           'ac',
//           style: TextStyle(fontSize: 25),
//         ),
//       ),
//     );
//   }
//









import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Cal());
}

class Cal extends StatelessWidget {
  const Cal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = "0";

  void onButtonPressed(String label) {
    setState(() {
      if (label == "AC") {
        input = "0";
      } else if (label == "DEL") {
        input = input.length > 1 ? input.substring(0, input.length - 1) : "0";
      } else if (label == "=") {
        input = input.replaceAll('X', '*');
        try {
          Parser p = Parser();
          Expression exp = p.parse(input);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          input = eval.toString();
        } catch (e) {
          input = "Error";
        }
      } else {
        if (input == "0") {
          input = label;
        } else {
          input += label;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            'Calculator',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  input,
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("AC"),
                  buildElevatedButton("+/-"),
                  buildElevatedButton("%"),
                  buildElevatedButton("/"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("7"),
                  buildElevatedButton("8"),
                  buildElevatedButton("9"),
                  buildElevatedButton("X"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("4"),
                  buildElevatedButton("5"),
                  buildElevatedButton("6"),
                  buildElevatedButton("-"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("1"),
                  buildElevatedButton("2"),
                  buildElevatedButton("3"),
                  buildElevatedButton("+"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("0"),
                  buildElevatedButton("."),
                  buildElevatedButton("DEL"),
                  buildElevatedButton("="),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(String label) {
    return ElevatedButton(
      onPressed: () {
        onButtonPressed(label);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}









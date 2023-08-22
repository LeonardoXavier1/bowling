import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/second_screen.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //=================================================================================================================================================
  //==========================================================       VOIDS           ================================================================
  //=================================================================================================================================================

 void _onEnterButtonPressed() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondScreen()),
  );
}



  //=================================================================================================================================================
  //==========================================================      /VOIDS           ================================================================
  //=================================================================================================================================================








  //=================================================================================================================================================
  //==========================================================       BUILDS          ================================================================
  //=================================================================================================================================================


  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 3, 77),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 3, 77),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: GoogleFonts.pacifico(
                textStyle:const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Lottie.network(
              'https://lottie.host/2621de5d-a28b-40ac-ae5b-cadafe1008a1/KJLocGeHae.json',
              height: 400,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: FloatingActionButton(
                onPressed: _onEnterButtonPressed,
                tooltip: 'Entry',
                backgroundColor: Colors.green,
                child: const Text(
                  'Entry',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  //=================================================================================================================================================
  //==========================================================       /BUILDS         ================================================================
  //=================================================================================================================================================
}

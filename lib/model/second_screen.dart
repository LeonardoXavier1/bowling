import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'line_painter.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  //=================================================================================================================================================
  //==========================================================      VOIDS            ================================================================
  //=================================================================================================================================================

  //=================================================================================================================================================
  //==========================================================      /VOIDS           ================================================================

  //=================================================================================================================================================

  //=================================================================================================================================================
  //==========================================================      /BUILDS          ================================================================
  //=================================================================================================================================================



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 3, 77),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 3, 77),
        title: const Text('Bowling System'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Knocked down pins',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 35,
              height: 24,
              child: Lottie.network(
                'https://lottie.host/36b8b557-d5ce-4cba-a15d-196b0f389984/jsZdqdbDvX.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(11, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                    child: Text(
                      '$index',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int row = 0; row < 3; row++)
                Column(
                  children: List.generate(3, (index) {
                    final number = row * 3 + index + 1;
                    return Container(
                      width: 90,
                      height: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: CustomPaint(
                        painter: LinePainter(),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              '$number',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: CustomPaint(
                  painter: LinePainter(),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        '10',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  //=================================================================================================================================================
  //==========================================================      /BUILDS          ================================================================
  //=================================================================================================================================================
}

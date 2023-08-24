import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
 List<List<int?>> numbers1 = List.generate(3, (index) => [null, null, null]);
  List<List<int?>> numbers2 = List.generate(3, (index) => [null, null, null]);
  List<List<int>> sums = List.generate(3, (index) => [0, 0, 0]);

  int currentRow = 0;
  int currentCol = 0;



  //=================================================================================================================================================
  //==========================================================      VOIDS            ================================================================
  //=================================================================================================================================================
void fillSquare(int number) {
    if (numbers1[currentRow][currentCol] == null) {
      setState(() {
        numbers1[currentRow][currentCol] = number;
      });
    } else if (numbers2[currentRow][currentCol] == null) {
      setState(() {
        numbers2[currentRow][currentCol] = number;
        sums[currentRow][currentCol] = numbers1[currentRow][currentCol]! + numbers2[currentRow][currentCol]!;
      });

      // Move to the next cell
      if (currentCol < 2) {
        currentCol++;
      } else {
        currentCol = 0;
        if (currentRow < 2) {
          currentRow++;
        } else {
          // Check if the last square is filled
          if (currentRow == 2 && currentCol == 2 && numbers1[2][2] != null && numbers2[2][2] != null) {
            setState(() {
              currentRow = 0;
              currentCol = 0;
            });
          }
        }
      }
    }
  }
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
                    onPressed: () {
                      fillSquare(index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      '$index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20), // Espaço entre os botões e os quadrados
          for (int i = 0; i < 3; i++) // Criar 3 linhas de quadrados
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int j = 0; j < 3; j++) // Criar 3 quadrados por linha
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                            child: Text(
                              numbers1[i][j] != null ? '${numbers1[i][j]}' : '',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0, right: 8.0),
                              child: Text(
                                numbers2[i][j] != null ? '${numbers2[i][j]}' : '',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Score: ${sums[i][j]}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }



  //=================================================================================================================================================
  //==========================================================      /BUILDS          ================================================================
  //=================================================================================================================================================
}

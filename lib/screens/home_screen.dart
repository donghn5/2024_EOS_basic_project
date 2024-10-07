import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
        title: const Text('EOS ToDoList'),
        leading: Image.asset('assets/images/eos_logo.png'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 10,
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/eos_logo.png'),
                  ),
                ),
                const SizedBox(width: 35),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '이동현',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('큐티가이'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color(0xFFA4C639).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
              ),
              Positioned(
                top: 20,
                left: MediaQuery.of(context).size.width / 2 - 75,
                child: Container(
                  width: 150,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color(0xFFA4C639).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                    "To do list",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


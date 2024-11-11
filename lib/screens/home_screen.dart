import 'package:flutter/material.dart';
import '../widgets/add_button.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> toDoLists = [];

  @override
  void initState() {
    super.initState();
    toDoLists.add("11111");
    toDoLists.add("22222");
    toDoLists.add("33333");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
        title: const Text('EOS ToDoList'),
        centerTitle: false,
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
                      SizedBox(height: 15),
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFA4C639).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
                    child: const Text(
                      "To do list",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 40, right: 25),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 400,
                  child: ListView.builder(
                    itemCount: toDoLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoItem(
                        title: toDoLists[index],
                        onDelete: () {
                          setState(() {
                            toDoLists.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 50,
                child: AddButton(
                  onPressed: () {
                    setState(() {
                      toDoLists.add("+++++++++");
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

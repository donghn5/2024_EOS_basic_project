import 'package:flutter/material.dart';
import '../widgets/add_button.dart';
import '../widgets/todo_item.dart';
import '../screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> toDoLists = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toDoLists.add("11111");
    toDoLists.add("22222");
    toDoLists.add("33333");
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
        title: const Text('EOS ToDoList'),
        leading: Image.asset('assets/images/eos_logo.png'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          }, icon: Icon(Icons.settings_rounded))
        ],
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
                  child: ClipRRect(  // 수정: ClipRRectRect → ClipRRect
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      'assets/images/dh.png',
                      fit: BoxFit.cover,
                    ),
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
                  onPressed: _showToDoDialog,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showToDoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('할 일 추가'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: '할 일을 입력하세요',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    toDoLists.add(_textController.text);
                    _textController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                '추가',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}

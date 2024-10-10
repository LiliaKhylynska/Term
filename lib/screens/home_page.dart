import 'package:flutter/material.dart';
import 'package:term/models/chat.dart';
import 'package:term/models/message.dart';
import 'package:term/models/student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students = [
    Student(
        id: 0,
        firstName: "Jonh",
        lastName: "Tebry",
        grade: 5,
        price: 70,
        image: "assets/images/0.jpg"),
    Student(
        id: 1,
        firstName: "Zinya",
        lastName: "Missaga",
        grade: 7,
        price: 67,
        image: "assets/images/1.jpg"),
    Student(
        id: 2,
        firstName: "Anna",
        lastName: "Vitta",
        grade: 2,
        price: 78,
        image: "assets/images/2.jpg"),
  ];

  List<Chat> chats = [
    Chat(studentId: 0, messages: [
      Message(text: "Some text", time: DateTime(2024, 3, 4, 11, 4, 6)),
      Message(text: "Some long text", time: DateTime(2024, 3, 4, 11, 4, 45)),
    ]),
    Chat(studentId: 1, messages: [
      Message(text: "Some text", time: DateTime(2024, 2, 7, 11, 4, 6)),
      Message(text: "Some long text", time: DateTime(2024, 3, 6, 11, 24, 6)),
    ]),
    Chat(studentId: 2, messages: [
      Message(text: "Some text", time: DateTime(2024, 2, 6, 11, 4, 26)),
      Message(text: "Some long text", time: DateTime(2024, 3, 7, 6, 24, 36)),
    ])
  ];

  String dateFormat(DateTime time) {
    return "${time.hour}:${time.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 233, 236),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Color.fromARGB(255, 17, 112, 130),
            fontWeight: FontWeight.bold,
            fontFamily: "Blogger-Sans",
          ),
        ),
      ),
      body: Column(
        children: [
          
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: const EdgeInsets.only(
                  bottom: 0, left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                // border: Border.all(width: 3.0, color: Color.fromARGB(255, 94, 194, 164)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
                color: Color.fromARGB(255, 239, 238, 242),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 179, 207, 213),
                      blurRadius: 0.0,
                      offset: Offset(2, 2))
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(7.0),
                      topLeft: Radius.circular(7.0),
                    ),
                    child: Image.asset(
                      students[chats[index].studentId].image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${students[chats[index].studentId].firstName} ${students[chats[index].studentId].lastName}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 108, 74, 60),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Blogger-Sans"),
                        ),
                        Text(
                          chats[index].messages.last.text,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 108, 74, 60),
                              fontFamily: "Blogger-Sans"),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      dateFormat(chats[index].messages.last.time),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 108, 74, 60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

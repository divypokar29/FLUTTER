import 'package:flutter/material.dart';
import 'package:secondproject/TASK_KBC/Costom_widgets/Right_Qation_widget.dart';
import 'package:secondproject/TASK_KBC/Costom_widgets/Wrong_Anser.dart';

class QationsScreen extends StatefulWidget {
  const QationsScreen({super.key});

  @override
  State<QationsScreen> createState() => _QationsScreenState();
}

class _QationsScreenState extends State<QationsScreen> {
  String? mcq;

  int currentQation = 0;

  List<Map<String, dynamic>> qationsList = [
    {
      "qation": "What is the capital of India ?",
      "options": ["Mumbai", "Delhi", "Kolkata", "Chennai"],
      "correctAnswer": "Delhi",
    },

    {
      "qation": "Who is known as the Father of the Nation in India ?",
      "options": [
        "Bhagat Singh",
        "Mahatma Gandhi",
        "Subhash Chandra Bose",
        "Jawaharlal Nehru",
      ],
      "correctAnswer": "Mahatma Gandhi",
    },

    {
      "qation": "Which planet is called the Red Planet ?",
      "options": ["Earth", "Mars", "Jupiter", "Venus"],
      "correctAnswer": "Mars",
    },

    {
      "qation": "How many days are there in a leap year ?",
      "options": ["365", "366", "364", "360"],
      "correctAnswer": "366",
    },

    {
      "qation": "Which is the national animal of India ?",
      "options": ["Lion", "Tiger", "Elephant", "Peacock"],
      "correctAnswer": "Tiger",
    },

    {
      "qation": "Who invented the telephone ?",
      "options": [
        "Albert Einstein",
        "Alexander Graham Bell",
        "Isaac Newton",
        "Thomas Edison",
      ],
      "correctAnswer": "Alexander Graham Bell",
    },

    {
      "qation": "Which ocean is the largest in the world ?",
      "options": [
        "Indian Ocean",
        "Atlantic Ocean",
        "Pacific Ocean",
        "Arctic Ocean",
      ],
      "correctAnswer": "Pacific Ocean",
    },

    {
      "qation": "Which country is famous for the Eiffel Tower ?",
      "options": ["Italy", "France", "Germany", "Japan"],
      "correctAnswer": "France",
    },

    {
      "qation": "What is the national bird of India ?",
      "options": ["Parrot", "Peacock", "Crow", "Sparrow"],
      "correctAnswer": "Peacock",
    },

    {
      "qation": "How many continents are there in the world ?",
      "options": ["5", "6", "7", "8"],
      "correctAnswer": "7",
    },
  ];

  // ================= QUESTION FUNCTION =================

  Widget showQation() {
    return Text(
      qationsList[currentQation]["qation"],

      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

      textAlign: TextAlign.center,
    );
  }

  // ================= OPTIONS FUNCTION =================

  Widget showOptions() {
    List options = qationsList[currentQation]["options"];

    return Column(
      children: List.generate(options.length, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),

          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 196, 236, 255),
            borderRadius: BorderRadius.circular(15),
          ),

          child: RadioListTile(
            title: Text(options[index], style: TextStyle(fontSize: 18)),

            value: options[index],

            groupValue: mcq,

            onChanged: (value) {
              setState(() {
                mcq = value.toString();
              });
            },
          ),
        );
      }),
    );
  }

  // ================= BUTTON FUNCTION =================

  Widget nextButton() {
    return SizedBox(
      height: 60,
      width: 150,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 6, 176, 192)),

        onPressed: () {
          if (mcq == null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Please Select Option")));

            return;
          }

          // ================= CHECK ANSWER =================

          if (mcq == qationsList[currentQation]["correctAnswer"]) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Winscreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WrongAnser()),
            );
          }

          // ================= NEXT QUESTION =================

          setState(() {
            if (currentQation < qationsList.length - 1) {
              currentQation++;

              mcq = null;
            }
          });
        },

        child: Text(
          "Next",

          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 176, 192),

        title: Center(
          child: Text(
            "K B C",

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Question ${currentQation + 1}",

              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,),
            ),

            SizedBox(height: 30),

            // QUESTION
            showQation(),

            SizedBox(height: 30),

            // OPTIONS
            showOptions(),

            SizedBox(height: 30),

            // BUTTON
            nextButton(),
          ],
        ),
      ),
    );
  }
}

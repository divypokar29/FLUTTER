import 'package:flutter/material.dart';

class LoginScreen2State extends StatefulWidget {
  const LoginScreen2State({super.key});

  @override
  State<LoginScreen2State> createState() => LoginScreen2StateState();
}

class LoginScreen2StateState extends State<LoginScreen2State> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 38, 49),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset("assest/image.png", height: 180),
                // Text(
                //   "Your logo.",
                //   style: TextStyle(color: Colors.white, fontSize: 20),
                // ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 65, 68, 88),
                        Color(0xFF1F2230),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 20,
                        // offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          hintStyle: TextStyle(color: Colors.white),
                          label: Text(
                            "Email",
                            style: TextStyle(color: Colors.blueGrey[200]),
                          ),
                          suffixIcon: Icon(
                            Icons.email,
                            color: const Color.fromARGB(255, 145, 131, 131),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          label: Text(
                            "Password",
                            style: TextStyle(color: Colors.blueGrey[200]),
                          ),
                          hintText: "Enter Password",
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: const Color.fromARGB(255, 145, 131, 131),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Forgot Password"),
                                    content: Text("Are u sure !!."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 25,
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.pink,
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.grey,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.facebook, color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[500],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.mail, color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[500],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.shop_two_outlined, color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[500],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

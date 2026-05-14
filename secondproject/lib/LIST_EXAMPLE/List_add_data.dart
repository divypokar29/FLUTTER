import 'package:flutter/material.dart';

class ListAddData extends StatefulWidget {
  const ListAddData({super.key});

  @override
  State<ListAddData> createState() => _ListAddDataState();
}

class _ListAddDataState extends State<ListAddData> {
  List<String> SubjectList = [];

  TextEditingController _SubjectController = TextEditingController();

  int edit_index = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("LIST OF SUBJECT", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.amber[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _SubjectController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber[300],
                        hintText: "Enter Subject",
                        label: Text("Subject"),
                      ),
                    ),
                    edit_index >= 0
                        ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              SubjectList[edit_index] =
                                  _SubjectController.text.toString();
                              _SubjectController.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Updeted !!")),
                              );
                              edit_index = -1;
                            });
                          },
                          child: Text("Update"),
                        )
                        : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              SubjectList.add(
                                _SubjectController.text.toString(),
                              );
                              _SubjectController.clear();
                            });
                          },
                          child: Text("Save"),
                        ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:
                SubjectList.length > 0
                    ? ListView.builder(
                      itemCount: SubjectList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.amber[200],
                            child: ListTile(
                              title: Text(
                                "${SubjectList[index]}",
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        edit_index = index;
                                        _SubjectController.text =
                                            SubjectList[index];
                                      });
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        SubjectList.removeAt(index);
                                      });

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text("Deleted !")),
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    : Center(
                      child: Text(
                        "No records found !",
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}

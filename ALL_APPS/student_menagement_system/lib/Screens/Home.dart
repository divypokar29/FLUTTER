import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:student_menagement_system/Models/StudentMenaModel.dart';
import 'package:student_menagement_system/Screens/Detailes.dart';
import 'package:student_menagement_system/Services/API_service.dart';
import 'package:student_menagement_system/Widgets/student_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Students",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: FutureBuilder<List<Studentmodel>>(
        future: apiService.fechStudent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Studentmodel> student = snapshot.data!;
            return ListView.builder(
              itemCount: student.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () async {
                      var result = await Get.to(
                        () => DetailesScreen(
                          id: student[index].id,
                          Student: student[index],
                          name: student[index].name,
                          email: student[index].email,
                          phone: student[index].phone,
                          age: student[index].age,
                          createdAt: student[index].createdAt,
                          gender: student[index].gender,
                          cource: student[index].cource,
                          semester: student[index].semester,
                          city: student[index].city,
                          isActive: student[index].isActive,
                          profileImage: student[index].profileImage,
                        ),
                      );
                      if (result == "deleted") {
                        setState(() {});
                        Get.snackbar(
                          "Success",
                          "Student deleted successfully",
                          snackPosition: SnackPosition.BOTTOM,

                          colorText: Colors.white,
                        );
                      }
                    },
                    child: StudentCard(
                      name: student[index].name,
                      cource: student[index].cource,
                      semester: student[index].semester,
                      city: student[index].city,
                      isActive: student[index].isActive,
                      profileImage: student[index].profileImage,
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

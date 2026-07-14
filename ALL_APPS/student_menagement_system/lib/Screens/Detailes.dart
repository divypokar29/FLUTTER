import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_menagement_system/Screens/Update_student.dart';
import 'package:student_menagement_system/Services/API_service.dart';

class DetailesScreen extends StatefulWidget {
  final Student;
  final String? id;
  final String? name;
  final String? email;
  final String? cource;
  final int? semester;
  final String? city;
  final String? gender;
  final int? age;
  final String? phone;
  final bool? isActive;
  final String? createdAt;
  final String? profileImage;

  DetailesScreen({
    super.key,
    required this.id,
    required this.Student,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.cource,
    required this.createdAt,
    required this.phone,
    required this.semester,
    required this.city,
    required this.isActive,
    required this.profileImage,
  });

  @override
  State<DetailesScreen> createState() => _DetailesScreenState();
}

class _DetailesScreenState extends State<DetailesScreen> {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    final hintColor = Theme.of(context).hintColor;
    DateTime joinDate = DateTime.parse(widget.createdAt!);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Students Detailes",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child:
                              (widget.profileImage != null &&
                                  widget.profileImage!.isNotEmpty &&
                                  widget.profileImage != "null")
                              ? Image.network(
                                  widget.profileImage!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.grey[300],
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey[600],
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.name}"),
                          SizedBox(height: 10),
                          Text(
                            "${widget.cource} • Sem ${widget.semester}",
                            style: TextStyle(color: hintColor, fontSize: 13),
                          ),
                          SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: widget.isActive == true
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.isActive == true ? "Active" : "Inactive",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: widget.isActive == true
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.email_outlined),
                          SizedBox(width: 25),
                          Text("Emial"),
                          Spacer(),
                          Text("${widget.email}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.phone),
                          SizedBox(width: 25),
                          Text("Phone"),
                          Spacer(),
                          Text("${widget.phone}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.school_outlined),
                          SizedBox(width: 25),
                          Text("Cource"),
                          Spacer(),
                          Text("${widget.cource}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.calendar_today_outlined),
                          SizedBox(width: 25),
                          Text("Sem"),
                          Spacer(),
                          Text("${widget.semester}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.male_outlined),
                          SizedBox(width: 25),
                          Text("Gender"),
                          Spacer(),
                          Text("${widget.gender}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 25),
                          Text("City"),
                          Spacer(),
                          Text("${widget.city}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.calendar_month_outlined),
                          SizedBox(width: 25),
                          Text("Age"),
                          Spacer(),
                          Text("${widget.age}"),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: hintColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.watch_later_outlined),
                          SizedBox(width: 25),
                          Text("Joined on "),
                          Spacer(),
                          Text(
                            "${joinDate.day}/${joinDate.month}/${joinDate.year}",
                          ),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 170,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Get.to(UpdateStudent(student: widget.Student));
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Color(0xff10b981),
                    ),
                    label: const Text(
                      "Edit Student",
                      style: TextStyle(
                        color: Color(0xff10b981),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xff10b981),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      apiService.deleteStudent(widget.id!);
                      Get.back(result: "deleted");
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    label: const Text(
                      "Delete Student",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

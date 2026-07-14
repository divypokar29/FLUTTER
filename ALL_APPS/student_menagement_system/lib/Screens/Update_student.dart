import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:student_menagement_system/Models/StudentMenaModel.dart';
import 'package:student_menagement_system/Screens/Bottom_Navigation.dart';
import 'package:student_menagement_system/Screens/Home.dart';
import 'package:student_menagement_system/Services/API_service.dart';

class UpdateStudent extends StatefulWidget {
  final Studentmodel? student;

  const UpdateStudent({super.key, this.student});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String gender = "Male";
  final ApiService apiService = ApiService();
  String joinedOn = "Not Available";
  @override
  void initState() {
    super.initState();

    if (widget.student != null) {
      nameController.text = widget.student!.name ?? "";
      emailController.text = widget.student!.email ?? "";
      phoneController.text = widget.student!.phone ?? "";
      courseController.text = widget.student!.cource ?? "";
      semesterController.text = widget.student!.semester?.toString() ?? "";
      cityController.text = widget.student!.city ?? "";
      ageController.text = widget.student!.age?.toString() ?? "";
      gender = widget.student!.gender ?? "Male";
      if (widget.student!.createdAt != null) {
        joinedOn = DateFormat(
          "dd MMM yyyy",
        ).format(DateTime.parse(widget.student!.createdAt!));
      }
    }
  }

  void saveStudent() async {
    Studentmodel newStudent = Studentmodel(
      id: widget.student?.id,
      name: nameController.text,
      createdAt: widget.student?.createdAt,
      email: emailController.text,
      phone: phoneController.text,
      cource: courseController.text,
      semester: int.tryParse(semesterController.text),
      gender: gender,
      city: cityController.text,
      age: int.tryParse(ageController.text),
      profileImage: widget.student?.profileImage,
      isActive: widget.student?.isActive ?? true,
    );

    if (widget.student == null) {
      await apiService.addStudent(newStudent);
      Get.back();
    } else {
      await apiService.updateStudent(widget.student!.id!, newStudent);
      Get.to(BottomNavigationScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      widget.student == null ? "Add Student" : "Edit Student",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Add Photo",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),

                  buildTextField(
                    nameController,
                    Icons.person_outline,
                    "Enter full name",
                  ),
                  const SizedBox(height: 14),

                  buildTextField(
                    emailController,
                    Icons.email_outlined,
                    "Enter email",
                  ),
                  const SizedBox(height: 14),

                  buildTextField(
                    phoneController,
                    Icons.phone_outlined,
                    "Enter phone number",
                  ),
                  const SizedBox(height: 14),

                  buildTextField(
                    courseController,
                    Icons.school_outlined,
                    "Enter course",
                  ),
                  const SizedBox(height: 14),

                  buildTextField(
                    semesterController,
                    Icons.calendar_today_outlined,
                    "Enter semester",
                    isNumber: true,
                  ),
                  const SizedBox(height: 18),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gender",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      buildGenderOption("Male"),
                      buildGenderOption("Female"),
                      buildGenderOption("Other"),
                    ],
                  ),
                  const SizedBox(height: 14),

                  buildTextField(
                    cityController,
                    Icons.location_on_outlined,
                    "Enter city",
                  ),
                  const SizedBox(height: 14),

                  buildTextField(
                    ageController,
                    Icons.calendar_month_outlined,
                    "Enter age",
                    isNumber: true,
                  ),
                  const SizedBox(height: 14),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.event_available),
                      title: const Text("Joined On"),
                      subtitle: Text(
                        widget.student == null
                            ? "Will be generated automatically"
                            : joinedOn,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: saveStudent,
                      child: Text(
                        widget.student == null
                            ? "Add Student"
                            : "Update Student",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    IconData icon,
    String hint, {
    bool isNumber = false,
  }) {
    return Card(
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey, size: 20),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget buildGenderOption(String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: gender,
          onChanged: (val) {
            setState(() {
              gender = val!;
            });
          },
        ),
        Text(value),
        const SizedBox(width: 10),
      ],
    );
  }
}

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
  String femaleImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFOWl5f8sFImbwQEAcTwsWxVvQ2NjzkQgRIJiRFAyvnw&s=10";

  String maleImage =
      "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAnQMBIgACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABgcEBQEDCAL/xAA7EAABAwMCAwYFAgQEBwAAAAABAAIDBAUREiEGMVEHEyJBYXEUMoGRobHBFSNC0TNSYuEWY3KCotLw/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAECAwQF/8QAIhEAAwADAAMAAgMBAAAAAAAAAAECAxEhEjFBBDJRYXFC/9oADAMBAAIRAxEAPwC8UREAREQBcZXJ5KlO1HiWrdxYyloquaGKgbpxE8tDpDguJxzxsPTBQF0ue1jS5zg1oGSTyAVd3LtQhhrDFRUfewh2kSPfpLupAHkohH2jXWW1zWqdzZzO3T37j42t8xtzyPP9VDLgyppJ+9w6SBxyHt8vcIWSLbZ2kVba90ktLEaF2NDATqb6l3+y39Jx/aajAMdSx3/S1w/BVGQ3YsjyDqHQHkttY6qOqiDp2jD3kbbEdCPVV6W0i4/+OrO2o7mX4iLo98fh/BW2lv1qhp4aiWvgbFO/RG4v+Z2Cce+AVSVdIIpY4q6QkD/CmBxrHRd9RTCopGwtkeNLtcercA436KvkyfBF6xSxzRtkika9jtw5pyCvtVTwhxNUWuVtFXb6vlGraQf6T1Vm0VZBWwNlp3hzD+D0Ksq2UqWjJREVioREQBERAEREAREQHXUyiCnlmd8sbC4/QZXlqerdcbnU1U5JdK4yH3cSV6fuRhNFPHPKyNkkbmFz3ADcFeTZZfhKp4y12h2nIOxweaklHayU0lyY5+7TtnqFI4qkNZpOHNPry9uii9W9lRESwjPljyK+KW6GMaJCQW8iCqsujd19FBOHOiHixk6fC8fsViWqu+EDqZ7t2uy3PP8A+5rr+NbI3B3xv4R+39lhVbmynXq8Y+V/n9eqrstok10rm1dBg+LQ9srT57HdbO2XVskAxpcB8zD+vooPSVh06ZDhfJmdTvDoXu0A7YO7f7hRtE6ZZQFJcw6COV8MriHNieceIebXeR+63Nmu1VbKsOgnImBHeU9QcCUdA4bZ6Z+6qlt2kLQXOw9vJw/VZNy4llqXQuaSJmg6nA8+XkqP+iT09arjDc6RlRATvs5jtix3mCOoWaqO7L+Ibt/HqWmdBUSU1Vhr36CWjAO5PljCvAclpFbXTGp0zlERXKhERAEREAREQEN7UuHp+IOGy2jc0VNJJ8Qxr3YbJhrgWk+WxP1AXmirY8SPDmOYQcOjfzaV634j1iwXExlocKaQguO2zSd/ReaCz4m9xNlLX6pAThuAd1P/ADsmVutGNaeE66ra18jnRh39I5j3Ujpuzxrx/Me9x6kqY2yJoa3byW7haAFwvJTPSWKJ+EFg7MqZ5GqeRg/0Fbyh7ObLCzE0T6hx/qmfn8KVxrJYVXb/AJJ0v4Iu/gKyygB9KABsANkHZ7Ymtw2iZ7ncqXM3OBzXYGnommNkGPZbY5X6iKhg/wArJCAotxdwA3hzTcaEuqKNzw1zJfmiJ5ZPmPLPNXI1azi+IVPCt1iLS4/DPc0erRqH5CtNNGd9K34Ru1ZRXOn1TxsjDgTFFDq8Pur7C81cN1lFFeqVrmOly9uI3E6ic+Wea9KhdGP6cmX4coiLUyCIiAIiIAiIgMevp2VdFUU0ozHNE6NwHmCMFeZKKlLeKYadjnSvic7vXEbAgb7+ZyQvURXn6108NLeeJK2pAhbT1RpYw7bG5c79Wo/1aLY/3RJqGWKCAvnlZGxgy5zzgALGk474egcWtqZpiPOKF2PucZUJuLau/wBUY4XSPpoz4WxnSz3c4+f6LXOoaOAuDhSSubz0zl+Pc6cflcyxL6dtZXvhatl4ys92rmUdK+dsz86RJFgHAyd1JWPCp3hupt1uuEc3cMgm/pfjr0OcKyo7zQsAEtbTsd0dKAVnU6fEXmtrrO3iwXCew1MVokLKx2nQWyaDs4E+Ly2yq5Y/j2kOY5K4AHl8dG8fYuKm934hpKdjIoHfFTyDLIoCHEjqT5BReorLgQJq2po7fG8+ATPLnH2A5onS4GpfTKtXaHd7VOyHimjeYCcGfRpc37eF3srJElNdKAmCRslPURkB7TkFpCrClkq6lxhoq+2XCTTk0x1Rvc30a4YK3/CV8tdC021wfb5O9OKebZrXO8m9ATv03KmpbKppfSFcLW6GPjGmt1ewmWlrWs0vJ+ZjtiD9AceYXo1vJVBXUYZ2xWp7QdNTEyV7QNi5uoZ9/CFb4Oy3xdWzkzcejlERamQREQBERAEREBp+Jr7DYLeamZhkc46WRg4LjjKoriWqnv7624NDYoRW5dGByPdtyc/XzVkdqsju/o4z8nducPfIUJtFO2W110UvySz+I+hYB+yyeRqtHVGFOEzstVFHUU7aPdkJADg3bLfMfVRrtArnUl2/hdLGKaip42aWMAAeSAcnrzx9CpzYIG1FECHBlRH/AC5G9HD9jzXbdeGKa7SCW4UsUsgGNYcWnH0Wc5PA1vD5+mVlZH/EwysEZEcYaQSdQyc58tgeeFLeFrPBV2+eaWLU8SFoPoF33a10fD9nkZTQiMPflo1Fznu8hkqR8D0Ags0UZyXbudnqdyq1W0WiNa38I/wbQRmkq5sDX8TIw9cDGAojx3LPR8STxShw0MYGuPLBaHbem+P+0nmrGtsTbLxNV22caKeuf39M8nbX5tWzu/DNFd5mSXCjgmcwaQXg8vXqoVeNeTFQ6jxXCP8AANfBxTb66lq6CKFtFHE6nljcS5j8EEhx33Lc49SueKbf/Erja2xDTO6Rwc8DfQBk/nHtlSm22aK1wuioYIKeJ5y8RMxq91jWlkVdd6mvYQ6mp2GmgcOT35/mEegIa33BSsm35IicfivF9MGkgltXE1PVT1VTUPZSukZCXZAcTp+uxKsGzXX48ObJGY5GjOD5hRGrgdLeviWuGGU4i26lxJ/Zbnh9xNyb1LDqVMd15JE5sUvG3rpKVyuFyu884IiIAiIgCIiAiHaTa5K20Nq4G6pKRxc4DmWEeL7bH7qr6CdohrImYzpa7nzwSP3V/FoOQeSgXGnCdpobXX3mgpe5qIma3tjeQwsyNZ08thk7dFjcbe0dOHN4rxZXTDUvl76jlfBNjGuM4yPXqs0z8RRx5feGtjPMmJn9lqKGr0T6dXn5L7v8dTXz0dNBUGLWJHZ9QBj9VzpvejtpTrZnVFOIo/j7rUyVUowGvkOzc9B5KXWG9UMVIyOJzcNG+SqilbeHMfST1MvhPijly4H1zv8AdY0dHdmO/lzxNz/zgP1IVqxv3sqss+tF08Qi23mnbGXsExPhGRuo24XmikEDL3PC3k1khB+2QSopaYrnSSd+2pp++A2kJ71zfYAFZmm+XuaZkldM+KAZkkkj0MBxkADbJ+myqppfSXcPmiWU9Dcasj+KXeqqIXDeNr9APodOD+VI4nx0tOyGJrY442hrWMGA0dAopYK2Q2qnfK/LnRgk+q+7nfIqKnknlPhaNgObj5AepWNVT4aqZS2SKC4M7ydvh2cBknfkpPwxSObE+skbgy7MB56VruF+D6SnoaaquTJJa6VglqGPk1MbI7dwA5YBJClwAAwF1YcDl7o4M/5CteMnKIi6jkCIiAIiIAiIgC654mTRPilaHMe0tc0+YPMLsXCA8xcVWqo4I4kfa6nW6icNdFUOHzR9D6jl9uqzTXtNRaKhrwWicsJ9HNIV78WcMW3iq1Pt90i1NO8Urdnwvxs5p6/qvNHFXDV04Mugobie8hJ1U9Sw+GQdcf0n0WVYk3tHRjztLxZPaqNrHh7mamY5jmPYrY2yribGwNmppG5yTLTgu59QR+ih9v4wjNM2Oup3POMF8ZG/0OFHq/Q6vllt0ssMEh1BhOCCefL1WUxa5s6bvG+62XJLcaaWUMEzdRb/AIMTWtHvyz+ViXub4WyVkuGsxE7SAMDJ/wB1XnDd4prGJpZKZ1TVSHeR0uMN6cj55XVxLxlPc4DAGshhyCY2b59yocW676CuJnnDIg4niobTHA5kjpo8jYDGM88rfdmXDlZxneI73d2OZZ6GUPgj8qiUH8hpG/26qN8H8H097DblxJeaS02kO2Es7Gyze2T4R6n7K/bNf+Eqemgt1ovNoEULQyKGGqj2A9AVvOKZe9HLkz1S8fhJEXyyRsjQ5jmuaeRacgr6WhgEREAREQBERAEREBwTsolxVxtDZKSSampjVOYcHxaWj3W24ku0FtoJBK/TJIxwYM8tsZXny63mspKp7ZH5yeYOQ4LbHjTW2ZXTT0ibw9pl6rqCeseKOmhJLImRMcXbc3Ek/Tkqo4iu89yqXvqZpJdRyS92Vkz1jZYO7haIxz0D5fp0WhqtwSeYWtJJcKztvpsbdZ6urstRcoJWtjhnEOhwOXeHOc+m33WG5tYMjw/dT6lhbQcHUNCwfzJB30u25e7c59hgfRYdFZHVLsubsfJefeTT4ejjwtrpFaG3VtdMGd4QDzIXHE9rFnubKVj3vzEx+p55k5/srUtVkjpw3Dd+q03aTaYZfga0uDZmO7sjHzt5j7fussWZ1kSZpmwKcba9kVseuBm7jg+SxrtaRJcInW6Jre8xrYPlYevoFm07cHY6W9V3GsZE3Ee2fPqvS8Tzkywezu8y2ispaMzudDI5sToydt9sge6ucLzFaqlzKiKpleYxG4Ob5HI5K/OCL+L/AGjvS4Omhf3ch67ZBWVosiRIiKhIREQBERAERdNVURUkD553hkbBlxKAq3tstl3qqm2TW1zW07g6Od7nYEePECfpn7KlblT11I8skkZOwebCrE7QeMJLtVuZE4thZsxoPIKAyTF7iXHOV0qWp6Yuu8NVHU6XeY9Csl2HaZ49y0jUEqKZknIYKx6Zz4Je7fktPMKP9Lf4TK3X+ikiYyuEkZZtlrdY/G/4UioOJOH4W5fVvGOlNL/6qtA3S8jO3Nd7B6D7LJ/ixRvP5eSSz38b2aFhNOypnPkO60D/AMsH8KHX/iKa+1IkkibDBFsyMOLvfJ6rSvIYwlYc8kjdLGscS4Zw3dTODHje0Vr8jJk4zMlqifC1Y3xfj0wt72T08l8Q0M8/+K7Q0/0hbOGmjphhgAPVa9Zk3oUlsrK7He1bICeQ0l33V0dhdrr7fY7i+44Blq8R4dkODWgZHvlVBDNoI32Vgdn/ABV/CqsRTvJpZcCRv+Xo4eyrc84TNF2IviORsjGvjIc1wyCORC+1gXCIiAIiIAqz7Y7nVU9NBSwyaYnt1OA8zlEV8f7FL9FE1Mr3OcSd10tcSURdD9maO9q66hoBa/HizzREfosdmkFwXexgwiKSDpq/lA6rJgaDvgZwiKPpKMpoA8l0zHDiiKzIZ16iFl0cz2SDS7C4RVBe/ZXX1FZZHxVD9bYHhseeYBHJTZEXNXs1XoIiKpJ//9k=";
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
      createdAt: widget.student?.createdAt ?? DateTime.now().toIso8601String(),
      email: emailController.text,
      phone: phoneController.text,
      cource: courseController.text,
      semester: int.tryParse(semesterController.text),
      gender: gender,
      city: cityController.text,
      age: int.tryParse(ageController.text),
      profileImage:
          widget.student?.profileImage ??
          (gender == "Female" ? femaleImage : maleImage),
      isActive: widget.student?.isActive ?? true,
    );

    if (widget.student == null) {
      await apiService.addStudent(newStudent);
      Get.to(BottomNavigationScreen());
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

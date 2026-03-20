/*
3) else if condition 

when there is multiple condition  in program its called else if condition

syntax:
 
 if(condition){
 statemant
 }
 else if(condition){
 statemant
 }
 else{
 statemant
 }

*/

import 'dart:io';

void main() {
  int? marks;

  print("Enter your marks : ");
  marks = int.parse(stdin.readLineSync()!);

  if (marks >= 70) {
    print("grade = A");
  } else if (marks >= 60 && marks < 70) {
    print("grade = B");
  } else if (marks >= 50 && marks < 60) {
    print("grade = C");
  } else if (marks >= 40 && marks < 50) {
    print("grade = A");
  } else {
    print("grade = fail!");
  }
}

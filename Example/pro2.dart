// accept numberic value from user
import 'dart:io';

void main(){
    int  num; // variable declaration

    print ("Enter number : ");
    num = int.parse(stdin.readLineSync()!);

    print ("number = ${num}");
    
}
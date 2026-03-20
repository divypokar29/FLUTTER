// dynamic vaariable
//accept value at run time 

import "dart:io";

//io : input output 


void main(){
    //datatype varname;

String name; //variable declaration

print("Enter your name : ");
name = stdin.readLineSync()!;

print("Hi , ${name}");
}
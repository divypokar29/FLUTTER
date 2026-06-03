import 'dart:io';

void main(){
  int GivenNumber;
int Fac = 1 ;
int i;
print("Enter The Number For Factorial");
GivenNumber = int.parse(stdin.readLineSync()!);
for (i=2;i<=GivenNumber;i++){
  Fac = Fac * i;
  print("Factorial = $Fac  ");
} 


}

import 'dart:io';

void main() {
 int tab;
  int GivenNumber;
int i;
  print("Enter number for Table : ");
  GivenNumber = int.parse(stdin.readLineSync()!);
for(i=1;i<=10;i++){
  tab = GivenNumber * i;
  print("$GivenNumber $i $tab");
}
  
}

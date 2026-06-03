import 'dart:io';

void main() {
  List<int> Marks = [];
 int Total = 0 ;

 double persantage ; 
  print("Enter Five subject marks !! ");
  for (int i = 0; i < 5; i++) {
    Marks.add(int.parse(stdin.readLineSync()!));
  }

  for(int j =0 ; j<Marks.length;j++){
     Total = Total + Marks[j];
  }

persantage = (Total / 500) * 100;


  print("$Total This is a total of Marks");
  print("$persantage This is a total of parcentage");

  if(persantage>90){
    print("A grade ");

  }else if (persantage>80){
    print("B grade ");
  }else if (persantage>70){
    print("C grade ");
  }
  else if (persantage>60){
    print("D grade ");
  }
  else if (persantage>=50){
    print("E grade ");
  }
  else if (persantage>33){
    print(" Faile ");
  }else{
    print("enter valid marks");
  }
}

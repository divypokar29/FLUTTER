import 'dart:io';

void main(){
 int day = 1;

 print("Enter a day!!");
 day=int.parse(stdin.readLineSync()!);
    switch(day){
        case 1: print("Monday");
        break;
        case 2: print("Tuseday");
        break;
        case 3: print("Wednesday");
        break;
        case 4: print("Thursday");
        break;
        case 5: print("Friday");
        break;
        case 6: print("Saturday");
        break;
        case 7: print("Sunday");
        break;
        default: print("Invalid day");
        break;
    }
  }

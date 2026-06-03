import 'dart:io';

void main() {
  int A = 500;
  int B = 400;
  int C = 450;

  int max =  (A>B) ? A :B;
   
   max = (max<C) ? C : max;

   print("$max");
}

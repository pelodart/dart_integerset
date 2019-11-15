import '../lib/IntegerSet.dart';

void main() {
  testingCtors();
  testingMethods();
  testingInsert();
  testingRemove();
  testingClone();
  testingOperators();
}

void testingCtors() {
  print("Testing c'tors: ");

  IntegerSet s1 = new IntegerSet();
  print("s1: ${s1}");

  List<int> elems1 = [-2, -1, 0, 1, 2, -1, -2];
  IntegerSet s2 = new IntegerSet.fromList(elems1);
  print("s2: ${s2}");

  List<int> elems2 = [-1, 1, 2, 3, 1, 2, 3, 1, 2, 3, -1];
  IntegerSet s3 = new IntegerSet.fromList(elems2);
  print("s3: ${s3}");

  print("s1.IsEmpty: ${s1.isEmpty}");
  print("s2.IsEmpty: ${s2.isEmpty}");
  print("s3.IsEmpty: ${s3.isEmpty}");
}

void testingMethods() {
  print("Testing methods: ");

  IntegerSet s = new IntegerSet();
  print("s: ${s}");

  // testing 'insert'
  s.insert(1);
  s.insert(2);
  s.insert(3);
  s.insert(4);
  s.insert(5);
  s.insert(6);
  print("s: ${s}");

  // testing 'remove'
  s.remove(3);
  s.remove(4);
  s.remove(5);
  s.remove(6);
  print("s: ${s}");

  s.insert(10);
  s.insert(11);
  s.insert(12);

  s.insert(13);
  s.insert(14);
  s.insert(15);
  s.insert(16);
  s.insert(17);
  s.insert(18);
  s.insert(19);
  s.insert(20);
  s.insert(21);
  s.insert(22);
  s.insert(23);
  print("s: ${s}");

  s.insert(24);
  print("s: ${s}");

  s.remove(11);
  print("s: ${s}");

  // testing 'Contains'
  print("Contains(1): ${s.contains(1)}");
  print("Contains(5): ${s.contains(5)}");
  print("Contains(10): ${s.contains(10)}");
}

void testingRemove() {
  IntegerSet s = new IntegerSet();
  for (int i = 0; i < 20; i++) {
    s.insert(i);
  }
  print("s: ${s}");

  s.remove(5);
  s.remove(1);
  s.remove(8);
  print("s: ${s}");

  s.remove(11);
  print("s: ${s}");

  s.remove(16);
  print("s: ${s}");

  s.remove(19);
  print("s: ${s}");
}

void testingInsert() {
  IntegerSet s = new IntegerSet();
  for (int i = 0; i < 16; i++) {
    s.insert(i);
  }
  print("s: ${s}");

  s.insert(16);
  print("s: ${s}");
}

void testingClone() {
  List<int> elems1 = [1, 2, 3, 4, 5];
  IntegerSet s1 = new IntegerSet.fromList(elems1);
  print("s: ${s1}");

  IntegerSet s2 = new IntegerSet.clone(s1);
  print("s2: ${s2}");
  s2.remove(5);
  print("s2: ${s2}");
  s2.insert(11);
  s2.insert(12);
  print("s2: ${s2}");
}

void testingOperators() {
  // testing union set
  IntegerSet s1 = new IntegerSet();
  IntegerSet s2 = new IntegerSet();
  for (int i = 0; i < 7; i++) s1.insert(i);
  for (int i = 2; i < 9; i++) s2.insert(i);
  print("s1: ${s1}");
  print("s2: ${s2}");
  print("s1+s2: ${s1 + s2}");

  // testing intersection set
  print("s1^s2: ${s1 ^ s2}");

  // testing ==-operator
  print("s1 == s2: ${s1 == s2}");
  s2.insert(0);
  s2.insert(1);
  s2.remove(7);
  s2.remove(8);
  print("s2: ${s2}");
  print("s1 == s2: ${s1 == s2}");
  print("s1 != s2: ${s1 != s2}");

  // testing subset operator
  print("s1: ${s1}");
  print("s2: ${s2}");
  print("s1 <= s2: ${s1 <= s2}");
  s1.insert(7);
  print("s ${s1}");
  print("s1 <= s2: ${s1 <= s2}");
}

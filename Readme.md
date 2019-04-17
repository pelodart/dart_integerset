## Die Klasse ``IntegerSet``

### Beschreibung

Erstellen Sie eine Klasse ``IntegerSet``, die eine Menge ganzer Zahlen mit zentralen Operationen wie das Einfügen oder Löschen von Elementen realisiert. Arrays gibt es in Dart in Gestalt von ``List<>``-Objekten. Verwenden Sie deshalb ein ``List<int>``-Objekt, um die Elemente der Menge intern in einem ``IntegerSet``-Objekt zu verwalten. Beachten Sie dabei: Listen dieses Typs sind streng typisiert, d.h., alle Methoden zum Einfügen oder Entfernen von Elementen erlauben in diesem Beispiel nur ``int``-Werte – was in Bezug auf die Aufgabenstellung ja keinen Nachteil darstellt. Der Dart-Präcompiler meldet bereits zur Übersetzungszeit Fehler, wenn Sie aktuelle Parameter falschen Typs verwenden.

Damit kommen wir auf die öffentliche Schnittstelle der ``IntegerSet``-Klasse zu sprechen. Die Konstruktoren der Klasse haben wir in Tabelle 1 zusammengestellt:

| Konstruktor    | Schnittstelle und Beschreibung |
|:-------------- |-----------------------------------------|
| ``IntegerSet``   | ``IntegerSet();``<br/> Der Standardkonstruktor legt eine leere Menge an.|
| ``IntegerSet.clone``     | ``IntegerSet.clone(IntegerSet set)``<br/> Dient zum Erstellen einer Kopie eines bereits existierenden ``IntegerSet``-Objekts. Dessen Referenz wird im Parameter ``set`` übergeben. |
| ``IntegerSet.fromList``     | ``IntegerSet.fromList(List<int> elements);``<br/> Mit dem Parameter ``elements`` wird ein Array mit ganzen Zahlen übergeben. Vor der Aufnahme der Werte in das Mengenobjekt ist zu überprüfen, ob diese alle verschieden sind.|

Tabelle 1. Konstruktoren der Klasse ``IntegerSet``.

Die öffentlichen Methoden der Klasse ``IntegerSet`` finden Sie in Tabelle 2 vor:

| Methode        | Schnittstelle und Beschreibung |
|:-------------- |-----------------------------------------|
| ``elemAt``   | ``int elemAt(int i);``<br/> Ermöglicht den indizierten, lesenden Zugriff auf ein Mengenobjekt. Veränderungen an einem Mengenobjekt sollten konzeptionell nur mit Hilfe der beiden Methoden ``insert`` und ``remove`` erfolgen, aus diesem Grund gibt es ergänzend zur ``elemAt``-Methode keine schreibende Methode. |
| ``contains``   | ``bool contains(int n);``<br/> Prüft das Vorhandensein eines Elements *n* in der Menge. Der Rückgabewert true bedeutet „Element ist in der Menge vorhanden“, false das Gegenteil.|
| ``insert``     | ``bool insert (int n);``<br/> Fügt eine ganze Zahl *n* in die Menge ein. Ist die Zahl in der Menge bereits enthalten, liefert Insert den Wert ``false`` zurück, andernfalls ``true``.|
| ``remove``     | ``bool remove (int n);``<br/> Entfernt ein Element *n* aus der Menge. Ist die ganze Zahl in der Menge nicht enthalten, liefert Remove den Wert ``false`` zurück, andernfalls ``true``.|
|

Tabelle 2. Öffentliche Methoden der Klasse ``IntegerSet``.

Die zwei Eigenschaften (getter) ``size`` und ``isEmpty`` der Klasse ``IntegerSet`` sind in Tabelle 3 erläutert:

| getter        | Schnittstelle und Beschreibung |
|:-------------- |-----------------------------------------|
| ``size``   | ``int get size``<br/> Liefert die Anzahl der in der Menge enthaltenen Elemente zurück. |
| ``isEmpty``   | ``bool get isEmpty``<br/> Liefert bei einer leeren Menge ``true`` zurück, andernfalls ``false``.|
|

Tabelle 3. Öffentliche Eigenschaften (getter) der Klasse ``IntegerSet``.

Im Zusammenspiel mit dem Dart-Objektmodell sind minimal die ``toString``-Methode und der ``==``-Vergleichsoperator aus der universellen Vaterklasse ``Object`` geeignet zu überschreiben. Um zusätzliche Warnungen des Dart-Präcompilers zu vermeiden, sollte man auch die getter-Methode ``hashCode`` in Tabelle 4 mit einbeziehen:

| Element        | Schnittstelle und Beschreibung |
|:-------------- |-----------------------------------------|
| ``==``-Operator | ``bool operator ==(Object other);``<br/> Testet zwei ``IntegerSet``-Objekte auf Gleichheit. Zu beachten ist: Die beiden Mengen ``{ 1, 3, 5 }`` und ``{ 5, 3, 1 }`` sind im Sinne der Mengentheorie gleich, die Reihenfolge ihrer Elemente spielt keine Rolle. |
| ``toString``   | ``String toString();``<br/> Die Menge sollte im folgenden Format durch ein ``String``-Objekt dargestellt werden: <br/>``{1, 2, 3, 4, 5}``|
| ``hashCode``   | ``int get hashCode``<br/> Der Einfachheit halber kann der Resultatwert von ``hashCode` aus der Basisklasse zurückgegeben werden. |
|

Tabelle 4. Kontrakt mit der Basisklasse ``Object``.

Für elementare mengentheoretische Operationen wie das Bilden einer Vereinigungs- und Schnittmenge oder das Testen der Teilmengenrelation bietet sich die Realisierung durch Operatoren an. Tabelle 5 beschreibt die gängigsten Operatoren im Umfeld der elementaren Mengenlehre:

| Operator        | Schnittstelle und Beschreibung |
|:-------------- |-----------------------------------------|
| ``+``-Operator | ``IntegerSet operator +(IntegerSet s);``<br/> Das Resultatobjekt ist die Vereinigungsmenge des aktuellen Objekts mit dem Objekt ``s``. |
| ``-``-Operator | ``IntegerSet operator -(IntegerSet s);``<br/>  Das Resultatobjekt ist die Differenzmenge zwischen dem aktuellen Objekt und dem Objekt ``s``. |
| ``^``-Operator | ``IntegerSet operator ^(IntegerSet s);``<br/>  Das Resultatobjekt ist die Schnittmenge des aktuellen Objekts mit dem Objekt ``s`` . |
| ``<=``-Operator | ``bool operator <=(IntegerSet s);``<br/> Prüft, ob die Menge des aktuellen Objekts in der Menge des Objekts s enthalten ist (Rückgabewert ``true``) oder nicht (Rückgabewert ``false``). |
| ``>=``-Operator | ``bool operator >=(IntegerSet s);``<br/> Prüft, ob die Menge des aktuellen Objekts eine Obermenge des Objekts s ist (Rückgabewert ``true``) oder nicht (Rückgabewert ``false``). |
| ``<``-Operator | ``bool operator <(IntegerSet s);``<br/> Prüft, ob die Menge des aktuellen Objekts in der Menge des Objekts s **echt** enthalten ist (Rückgabewert ``true``) oder nicht (Rückgabewert ``false``). |
| ``>``-Operator | ``bool operator >(IntegerSet s);``<br/> Prüft, ob die Menge des aktuellen Objekts eine **echte** Obermenge des Objekts s ist (Rückgabewert ``true``) oder nicht (Rückgabewert ``false``). |
|

Tabelle 5. Mengentheoretische Operationen der Klasse ``IntegerSet``.



### Testrahmen

Testen Sie Ihre Implementierung mit einem möglichst umfangreichen Testrahmen. Das nachfolgende Code-Fragment soll eine Anregung darstellen:

```dart
import 'lib/IntegerSet.dart';

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
```

**Ausgabe**:

```dart
Testing c'tors:
s1: {}[0]
s2: {-2,-1,0,1,2}[5]
s3: {-1,1,2,3}[4]
s1.IsEmpty: true
s2.IsEmpty: false
s3.IsEmpty: false
Testing methods: 
s: {}[0]
s: {1,2,3,4,5,6}[6]
s: {1,2}[2]
s: {1,2,10,11,12,13,14,15,16,17,18,19,20,21,22,23}[16]
s: {1,2,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24}[17]
s: {1,2,10,12,13,14,15,16,17,18,19,20,21,22,23,24}[16]
Contains(1): true
Contains(5): false
Contains(10): true
s: {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}[16]
s: {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}[17]
s: {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19}[20]
s: {0,2,3,4,6,7,9,10,11,12,13,14,15,16,17,18,19}[17]
s: {0,2,3,4,6,7,9,10,12,13,14,15,16,17,18,19}[16]
s: {0,2,3,4,6,7,9,10,12,13,14,15,17,18,19}[15]
s: {0,2,3,4,6,7,9,10,12,13,14,15,17,18}[14]
s: {1,2,3,4,5}[5]
s2: {1,2,3,4,5}[5]
s2: {1,2,3,4}[4]
s2: {1,2,3,4,11,12}[6]
s1: {0,1,2,3,4,5,6}[7]
s2: {2,3,4,5,6,7,8}[7]
s1+s2: {0,1,2,3,4,5,6,7,8}[9]
s1^s2: {2,3,4,5,6}[5]
s1 == s2: false
s2: {2,3,4,5,6,0,1}[7]
s1 == s2: true
s1 != s2: false
s1: {0,1,2,3,4,5,6}[7]
s2: {2,3,4,5,6,0,1}[7]
s1 <= s2: true
s {0,1,2,3,4,5,6,7}[8]
s1 <= s2: false
```
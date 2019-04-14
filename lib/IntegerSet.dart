class IntegerSet extends Object {
  // private member data
  List<int> _elements; // list of elements

  // c'tors
  IntegerSet() {
    // allocate buffer for set
    this._elements = new List<int>();
  }

  IntegerSet.clone(IntegerSet set) {
    this._elements = new List<int>.from(set._elements);
  }

  IntegerSet.fromList(List<int> elements) {
    // allocate buffer for set
    this._elements = new List<int>();

    for (int i = 0; i < elements.length; i++) {
      this.insert(elements[i]);
    }
  }

  // public properties
  int get size => _elements.length;
  bool get isEmpty => _elements.length == 0;

  // public methods
  int elemAt(int i) => _elements[i];

  bool contains(int n) {
    // search element
    if (this._elements.contains(n)) return true;
    return false;
  }

  bool insert(int n) {
    // element already exists
    if (this.contains(n)) return false;

    // insert new element
    this._elements.add(n);
    return true;
  }

  bool remove(int n) {
    // element already exists
    if (!this.contains(n)) return false;

    // remove element
    this._elements.remove(n);
    return true;
  }

  // comparison operators
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntegerSet &&
          this.runtimeType == other.runtimeType &&
          this._setsAreEqual(other._elements);

  // set theory specific operators
  IntegerSet operator +(IntegerSet s) {
    IntegerSet result = new IntegerSet.clone(this);
    for (int i = 0; i < s.size; i++) result.insert(s._elements[i]);
    return result;
  }

  IntegerSet operator -(IntegerSet s) {
    IntegerSet result = new IntegerSet.clone(this);
    for (int i = 0; i < s.size; i++) result.remove(s._elements[i]);
    return result;
  }

  IntegerSet operator ^(IntegerSet s) {
    IntegerSet result = new IntegerSet();
    for (int i = 0; i < size; i++) {
      int n = _elements[i];
      if (s.contains(n)) result.insert(n);
    }
    return result;
  }

  bool operator <=(IntegerSet s) {
    // compare both sets element per element
    for (int i = 0; i < size; i++) {
      if (!s.contains(_elements[i])) return false;
    }
    return true;
  }

  bool operator >=(IntegerSet s) => s <= this;
  bool operator <(IntegerSet s) => (this <= s) && (this != s);
  bool operator >(IntegerSet s) => !(this <= s);

  // contract with base class 'Object'
  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb.write('{');
    for (int i = 0; i < this._elements.length; i++) {
      sb.write(this._elements[i]);
      if (i < this._elements.length - 1) sb.write(',');
    }
    sb.write("}[${this._elements.length}]");
    return sb.toString();
  }

  @override
  int get hashCode => super.hashCode;

  // helper methods
  bool _setsAreEqual(List<int> other) {
    // compare sizes
    if (this._elements.length != other.length) return false;

    // compare both sets element per element
    for (int i = 0; i < this._elements.length; i++) {
      if (other.contains(this._elements[i])) continue;

      return false;
    }

    return true;
  }
}

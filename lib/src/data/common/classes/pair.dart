class Pair<T1, T2> {
  final T1 l;
  final T2 r;

  Pair(this.l, this.r);

  @override
  String toString() {
    return 'Pair $l, $r';
  }
}

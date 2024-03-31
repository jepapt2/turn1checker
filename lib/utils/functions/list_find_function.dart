List<T> listFindUpdate<T>({
  required List<T> list,
  required int index,
  required T value,
}) {
  return list.map((e) {
    if (e == list[index]) {
      return value;
    } else {
      return e;
    }
  }).toList();
}

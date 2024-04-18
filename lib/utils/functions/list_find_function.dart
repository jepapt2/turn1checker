List<T> listFindUpdate<T>({
  required List<T> list,
  required int index,
  required T value,
}) {
  if (list[index] == null) {
    return list;
  }
  return list.map((e) {
    if (e == list[index]) {
      return value;
    } else {
      return e;
    }
  }).toList();
}

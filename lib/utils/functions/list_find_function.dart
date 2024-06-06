List<T> listFindUpdate<T>({
  required List<T> list,
  required int index,
  required T value,
}) {
  if (list[index] == null) {
    return list;
  }
  return list
      .asMap()
      .entries
      .map((e) => e.key == index ? value : e.value)
      .toList();
}

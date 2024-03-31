List<T> listFindUpdate<T>({
  required List<T> list,
  required int index,
  required T value,
}) {
  list[index] = value;
  return List<T>.from(list);
}

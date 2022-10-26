extension MapExtensions<K, V> on Map<K, V> {
  Map<K, V> get filterOutNulls {
    final Map<K, V> filtered = <K, V>{};
    forEach((K key, V value) {
      if (value != null) filtered[key] = value;
    });
    return filtered;
  }
}

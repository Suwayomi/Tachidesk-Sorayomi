import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

(T, ValueSetter<T>) useStateRecord<T>(T initialData) {
  final state = useState<T>(initialData);
  return (state.value, (value) => state.value = value);
}

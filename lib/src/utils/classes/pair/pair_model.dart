// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pair_model.freezed.dart';

@freezed
class Pair<F, S> with _$Pair<F, S> {
  factory Pair({
    required F first,
    required S second,
  }) = _Pair<F, S>;
}

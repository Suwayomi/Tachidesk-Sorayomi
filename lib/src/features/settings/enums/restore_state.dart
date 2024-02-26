import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../abstracts/value_enum.dart';

@JsonEnum(valueField: 'value')
enum RestoreState implements ValueEnum {
  idle("IDLE"),
  success("SUCCESS"),
  failure("FAILURE"),
  restoringCategories("RESTORING_CATEGORIES"),
  restoringManga("RESTORING_MANGA"),
  ;

  const RestoreState(this.value);
  static final _valueMap = {
    for (RestoreState state in RestoreState.values) state.value: state,
  };
  static RestoreState? fromValue(String value) => _valueMap[value];

  bool get isFinalState => this == success || this == failure;

  @override
  final String value;
}

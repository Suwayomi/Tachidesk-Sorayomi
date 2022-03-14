import 'dart:convert';

bool checkIfJson(String source) {
  try {
    jsonDecode(source);
    return true;
  } catch (e) {
    return false;
  }
}

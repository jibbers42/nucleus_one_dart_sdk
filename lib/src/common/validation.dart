void ensureArgumentIsNotEmpty(String argumentName, String argumentValue) {
  if (argumentValue.isEmpty) {
    throw ArgumentError.value(argumentValue, argumentName, 'Value cannot be blank.');
  }
}
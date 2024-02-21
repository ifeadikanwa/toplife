//I want to use this wrap nullable values, in my copyWith methods.
//This way the function can recognize when a nullable value is null or absent.
class Wrapped<T> {
  final T value;

  const Wrapped.value(this.value);
}

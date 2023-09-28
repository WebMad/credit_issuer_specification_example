abstract class Specification<T> {
  Specification<T> and(Specification<T> rightSpec);
  Specification<T> or(Specification<T> rightSpec);
  Specification<T> not(Specification<T> spec);
  bool isSatisfiedBy(T value);
}
import 'package:credit_issuer_specification_example/common/specification.dart';

abstract class CompositeSpec<T> implements Specification<T> {
  @override
  bool isSatisfiedBy(value);

  @override
  Specification<T> and(Specification<T> rightSpec) =>
      AndSpecification<T>(this, rightSpec);

  @override
  Specification<T> or(Specification<T> rightSpec) =>
      OrSpecification<T>(this, rightSpec);

  @override
  Specification<T> not(Specification<T> spec) => NotSpecification<T>(spec);
}

class AndSpecification<T> extends CompositeSpec<T> {
  final Specification<T> leftSpecification;
  final Specification<T> rightSpecification;

  AndSpecification(this.leftSpecification, this.rightSpecification);

  @override
  bool isSatisfiedBy(T value) =>
      leftSpecification.isSatisfiedBy(value) &&
      rightSpecification.isSatisfiedBy(value);
}

class OrSpecification<T> extends CompositeSpec<T> {
  final Specification<T> leftSpecification;
  final Specification<T> rightSpecification;

  OrSpecification(this.leftSpecification, this.rightSpecification);

  @override
  bool isSatisfiedBy(T value) =>
      leftSpecification.isSatisfiedBy(value) ||
      rightSpecification.isSatisfiedBy(value);
}

class NotSpecification<T> extends CompositeSpec<T> {
  final Specification<T> specification;

  NotSpecification(this.specification);

  @override
  bool isSatisfiedBy(T value) => !specification.isSatisfiedBy(value);
}

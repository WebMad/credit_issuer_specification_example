import 'package:credit_issuer_specification_example/common/composite_spec.dart';
import 'package:credit_issuer_specification_example/src/entities/customer.dart';

class CustomerAgeSpec extends CompositeSpec<Customer> {
  final int minAge;
  final int maxAge;

  CustomerAgeSpec({
    required this.minAge,
    required this.maxAge,
  });

  @override
  bool isSatisfiedBy(Customer value) {
    return value.age >= minAge && value.age <= maxAge;
  }
}

import 'package:credit_issuer_specification_example/common/composite_spec.dart';
import 'package:credit_issuer_specification_example/src/entities/application.dart';

class CreditProductTermSpec extends CompositeSpec<Application> {
  final int minTerm;
  final int maxTerm;

  CreditProductTermSpec({
    required this.minTerm,
    required this.maxTerm,
  });

  @override
  bool isSatisfiedBy(Application value) {
    return value.term >= minTerm && value.term <= maxTerm;
  }
}

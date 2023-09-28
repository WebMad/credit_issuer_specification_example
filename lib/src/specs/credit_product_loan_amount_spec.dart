import 'package:credit_issuer_specification_example/common/composite_spec.dart';
import 'package:credit_issuer_specification_example/src/entities/application.dart';

class CreditProductLoanAmountSpec extends CompositeSpec<Application> {
  final double minLoanAmount;
  final double maxLoanAmount;

  CreditProductLoanAmountSpec({
    required this.minLoanAmount,
    required this.maxLoanAmount,
  });

  @override
  bool isSatisfiedBy(Application value) {
    return value.amount >= minLoanAmount && value.amount <= maxLoanAmount;
  }
}

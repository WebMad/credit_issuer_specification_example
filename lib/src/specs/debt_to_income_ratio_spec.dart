import 'package:credit_issuer_specification_example/common/composite_spec.dart';
import 'package:credit_issuer_specification_example/src/entities/customer.dart';

class DebtToIncomeRatioSpec extends CompositeSpec<Customer> {
  final double dti;

  DebtToIncomeRatioSpec(this.dti);

  @override
  bool isSatisfiedBy(Customer value) {
    final customerDTI = double.parse(
      (value.monthlyLoanPayment / value.income).toStringAsFixed(2),
    );

    return customerDTI <= dti;
  }
}

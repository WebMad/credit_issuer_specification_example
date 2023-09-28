import 'package:credit_issuer_specification_example/src/entities/application.dart';
import 'package:credit_issuer_specification_example/src/entities/credit_product.dart';
import 'package:credit_issuer_specification_example/src/entities/customer.dart';
import 'package:credit_issuer_specification_example/src/specs/credit_product_loan_amount_spec.dart';
import 'package:credit_issuer_specification_example/src/specs/credit_product_term_spec.dart';
import 'package:credit_issuer_specification_example/src/specs/customer_age_spec.dart';
import 'package:credit_issuer_specification_example/src/specs/debt_to_income_ratio_spec.dart';

void main(List<String> arguments) {
  final roman = Customer(
    age: 32,
    firstname: 'Роман',
    lastname: "Шлюпкин",
    middleName: "Сергеевич",
    income: 32000,
    monthlyLoanPayment: 6000,
  );
  final romansApplication = Application(term: 120, amount: 45000);

  final creditProduct = CreditProduct(
    customerSpec: CustomerAgeSpec(
      minAge: 23,
      maxAge: 45,
    ).and(DebtToIncomeRatioSpec(0.36)),
    applicationSpec: CreditProductLoanAmountSpec(
      minLoanAmount: 30000,
      maxLoanAmount: 60000,
    ).and(CreditProductTermSpec(
      minTerm: 90,
      maxTerm: 180,
    )),
  );

  if (creditProduct.canIssue(
    customer: roman,
    application: romansApplication,
  )) {
    print("Congratulations, you have a loan approved!");
    return;
  }

  print("Loan application rejected");
}



import 'package:credit_issuer_specification_example/common/specification.dart';
import 'package:credit_issuer_specification_example/src/entities/application.dart';

import 'customer.dart';

class CreditProduct {
  final Specification<Customer> customerSpec;
  final Specification<Application> applicationSpec;

  CreditProduct({
    required this.customerSpec,
    required this.applicationSpec,
  });

  bool canIssue({
    required Customer customer,
    required Application application,
  }) {
    return customerSpec.isSatisfiedBy(customer) &&
        applicationSpec.isSatisfiedBy(application);
  }
}

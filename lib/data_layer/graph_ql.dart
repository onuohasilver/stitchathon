import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stitch/data_layer/network_class.dart';

import 'jwt_serialize.dart';

class Token extends ChangeNotifier {
  String token = '';
}

final httpLink = HttpLink("https://api.stitch.money/graphql", defaultHeaders: {
  if (token.isNotEmpty) 'Authorization': 'Bearer ${signJwt(privateKey)}',
  'Content-Type': 'application/json',
});

class _CustomAuthLink extends AuthLink {
  _CustomAuthLink()
      : super(getToken: () async {
          late String token;

          await NetworkRequests()
              .post('https://secure.stitch.money/connect/token', {
            'grant_type': 'client_credentials',
            'client_id': 'test-075b3ce1-5790-4d2f-8a9b-af24c3b45951',
            'client_assertion_type':
                'urn:ietf:params:oauth:client-assertion-type:jwt-bearer',
            'audience': 'https://secure.stitch.money/connect/token',
            'scope': 'client_paymentrequest',
            'client_assertion': signJwt(privateKey)
          }).then((value) {
            token = jsonDecode(value.body)['access_token'];
          });

          return "Bearer $token";
        });
}

GraphQLClient graphqlClient = GraphQLClient(
  cache: GraphQLCache(),
  link: _CustomAuthLink().concat(httpLink),
);
ValueNotifier<GraphQLClient> client = ValueNotifier(graphqlClient);

String createPaymentRequest() {
  return '''
  mutation CreatePaymentRequest(
    \$amount: MoneyInput!,
    \$payerReference: String!,
    \$beneficiaryReference: String!,
    \$externalReference: String,
    \$beneficiaryName: String!,
    \$beneficiaryBankId: BankBeneficiaryBankId!,
    \$beneficiaryAccountNumber: String!) {
  clientPaymentInitiationRequestCreate(input: {
      amount: \$amount,
      payerReference: \$payerReference,
      beneficiaryReference: \$beneficiaryReference,
      externalReference: \$externalReference,
      beneficiary: {
          bankAccount: {
              name: \$beneficiaryName,
              bankId: \$beneficiaryBankId,
              accountNumber: \$beneficiaryAccountNumber
          }
      }
    }) {
    paymentInitiationRequest {
      id
      url
    }
  }
}
  ''';
}

Map<String, dynamic> variables = {
  "amount": {"quantity": 100, "currency": "NGN"},
  "payerReference": "Test",
  'beneficiaryReference': "Test",
  "externalReference": "example-e32e5478-325b-4869-a53e-2021727d2afe",
  "beneficiaryName": "Kamilu Adewale",
  "beneficiaryBankId": "united_bank_for_africa",
  "beneficiaryAccountNumber": "2071301336"
};

String token =
    'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjIwQzA4QkExNEI3Q0Q3RTdFQzVCMkI5NTY5NEI0MDdDQjU4NDU2NTEifQ.eyJhdWQiOiJodHRwczovL3NlY3VyZS5zdGl0Y2gubW9uZXkvY29ubmVjdC90b2tlbiIsImlzcyI6InRlc3QtMDc1YjNjZTEtNTc5MC00ZDJmLThhOWItYWYyNGMzYjQ1OTUxIiwic3ViIjoidGVzdC0wNzViM2NlMS01NzkwLTRkMmYtOGE5Yi1hZjI0YzNiNDU5NTEiLCJqdGkiOjE5MTc3MDc1LCJpYXQiOjE2NDUyNzg5NTUsIm5iZiI6IjAiLCJleHAiOjE2NDUyNzkwNTV9.KYZghf_I5kPFEhCus8zFGCd6_Tes4o-xbgV6QJSmSX-ve7Lqm9-tBiCGlcj9HwPrRQ-JmJkKzWV-iouegxfm51diGKWFMJQQDL01834sqSXvn54vF2GAlvfZCeVablj_h2HJSeIyrrgGT__McLNHuWouOaerUPpyzUbyAWtwntEd8Ccebn3ZuddWo2mZBxjoYStVaj1MUQFvxKVA1w5iB_iWDIwH0r764I0JTdMCNR67ZE16faJGn7zXZHIHPQdKOnah5hlIcgJW3dyABpZsDXUgK4-5jINsrIVxbnO4O45_2SGi-mlMxEmXKqcN6PEZRlR6sWdN6KELjRuHjCnWZ7PkoBp9B8XTl_R2h7JAkNZPbsuyA7Vvzpqz0WNE6f9HsTeq3Q7abrcNgKQfJm5ciO2HWK_gyJOlVTGt-ckVc6UnSVrFSRPca-DP4RQ7IwbxaWJDH_yHO9BeTye_Ed2LzxbWLhdZ-eMQFlmAyIj2xT5gWmFGdCIzPhDmkwgJCvKkvMxPF52dbFWUu0tigtXePdmFywvpnpzXY6zMWcoKo9RqKro8mDP_RLED0EnUKBgIjSUdfmOhecAAm_duUyLNjD9FM8welFWLLui2x5wocLXE0KiPFpOO-iTWAcqrOl1';

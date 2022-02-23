// import 'dart:math';

// import 'package:jaguar_jwt/jaguar_jwt.dart';

// import 'jwt_serialize.dart';

// signJWT2() {}

// const key = 's3cr3t';
// final claimSet = JwtClaim(
//   jwtId: Random().nextInt(50000000).toString(),
//   subject: clientId,
//   issuer: clientId,
//   issuedAt: DateTime.now(),
//   expiry: DateTime(2022, 2, 20, 3),
//   notBefore: DateTime(2022, 2, 16, 3),
//   audience: <String>['https://secure.stitch.money/connect/token'],
//   maxAge: const Duration(hours: 2),
//   otherClaims: <String, dynamic>{
//     'typ': 'authnresponse',
//     'pld': {'k': 'v'}
//   },
//   String token = issueJwtHS256(claimSet, privateKey);
// );


//   // print(token);
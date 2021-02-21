import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/queries/queries.dart';
import 'package:haggle_x/services/secure_storage.dart';
import '../config.dart';
import 'package:meta/meta.dart';

abstract class AuthService extends ChangeNotifier {
  GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();
  AuthQueryMutation _authQueryMutation = AuthQueryMutation();
  SecureStorage secureStorage = SecureStorage();

  String _error;
  String get error => _error;

  Future<Map<String, dynamic>> register({
    @required String email,
    @required String username,
    @required String password,
    @required String phonenumber,
    String referralCode,
  }) async {
    try {
      _error = null;
      notifyListeners();
      await initHiveForFlutter();
      GraphQLClient _client = _graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(MutationOptions(
          document: gql(_authQueryMutation.signup(
        email: email,
        username: username,
        password: password,
        phonenumber: phonenumber,
        country: "Nigeria",
        currency: "Naira",
        referralCode: referralCode,
      ))));
      if (result.hasException) {
        _error = result.exception.graphqlErrors[0].message;
        notifyListeners();
        return {"success": false, "data": error};
      }
      Map<String, dynamic> response = result.data;
      return {"success": true, "data": response};
    } on SocketException {
      _error = 'No Internet Connection';
      notifyListeners();
      return {"success": false, "data": null};
    }
  }

  Future<Map<String, dynamic>> signin(
      {@required String email, @required String password}) async {
    try {
      _error = null;
      notifyListeners();
      await initHiveForFlutter();

      GraphQLClient _client = _graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(MutationOptions(
          document:
              gql(_authQueryMutation.login(email: email, password: password))));
      if (result.hasException) {
        _error = result.exception.graphqlErrors[0].message;
        notifyListeners();
        return {"success": false, "data": error};
      }
      Map<String, dynamic> response = result.data;
      return {"success": true, "data": response};
    } on SocketException {
      _error = 'No Internet Connection';
      notifyListeners();
      return {"success": false, "data": null};
    }
  }
}

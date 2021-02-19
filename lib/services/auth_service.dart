import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/queries/queries.dart';
import '../config.dart';

class AuthService {
  GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();
  AuthQueryMutation _authQueryMutation = AuthQueryMutation();

  Future<Map<String, dynamic>> register(Map<String, dynamic> input) async {
    try {
      GraphQLClient _client = _graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
          MutationOptions(document: gql(_authQueryMutation.signup(input))));
      if (result.hasException) {
        print(result.exception.toString());
        return null;
      }
      var response = result.data;
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

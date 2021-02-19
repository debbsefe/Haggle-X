import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  String token;

  static dynamic appToken = '';
  GraphQLConfiguration({String token}) {
    appToken = token;
  }

  static HttpLink httpLink =
      HttpLink("http://hagglex-backend-staging.herokuapp.com/graphql/");

  static final AuthLink authLink = AuthLink(getToken: () async => '$appToken');
  static final Link link = authLink.concat(httpLink);

  GraphQLClient clientToQuery({authToken}) {
    initHiveForFlutter();
    var authHeader =
        authToken == null || authToken == '' ? '' : 'Bearer $authToken';
    final AuthLink clientAuthLink =
        AuthLink(getToken: () async => '$authHeader');
    final Link clientLink = clientAuthLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: authHeader == null || authHeader == '' ? httpLink : clientLink,
    );
  }
}

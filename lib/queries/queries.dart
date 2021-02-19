class AuthQueryMutation {
  String signup(Map<String, dynamic> input) {
    return """
      mutation ($input: CreateUserInput!){
        register(data: $input) {
          token
        }
      }
    """;
  }
}

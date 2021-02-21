import 'package:meta/meta.dart';

class AuthQueryMutation {
  String signup({
    @required String email,
    @required String username,
    @required String password,
    @required String phonenumber,
    @required String country,
    @required String currency,
    String referralCode,
  }) {
    return """
      mutation{
        register(data: 
        {
        email: "$email", 
        username: "$username",
        password: "$password", 
        phonenumber: "$phonenumber",
        country: "$country",
        currency: "$currency",
        referralCode: "$referralCode"
        }) 
        {
          token
        }
      }
    """;
  }

  String login({
    @required String email,
    @required String password,
  }) {
    return """
      mutation{
        login(data: 
        {
        input: "$email",    
        password: "$password",     
        }) 
        {
          token
        }
      }
    """;
  }
}

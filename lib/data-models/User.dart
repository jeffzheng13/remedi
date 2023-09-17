import 'Procedure.dart';

class User {
  final String first_name;
  final String last_name;
  final String email;
  final List<Procedure> pmh;

  User(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.pmh});
}

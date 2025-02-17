part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Users convertToUser({String name = "no name"}) =>
      Users(this.uid, this.email, name: name);
}

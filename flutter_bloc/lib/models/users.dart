part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String profilePicturfe;

  Users(this.uid, this.email, {this.name, this.profilePicturfe});

  @override
  List<Object> get props => [uid, email, name, profilePicturfe];
}

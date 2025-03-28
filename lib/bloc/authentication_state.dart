part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown, loading, error}

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user
  });
  final AuthenticationStatus status;
  final MyUser? user;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(MyUser myUser) :
    this._(status: AuthenticationStatus.authenticated, user: myUser);
  
  const AuthenticationState.unauthenticated() :
    this._(status: AuthenticationStatus.unauthenticated);
  
  const AuthenticationState.loading() : 
    this._(status: AuthenticationStatus.loading);


  const AuthenticationState.error() : 
    this._(status: AuthenticationStatus.error);
  
  @override
  List<Object?> get props => [status, user];
  
}

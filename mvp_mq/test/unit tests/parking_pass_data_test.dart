import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvp_mq/firebase_auth/auth_service.dart';

class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final FireBaseAuthService  auth = FireBaseAuthService(firebaseAuth: mockFirebaseAuth);
  setUp(() {});
  tearDown(() {});

  test("emit occurs", () async {
    expectLater(auth.user, emitsInOrder([_mockUser]));
  });

  // test("create account", () async {
  //   when(
  //     mockFirebaseAuth.createUserWithEmailAndPassword(
  //         email: "tadas@gmail.com", password: "123456"),
  //   ).thenAnswer((realInvocation) => null);

  //   expect(
  //       await auth.signUpWithEmailAndPassword("tadas@gmail.com", "123456"),
  //       "Success");
  // });

  

  test("sign in", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => null);

    expect(await auth.signInWithEmailAndPassword( "tadas@gmail.com", "123456"),
        "Success");
  });

  test("sign in exception", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: '0'));

    expect(await auth.signInWithEmailAndPassword( "tadas@gmail.com", "123456"),
        "You screwed up");
  });

  
  
}
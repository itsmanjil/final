import 'package:flutter_test/flutter_test.dart';
import 'package:second_hand_shop/model/user.dart';
import 'package:second_hand_shop/repository/userrepository.dart';
import 'package:second_hand_shop/utils/url.dart';

void main() {
  late UserRepository? userRepository;

  setUp(() {
    userRepository = UserRepository();
    token = '';
  });

  group('user api', () {
    test('user registration', () async {
      bool expectedresult = true;
      User user = User(
        name: 'test122',
        email: 'test12222@gmail.com',
        password: 'test1222',
        phone: '12345678922',
      );
      bool actualresult = await userRepository!.registerUser(user);

      expect(expectedresult, actualresult);
    });

    test('user login', () async {
      bool expectedresult = true;
      bool actualresult = await UserRepository().login('admin', 'admin');

      expect(expectedresult, actualresult);
    });
  });

  tearDown(() {
    userRepository = null;
    // productRepository = null;
    // productResponse = null;
  });

  // group('product', () {
  //   test('product', () async {
  //     productRepository = await ProductRepository.getProducts();
  //     bool expectedresult = true;
  //     bool actualresult = false;
  //   });
  // });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:haggle_x/utils/field_validator.dart';

void main() {
  group('Field Validator', () {
    group('Test validateField method', () {
      test('Test for empty field', () {
        var result = FieldValidator.validateField('');
        expect(result, 'Field cannot be empty');
      });

      test('Test for non-empty field', () {
        var result = FieldValidator.validateField('t');
        expect(result, null);
      });
    });

    group('Test validateEmail method', () {
      test('Empty Email Test', () {
        var result = FieldValidator.validateEmail('');
        expect(result, 'Email field cannot be empty');
      });

      test('Invalid Email Test', () {
        var result = FieldValidator.validateEmail('fffff');
        expect(result, 'Enter Valid Email!');
      });

      test('Valid Email Test', () {
        var result = FieldValidator.validateEmail('mamuseferha@gmail.com');
        expect(result, null);
      });
    });

    group('Test validatePassword method', () {
      test('Empty Password Test', () {
        var result = FieldValidator.validatePassword('');
        expect(result, 'Password cannot be empty');
      });

      test('Invalid Password Test', () {
        var result = FieldValidator.validatePassword('123');
        expect(result, 'Password cannot be less than eight characters');
      });

      test('Valid Password Test', () {
        var result = FieldValidator.validatePassword('a311e1e1');
        expect(result, null);
      });
    });

    group('Test validatePhoneNumber method', () {
      test('Test for empty number', () {
        var result = FieldValidator.validatePhoneNumber('');
        expect(result, 'Field cannot be empty');
      });
      test('Test if alphabet is entered', () {
        var result = FieldValidator.validatePhoneNumber('aaaaaaaaaaa');
        expect(result, 'Field contains non-numbers');
      });

      test('Test if alphabet and number is entered', () {
        var result = FieldValidator.validatePhoneNumber('0814d5d5488');
        expect(result, 'Field contains non-numbers');
      });

      test('Test if special character is entered', () {
        var result = FieldValidator.validatePhoneNumber("0814*525488");
        expect(result, 'Field contains non-numbers');
      });

      test('Test if less than 11 numbers is entered', () {
        var result = FieldValidator.validatePhoneNumber("0814752548");
        expect(result, 'Enter a valid Phone Number(11 digits only allowed)');
      });

      test('Test if less than 11 numbers is entered', () {
        var result = FieldValidator.validatePhoneNumber("081475254888");
        expect(result, 'Enter a valid Phone Number(11 digits only allowed)');
      });

      test('Test if number entered', () {
        var result = FieldValidator.validatePhoneNumber("08147525488");
        expect(result, null);
      });
    });
  });
}

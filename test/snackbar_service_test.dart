import 'package:flutter_test/flutter_test.dart';
import 'package:marquis_v2/services/snackbar_service.dart';

void main() {
  group('SnackbarService Tests', () {
    late SnackbarService snackbarService;

    setUp(() {
      snackbarService = SnackbarService();
    });

    test('Initial snackbars list should be empty', () {
      expect(snackbarService.snackbars, isEmpty);
    });

    test('displaySnackbar should add a snackbar to the list', () async {
      snackbarService.displaySnackbar('Test Message');
      expect(snackbarService.snackbars.length, 1);
      expect(snackbarService.snackbars.first.message, 'Test Message0');
      // To ensure the snackbar is removed before next test starts
      await Future.delayed(const Duration(seconds: 6));
    });

    test('displaySnackbar should remove snackbar after 5 seconds', () async {
      snackbarService.displaySnackbar('Test Message');
      expect(snackbarService.snackbars.length, 1);
      await Future.delayed(const Duration(seconds: 6));
      expect(snackbarService.snackbars, isEmpty);
      // To ensure the snackbar is removed before next test starts
      await Future.delayed(const Duration(seconds: 6));
    });

    test('removeExistingAndDisplaySnackbar should clear and add a new snackbar', () async {
      snackbarService.displaySnackbar('First Message');
      snackbarService.removeExistingAndDisplaySnackbar('Second Message');
      expect(snackbarService.snackbars.length, 1);
      expect(snackbarService.snackbars.first.message, 'Second Message0');
      // To ensure the snackbar is removed before next test starts
      await Future.delayed(const Duration(seconds: 6));
    });

    test('displaySnackbar should generate unique keys for each snackbar', () {
      snackbarService.displaySnackbar('Message 1');
      snackbarService.displaySnackbar('Message 2');
      expect(snackbarService.snackbars.length, 2);
      expect(snackbarService.snackbars[0].key, isNot(snackbarService.snackbars[1].key));
    });
  });
}

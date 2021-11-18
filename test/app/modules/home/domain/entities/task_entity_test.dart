import 'package:flutter_test/flutter_test.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';

void main() {
  group('Should check if attribute NAME is valid or not:', () {
    test('Name is invalid when length < 5', () {
      expect(TaskEntity(name: 'Name', date: DateTime.now()).isValidName, false);
    });
    test('Name is valid', () {
      expect(TaskEntity(name: 'Names', date: DateTime.now()).isValidName, true);
    });
    test('Name is invalid when length > 100', () {
      expect(
          TaskEntity(
                  name:
                      '7VqmzTJIJBT7VAYblnglqyqcWTOs5nb4gqrAhdgftRsKzEQcwnsRy2voWKhvcMnzlZ9BLPYN7I3uMjpak3kJHA5NezTk2gttmY0OF',
                  date: DateTime.now())
              .isValidName,
          false);
    });
  });
}

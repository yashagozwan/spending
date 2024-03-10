import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Playground', () {
    test('Compare UID', () {
      const token1 = 'pQo8Z6kwU9hac2rnLYrbD68T9VA3';
      const token2 = 'pQo8Z6kwU9hac2rnLYrbD68T9VA3';
      expect(token1, token2);
    });
  });
}

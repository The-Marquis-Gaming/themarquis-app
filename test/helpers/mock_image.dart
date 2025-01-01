import 'dart:typed_data';
import 'dart:ui';

import 'package:mockito/mockito.dart';

class MockImage extends Mock implements Image {
  final int _height, _width;
  MockImage({required int height, required int width})
      : _height = height,
        _width = width;

  @override
  int get width => _width;

  @override
  int get height => _height;

  @override
  bool get debugDisposed => (super.noSuchMethod(
        Invocation.getter(#debugDisposed),
        returnValue: false,
      ) as bool);

  @override
  ColorSpace get colorSpace => (super.noSuchMethod(
        Invocation.getter(#colorSpace),
        returnValue: ColorSpace.sRGB,
      ) as ColorSpace);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  Future<ByteData?> toByteData({ImageByteFormat? format = ImageByteFormat.rawRgba}) => (super.noSuchMethod(
        Invocation.method(
          #toByteData,
          [],
          {#format: format},
        ),
        returnValue: Future<ByteData?>.value(),
      ) as Future<ByteData?>);

  @override
  Image clone() => (super.noSuchMethod(
        Invocation.method(
          #clone,
          [],
        ),
        returnValue: _FakeImage(
          this,
          Invocation.method(
            #clone,
            [],
          ),
        ),
      ) as Image);

  @override
  bool isCloneOf(Image? other) => (super.noSuchMethod(
        Invocation.method(
          #isCloneOf,
          [other],
        ),
        returnValue: false,
      ) as bool);
}

class _FakeImage extends SmartFake implements Image {
  _FakeImage(
    super.parent,
    super.parentInvocation,
  );
}

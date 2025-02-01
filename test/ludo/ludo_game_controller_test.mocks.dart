// Mocks generated by Mockito 5.4.5 from annotations
// in marquis_v2/test/ludo/ludo_game_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i10;
import 'dart:ui' as _i5;

import 'package:flame/src/cache/images.dart' as _i11;
import 'package:flutter/material.dart' as _i4;
import 'package:hive/hive.dart' as _i6;
import 'package:http/http.dart' as _i3;
import 'package:marquis_v2/games/ludo/models/ludo_session.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDateTime_0 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$LudoSessionDataCopyWith_1<$Res> extends _i1.SmartFake
    implements _i2.$LudoSessionDataCopyWith<$Res> {
  _Fake$LudoSessionDataCopyWith_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i3.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAssetBundle_4 extends _i1.SmartFake implements _i4.AssetBundle {
  _FakeAssetBundle_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeImage_5 extends _i1.SmartFake implements _i5.Image {
  _FakeImage_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox<E> extends _i1.Mock implements _i6.Box<E> {
  MockBox() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<E> get values => (super.noSuchMethod(
        Invocation.getter(#values),
        returnValue: <E>[],
      ) as Iterable<E>);

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);

  @override
  bool get isOpen => (super.noSuchMethod(
        Invocation.getter(#isOpen),
        returnValue: false,
      ) as bool);

  @override
  bool get lazy => (super.noSuchMethod(
        Invocation.getter(#lazy),
        returnValue: false,
      ) as bool);

  @override
  Iterable<dynamic> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <dynamic>[],
      ) as Iterable<dynamic>);

  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);

  @override
  bool get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: false,
      ) as bool);

  @override
  bool get isNotEmpty => (super.noSuchMethod(
        Invocation.getter(#isNotEmpty),
        returnValue: false,
      ) as bool);

  @override
  Iterable<E> valuesBetween({
    dynamic startKey,
    dynamic endKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #valuesBetween,
          [],
          {
            #startKey: startKey,
            #endKey: endKey,
          },
        ),
        returnValue: <E>[],
      ) as Iterable<E>);

  @override
  E? getAt(int? index) => (super.noSuchMethod(Invocation.method(
        #getAt,
        [index],
      )) as E?);

  @override
  Map<dynamic, E> toMap() => (super.noSuchMethod(
        Invocation.method(
          #toMap,
          [],
        ),
        returnValue: <dynamic, E>{},
      ) as Map<dynamic, E>);

  @override
  dynamic keyAt(int? index) => super.noSuchMethod(Invocation.method(
        #keyAt,
        [index],
      ));

  @override
  _i8.Stream<_i6.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
          {#key: key},
        ),
        returnValue: _i8.Stream<_i6.BoxEvent>.empty(),
      ) as _i8.Stream<_i6.BoxEvent>);

  @override
  bool containsKey(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> put(
    dynamic key,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> putAt(
    int? index,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAt,
          [
            index,
            value,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> putAll(Map<dynamic, E>? entries) => (super.noSuchMethod(
        Invocation.method(
          #putAll,
          [entries],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<int> add(E? value) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [value],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);

  @override
  _i8.Future<Iterable<int>> addAll(Iterable<E>? values) => (super.noSuchMethod(
        Invocation.method(
          #addAll,
          [values],
        ),
        returnValue: _i8.Future<Iterable<int>>.value(<int>[]),
      ) as _i8.Future<Iterable<int>>);

  @override
  _i8.Future<void> delete(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #deleteAt,
          [index],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteAll(Iterable<dynamic>? keys) => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [keys],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> compact() => (super.noSuchMethod(
        Invocation.method(
          #compact,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<int> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [LudoSessionData].
///
/// See the documentation for Mockito's code generation for more information.
class MockLudoSessionData extends _i1.Mock implements _i2.LudoSessionData {
  MockLudoSessionData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i5.Color> get getListOfColors => (super.noSuchMethod(
        Invocation.getter(#getListOfColors),
        returnValue: <_i5.Color>[],
      ) as List<_i5.Color>);

  @override
  int get nextPlayerIndex => (super.noSuchMethod(
        Invocation.getter(#nextPlayerIndex),
        returnValue: 0,
      ) as int);

  @override
  List<String> get notAvailableColors => (super.noSuchMethod(
        Invocation.getter(#notAvailableColors),
        returnValue: <String>[],
      ) as List<String>);

  @override
  bool get isInBox => (super.noSuchMethod(
        Invocation.getter(#isInBox),
        returnValue: false,
      ) as bool);

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#id),
        ),
      ) as String);

  @override
  String get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#status),
        ),
      ) as String);

  @override
  String get nextPlayer => (super.noSuchMethod(
        Invocation.getter(#nextPlayer),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#nextPlayer),
        ),
      ) as String);

  @override
  String get nonce => (super.noSuchMethod(
        Invocation.getter(#nonce),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#nonce),
        ),
      ) as String);

  @override
  String get color => (super.noSuchMethod(
        Invocation.getter(#color),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#color),
        ),
      ) as String);

  @override
  String get playAmount => (super.noSuchMethod(
        Invocation.getter(#playAmount),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#playAmount),
        ),
      ) as String);

  @override
  String get playToken => (super.noSuchMethod(
        Invocation.getter(#playToken),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#playToken),
        ),
      ) as String);

  @override
  List<_i2.LudoSessionUserStatus> get sessionUserStatus => (super.noSuchMethod(
        Invocation.getter(#sessionUserStatus),
        returnValue: <_i2.LudoSessionUserStatus>[],
      ) as List<_i2.LudoSessionUserStatus>);

  @override
  int get nextPlayerId => (super.noSuchMethod(
        Invocation.getter(#nextPlayerId),
        returnValue: 0,
      ) as int);

  @override
  String get creator => (super.noSuchMethod(
        Invocation.getter(#creator),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#creator),
        ),
      ) as String);

  @override
  DateTime get createdAt => (super.noSuchMethod(
        Invocation.getter(#createdAt),
        returnValue: _FakeDateTime_0(
          this,
          Invocation.getter(#createdAt),
        ),
      ) as DateTime);

  @override
  _i2.$LudoSessionDataCopyWith<_i2.LudoSessionData> get copyWith =>
      (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$LudoSessionDataCopyWith_1<_i2.LudoSessionData>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$LudoSessionDataCopyWith<_i2.LudoSessionData>);

  @override
  _i8.Future<void> save() => (super.noSuchMethod(
        Invocation.method(
          #save,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> delete() => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i3.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i3.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i10.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i10.Uint8List>.value(_i10.Uint8List(0)),
      ) as _i8.Future<_i10.Uint8List>);

  @override
  _i8.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i3.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Images].
///
/// See the documentation for Mockito's code generation for more information.
class MockImages extends _i1.Mock implements _i11.Images {
  MockImages() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AssetBundle get bundle => (super.noSuchMethod(
        Invocation.getter(#bundle),
        returnValue: _FakeAssetBundle_4(
          this,
          Invocation.getter(#bundle),
        ),
      ) as _i4.AssetBundle);

  @override
  set bundle(_i4.AssetBundle? _bundle) => super.noSuchMethod(
        Invocation.setter(
          #bundle,
          _bundle,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get prefix => (super.noSuchMethod(
        Invocation.getter(#prefix),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#prefix),
        ),
      ) as String);

  @override
  set prefix(String? value) => super.noSuchMethod(
        Invocation.setter(
          #prefix,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<String> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <String>[],
      ) as List<String>);

  @override
  void add(
    String? name,
    _i5.Image? image,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #add,
          [
            name,
            image,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> addFromBase64Data(
    String? name,
    String? base64Data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addFromBase64Data,
          [
            name,
            base64Data,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<_i5.Image> fetchOrGenerate(
    String? name,
    _i8.Future<_i5.Image> Function()? imageGenerator,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchOrGenerate,
          [
            name,
            imageGenerator,
          ],
        ),
        returnValue: _i8.Future<_i5.Image>.value(_FakeImage_5(
          this,
          Invocation.method(
            #fetchOrGenerate,
            [
              name,
              imageGenerator,
            ],
          ),
        )),
      ) as _i8.Future<_i5.Image>);

  @override
  void clear(String? name) => super.noSuchMethod(
        Invocation.method(
          #clear,
          [name],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearCache() => super.noSuchMethod(
        Invocation.method(
          #clearCache,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Image fromCache(String? name) => (super.noSuchMethod(
        Invocation.method(
          #fromCache,
          [name],
        ),
        returnValue: _FakeImage_5(
          this,
          Invocation.method(
            #fromCache,
            [name],
          ),
        ),
      ) as _i5.Image);

  @override
  _i8.Future<_i5.Image> load(
    String? fileName, {
    String? key,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #load,
          [fileName],
          {#key: key},
        ),
        returnValue: _i8.Future<_i5.Image>.value(_FakeImage_5(
          this,
          Invocation.method(
            #load,
            [fileName],
            {#key: key},
          ),
        )),
      ) as _i8.Future<_i5.Image>);

  @override
  _i8.Future<List<_i5.Image>> loadAll(List<String>? fileNames) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadAll,
          [fileNames],
        ),
        returnValue: _i8.Future<List<_i5.Image>>.value(<_i5.Image>[]),
      ) as _i8.Future<List<_i5.Image>>);

  @override
  _i8.Future<List<_i5.Image>> loadAllImages() => (super.noSuchMethod(
        Invocation.method(
          #loadAllImages,
          [],
        ),
        returnValue: _i8.Future<List<_i5.Image>>.value(<_i5.Image>[]),
      ) as _i8.Future<List<_i5.Image>>);

  @override
  _i8.Future<List<_i5.Image>> loadAllFromPattern(Pattern? pattern) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadAllFromPattern,
          [pattern],
        ),
        returnValue: _i8.Future<List<_i5.Image>>.value(<_i5.Image>[]),
      ) as _i8.Future<List<_i5.Image>>);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  String? findKeyForImage(_i5.Image? image) =>
      (super.noSuchMethod(Invocation.method(
        #findKeyForImage,
        [image],
      )) as String?);

  @override
  _i8.Future<void> ready() => (super.noSuchMethod(
        Invocation.method(
          #ready,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<_i5.Image> fromBase64(
    String? key,
    String? base64,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromBase64,
          [
            key,
            base64,
          ],
        ),
        returnValue: _i8.Future<_i5.Image>.value(_FakeImage_5(
          this,
          Invocation.method(
            #fromBase64,
            [
              key,
              base64,
            ],
          ),
        )),
      ) as _i8.Future<_i5.Image>);
}

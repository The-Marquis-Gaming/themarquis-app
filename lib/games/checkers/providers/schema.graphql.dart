class Input$checkers_marq_CounterOrder {
  factory Input$checkers_marq_CounterOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_CounterOrderField field,
  }) =>
      Input$checkers_marq_CounterOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_CounterOrder._(this._$data);

  factory Input$checkers_marq_CounterOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_CounterOrderField((l$field as String));
    return Input$checkers_marq_CounterOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_CounterOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_CounterOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_CounterOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_CounterOrder<Input$checkers_marq_CounterOrder>
      get copyWith => CopyWith$Input$checkers_marq_CounterOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_CounterOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_CounterOrder<TRes> {
  factory CopyWith$Input$checkers_marq_CounterOrder(
    Input$checkers_marq_CounterOrder instance,
    TRes Function(Input$checkers_marq_CounterOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_CounterOrder;

  factory CopyWith$Input$checkers_marq_CounterOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_CounterOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_CounterOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_CounterOrder<TRes>
    implements CopyWith$Input$checkers_marq_CounterOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_CounterOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_CounterOrder _instance;

  final TRes Function(Input$checkers_marq_CounterOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_CounterOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_CounterOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_CounterOrder<TRes>
    implements CopyWith$Input$checkers_marq_CounterOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_CounterOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_CounterOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_CounterWhereInput {
  factory Input$checkers_marq_CounterWhereInput({
    String? global_key,
    String? global_keyGT,
    String? global_keyGTE,
    String? global_keyLT,
    String? global_keyLTE,
    String? global_keyNEQ,
    String? global_keyEQ,
    List<String?>? global_keyNOTIN,
    List<String?>? global_keyIN,
    String? global_keyNOTLIKE,
    String? global_keyLIKE,
    String? value,
    String? valueGT,
    String? valueGTE,
    String? valueLT,
    String? valueLTE,
    String? valueNEQ,
    String? valueEQ,
    List<String?>? valueNOTIN,
    List<String?>? valueIN,
    String? valueNOTLIKE,
    String? valueLIKE,
  }) =>
      Input$checkers_marq_CounterWhereInput._({
        if (global_key != null) r'global_key': global_key,
        if (global_keyGT != null) r'global_keyGT': global_keyGT,
        if (global_keyGTE != null) r'global_keyGTE': global_keyGTE,
        if (global_keyLT != null) r'global_keyLT': global_keyLT,
        if (global_keyLTE != null) r'global_keyLTE': global_keyLTE,
        if (global_keyNEQ != null) r'global_keyNEQ': global_keyNEQ,
        if (global_keyEQ != null) r'global_keyEQ': global_keyEQ,
        if (global_keyNOTIN != null) r'global_keyNOTIN': global_keyNOTIN,
        if (global_keyIN != null) r'global_keyIN': global_keyIN,
        if (global_keyNOTLIKE != null) r'global_keyNOTLIKE': global_keyNOTLIKE,
        if (global_keyLIKE != null) r'global_keyLIKE': global_keyLIKE,
        if (value != null) r'value': value,
        if (valueGT != null) r'valueGT': valueGT,
        if (valueGTE != null) r'valueGTE': valueGTE,
        if (valueLT != null) r'valueLT': valueLT,
        if (valueLTE != null) r'valueLTE': valueLTE,
        if (valueNEQ != null) r'valueNEQ': valueNEQ,
        if (valueEQ != null) r'valueEQ': valueEQ,
        if (valueNOTIN != null) r'valueNOTIN': valueNOTIN,
        if (valueIN != null) r'valueIN': valueIN,
        if (valueNOTLIKE != null) r'valueNOTLIKE': valueNOTLIKE,
        if (valueLIKE != null) r'valueLIKE': valueLIKE,
      });

  Input$checkers_marq_CounterWhereInput._(this._$data);

  factory Input$checkers_marq_CounterWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('global_key')) {
      final l$global_key = data['global_key'];
      result$data['global_key'] = (l$global_key as String?);
    }
    if (data.containsKey('global_keyGT')) {
      final l$global_keyGT = data['global_keyGT'];
      result$data['global_keyGT'] = (l$global_keyGT as String?);
    }
    if (data.containsKey('global_keyGTE')) {
      final l$global_keyGTE = data['global_keyGTE'];
      result$data['global_keyGTE'] = (l$global_keyGTE as String?);
    }
    if (data.containsKey('global_keyLT')) {
      final l$global_keyLT = data['global_keyLT'];
      result$data['global_keyLT'] = (l$global_keyLT as String?);
    }
    if (data.containsKey('global_keyLTE')) {
      final l$global_keyLTE = data['global_keyLTE'];
      result$data['global_keyLTE'] = (l$global_keyLTE as String?);
    }
    if (data.containsKey('global_keyNEQ')) {
      final l$global_keyNEQ = data['global_keyNEQ'];
      result$data['global_keyNEQ'] = (l$global_keyNEQ as String?);
    }
    if (data.containsKey('global_keyEQ')) {
      final l$global_keyEQ = data['global_keyEQ'];
      result$data['global_keyEQ'] = (l$global_keyEQ as String?);
    }
    if (data.containsKey('global_keyNOTIN')) {
      final l$global_keyNOTIN = data['global_keyNOTIN'];
      result$data['global_keyNOTIN'] = (l$global_keyNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('global_keyIN')) {
      final l$global_keyIN = data['global_keyIN'];
      result$data['global_keyIN'] = (l$global_keyIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('global_keyNOTLIKE')) {
      final l$global_keyNOTLIKE = data['global_keyNOTLIKE'];
      result$data['global_keyNOTLIKE'] = (l$global_keyNOTLIKE as String?);
    }
    if (data.containsKey('global_keyLIKE')) {
      final l$global_keyLIKE = data['global_keyLIKE'];
      result$data['global_keyLIKE'] = (l$global_keyLIKE as String?);
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    if (data.containsKey('valueGT')) {
      final l$valueGT = data['valueGT'];
      result$data['valueGT'] = (l$valueGT as String?);
    }
    if (data.containsKey('valueGTE')) {
      final l$valueGTE = data['valueGTE'];
      result$data['valueGTE'] = (l$valueGTE as String?);
    }
    if (data.containsKey('valueLT')) {
      final l$valueLT = data['valueLT'];
      result$data['valueLT'] = (l$valueLT as String?);
    }
    if (data.containsKey('valueLTE')) {
      final l$valueLTE = data['valueLTE'];
      result$data['valueLTE'] = (l$valueLTE as String?);
    }
    if (data.containsKey('valueNEQ')) {
      final l$valueNEQ = data['valueNEQ'];
      result$data['valueNEQ'] = (l$valueNEQ as String?);
    }
    if (data.containsKey('valueEQ')) {
      final l$valueEQ = data['valueEQ'];
      result$data['valueEQ'] = (l$valueEQ as String?);
    }
    if (data.containsKey('valueNOTIN')) {
      final l$valueNOTIN = data['valueNOTIN'];
      result$data['valueNOTIN'] =
          (l$valueNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('valueIN')) {
      final l$valueIN = data['valueIN'];
      result$data['valueIN'] =
          (l$valueIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('valueNOTLIKE')) {
      final l$valueNOTLIKE = data['valueNOTLIKE'];
      result$data['valueNOTLIKE'] = (l$valueNOTLIKE as String?);
    }
    if (data.containsKey('valueLIKE')) {
      final l$valueLIKE = data['valueLIKE'];
      result$data['valueLIKE'] = (l$valueLIKE as String?);
    }
    return Input$checkers_marq_CounterWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get global_key => (_$data['global_key'] as String?);

  String? get global_keyGT => (_$data['global_keyGT'] as String?);

  String? get global_keyGTE => (_$data['global_keyGTE'] as String?);

  String? get global_keyLT => (_$data['global_keyLT'] as String?);

  String? get global_keyLTE => (_$data['global_keyLTE'] as String?);

  String? get global_keyNEQ => (_$data['global_keyNEQ'] as String?);

  String? get global_keyEQ => (_$data['global_keyEQ'] as String?);

  List<String?>? get global_keyNOTIN =>
      (_$data['global_keyNOTIN'] as List<String?>?);

  List<String?>? get global_keyIN => (_$data['global_keyIN'] as List<String?>?);

  String? get global_keyNOTLIKE => (_$data['global_keyNOTLIKE'] as String?);

  String? get global_keyLIKE => (_$data['global_keyLIKE'] as String?);

  String? get value => (_$data['value'] as String?);

  String? get valueGT => (_$data['valueGT'] as String?);

  String? get valueGTE => (_$data['valueGTE'] as String?);

  String? get valueLT => (_$data['valueLT'] as String?);

  String? get valueLTE => (_$data['valueLTE'] as String?);

  String? get valueNEQ => (_$data['valueNEQ'] as String?);

  String? get valueEQ => (_$data['valueEQ'] as String?);

  List<String?>? get valueNOTIN => (_$data['valueNOTIN'] as List<String?>?);

  List<String?>? get valueIN => (_$data['valueIN'] as List<String?>?);

  String? get valueNOTLIKE => (_$data['valueNOTLIKE'] as String?);

  String? get valueLIKE => (_$data['valueLIKE'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('global_key')) {
      final l$global_key = global_key;
      result$data['global_key'] = l$global_key;
    }
    if (_$data.containsKey('global_keyGT')) {
      final l$global_keyGT = global_keyGT;
      result$data['global_keyGT'] = l$global_keyGT;
    }
    if (_$data.containsKey('global_keyGTE')) {
      final l$global_keyGTE = global_keyGTE;
      result$data['global_keyGTE'] = l$global_keyGTE;
    }
    if (_$data.containsKey('global_keyLT')) {
      final l$global_keyLT = global_keyLT;
      result$data['global_keyLT'] = l$global_keyLT;
    }
    if (_$data.containsKey('global_keyLTE')) {
      final l$global_keyLTE = global_keyLTE;
      result$data['global_keyLTE'] = l$global_keyLTE;
    }
    if (_$data.containsKey('global_keyNEQ')) {
      final l$global_keyNEQ = global_keyNEQ;
      result$data['global_keyNEQ'] = l$global_keyNEQ;
    }
    if (_$data.containsKey('global_keyEQ')) {
      final l$global_keyEQ = global_keyEQ;
      result$data['global_keyEQ'] = l$global_keyEQ;
    }
    if (_$data.containsKey('global_keyNOTIN')) {
      final l$global_keyNOTIN = global_keyNOTIN;
      result$data['global_keyNOTIN'] =
          l$global_keyNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('global_keyIN')) {
      final l$global_keyIN = global_keyIN;
      result$data['global_keyIN'] = l$global_keyIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('global_keyNOTLIKE')) {
      final l$global_keyNOTLIKE = global_keyNOTLIKE;
      result$data['global_keyNOTLIKE'] = l$global_keyNOTLIKE;
    }
    if (_$data.containsKey('global_keyLIKE')) {
      final l$global_keyLIKE = global_keyLIKE;
      result$data['global_keyLIKE'] = l$global_keyLIKE;
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    if (_$data.containsKey('valueGT')) {
      final l$valueGT = valueGT;
      result$data['valueGT'] = l$valueGT;
    }
    if (_$data.containsKey('valueGTE')) {
      final l$valueGTE = valueGTE;
      result$data['valueGTE'] = l$valueGTE;
    }
    if (_$data.containsKey('valueLT')) {
      final l$valueLT = valueLT;
      result$data['valueLT'] = l$valueLT;
    }
    if (_$data.containsKey('valueLTE')) {
      final l$valueLTE = valueLTE;
      result$data['valueLTE'] = l$valueLTE;
    }
    if (_$data.containsKey('valueNEQ')) {
      final l$valueNEQ = valueNEQ;
      result$data['valueNEQ'] = l$valueNEQ;
    }
    if (_$data.containsKey('valueEQ')) {
      final l$valueEQ = valueEQ;
      result$data['valueEQ'] = l$valueEQ;
    }
    if (_$data.containsKey('valueNOTIN')) {
      final l$valueNOTIN = valueNOTIN;
      result$data['valueNOTIN'] = l$valueNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('valueIN')) {
      final l$valueIN = valueIN;
      result$data['valueIN'] = l$valueIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('valueNOTLIKE')) {
      final l$valueNOTLIKE = valueNOTLIKE;
      result$data['valueNOTLIKE'] = l$valueNOTLIKE;
    }
    if (_$data.containsKey('valueLIKE')) {
      final l$valueLIKE = valueLIKE;
      result$data['valueLIKE'] = l$valueLIKE;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_CounterWhereInput<
          Input$checkers_marq_CounterWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_CounterWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_CounterWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$global_key = global_key;
    final lOther$global_key = other.global_key;
    if (_$data.containsKey('global_key') !=
        other._$data.containsKey('global_key')) {
      return false;
    }
    if (l$global_key != lOther$global_key) {
      return false;
    }
    final l$global_keyGT = global_keyGT;
    final lOther$global_keyGT = other.global_keyGT;
    if (_$data.containsKey('global_keyGT') !=
        other._$data.containsKey('global_keyGT')) {
      return false;
    }
    if (l$global_keyGT != lOther$global_keyGT) {
      return false;
    }
    final l$global_keyGTE = global_keyGTE;
    final lOther$global_keyGTE = other.global_keyGTE;
    if (_$data.containsKey('global_keyGTE') !=
        other._$data.containsKey('global_keyGTE')) {
      return false;
    }
    if (l$global_keyGTE != lOther$global_keyGTE) {
      return false;
    }
    final l$global_keyLT = global_keyLT;
    final lOther$global_keyLT = other.global_keyLT;
    if (_$data.containsKey('global_keyLT') !=
        other._$data.containsKey('global_keyLT')) {
      return false;
    }
    if (l$global_keyLT != lOther$global_keyLT) {
      return false;
    }
    final l$global_keyLTE = global_keyLTE;
    final lOther$global_keyLTE = other.global_keyLTE;
    if (_$data.containsKey('global_keyLTE') !=
        other._$data.containsKey('global_keyLTE')) {
      return false;
    }
    if (l$global_keyLTE != lOther$global_keyLTE) {
      return false;
    }
    final l$global_keyNEQ = global_keyNEQ;
    final lOther$global_keyNEQ = other.global_keyNEQ;
    if (_$data.containsKey('global_keyNEQ') !=
        other._$data.containsKey('global_keyNEQ')) {
      return false;
    }
    if (l$global_keyNEQ != lOther$global_keyNEQ) {
      return false;
    }
    final l$global_keyEQ = global_keyEQ;
    final lOther$global_keyEQ = other.global_keyEQ;
    if (_$data.containsKey('global_keyEQ') !=
        other._$data.containsKey('global_keyEQ')) {
      return false;
    }
    if (l$global_keyEQ != lOther$global_keyEQ) {
      return false;
    }
    final l$global_keyNOTIN = global_keyNOTIN;
    final lOther$global_keyNOTIN = other.global_keyNOTIN;
    if (_$data.containsKey('global_keyNOTIN') !=
        other._$data.containsKey('global_keyNOTIN')) {
      return false;
    }
    if (l$global_keyNOTIN != null && lOther$global_keyNOTIN != null) {
      if (l$global_keyNOTIN.length != lOther$global_keyNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$global_keyNOTIN.length; i++) {
        final l$global_keyNOTIN$entry = l$global_keyNOTIN[i];
        final lOther$global_keyNOTIN$entry = lOther$global_keyNOTIN[i];
        if (l$global_keyNOTIN$entry != lOther$global_keyNOTIN$entry) {
          return false;
        }
      }
    } else if (l$global_keyNOTIN != lOther$global_keyNOTIN) {
      return false;
    }
    final l$global_keyIN = global_keyIN;
    final lOther$global_keyIN = other.global_keyIN;
    if (_$data.containsKey('global_keyIN') !=
        other._$data.containsKey('global_keyIN')) {
      return false;
    }
    if (l$global_keyIN != null && lOther$global_keyIN != null) {
      if (l$global_keyIN.length != lOther$global_keyIN.length) {
        return false;
      }
      for (int i = 0; i < l$global_keyIN.length; i++) {
        final l$global_keyIN$entry = l$global_keyIN[i];
        final lOther$global_keyIN$entry = lOther$global_keyIN[i];
        if (l$global_keyIN$entry != lOther$global_keyIN$entry) {
          return false;
        }
      }
    } else if (l$global_keyIN != lOther$global_keyIN) {
      return false;
    }
    final l$global_keyNOTLIKE = global_keyNOTLIKE;
    final lOther$global_keyNOTLIKE = other.global_keyNOTLIKE;
    if (_$data.containsKey('global_keyNOTLIKE') !=
        other._$data.containsKey('global_keyNOTLIKE')) {
      return false;
    }
    if (l$global_keyNOTLIKE != lOther$global_keyNOTLIKE) {
      return false;
    }
    final l$global_keyLIKE = global_keyLIKE;
    final lOther$global_keyLIKE = other.global_keyLIKE;
    if (_$data.containsKey('global_keyLIKE') !=
        other._$data.containsKey('global_keyLIKE')) {
      return false;
    }
    if (l$global_keyLIKE != lOther$global_keyLIKE) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    final l$valueGT = valueGT;
    final lOther$valueGT = other.valueGT;
    if (_$data.containsKey('valueGT') != other._$data.containsKey('valueGT')) {
      return false;
    }
    if (l$valueGT != lOther$valueGT) {
      return false;
    }
    final l$valueGTE = valueGTE;
    final lOther$valueGTE = other.valueGTE;
    if (_$data.containsKey('valueGTE') !=
        other._$data.containsKey('valueGTE')) {
      return false;
    }
    if (l$valueGTE != lOther$valueGTE) {
      return false;
    }
    final l$valueLT = valueLT;
    final lOther$valueLT = other.valueLT;
    if (_$data.containsKey('valueLT') != other._$data.containsKey('valueLT')) {
      return false;
    }
    if (l$valueLT != lOther$valueLT) {
      return false;
    }
    final l$valueLTE = valueLTE;
    final lOther$valueLTE = other.valueLTE;
    if (_$data.containsKey('valueLTE') !=
        other._$data.containsKey('valueLTE')) {
      return false;
    }
    if (l$valueLTE != lOther$valueLTE) {
      return false;
    }
    final l$valueNEQ = valueNEQ;
    final lOther$valueNEQ = other.valueNEQ;
    if (_$data.containsKey('valueNEQ') !=
        other._$data.containsKey('valueNEQ')) {
      return false;
    }
    if (l$valueNEQ != lOther$valueNEQ) {
      return false;
    }
    final l$valueEQ = valueEQ;
    final lOther$valueEQ = other.valueEQ;
    if (_$data.containsKey('valueEQ') != other._$data.containsKey('valueEQ')) {
      return false;
    }
    if (l$valueEQ != lOther$valueEQ) {
      return false;
    }
    final l$valueNOTIN = valueNOTIN;
    final lOther$valueNOTIN = other.valueNOTIN;
    if (_$data.containsKey('valueNOTIN') !=
        other._$data.containsKey('valueNOTIN')) {
      return false;
    }
    if (l$valueNOTIN != null && lOther$valueNOTIN != null) {
      if (l$valueNOTIN.length != lOther$valueNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$valueNOTIN.length; i++) {
        final l$valueNOTIN$entry = l$valueNOTIN[i];
        final lOther$valueNOTIN$entry = lOther$valueNOTIN[i];
        if (l$valueNOTIN$entry != lOther$valueNOTIN$entry) {
          return false;
        }
      }
    } else if (l$valueNOTIN != lOther$valueNOTIN) {
      return false;
    }
    final l$valueIN = valueIN;
    final lOther$valueIN = other.valueIN;
    if (_$data.containsKey('valueIN') != other._$data.containsKey('valueIN')) {
      return false;
    }
    if (l$valueIN != null && lOther$valueIN != null) {
      if (l$valueIN.length != lOther$valueIN.length) {
        return false;
      }
      for (int i = 0; i < l$valueIN.length; i++) {
        final l$valueIN$entry = l$valueIN[i];
        final lOther$valueIN$entry = lOther$valueIN[i];
        if (l$valueIN$entry != lOther$valueIN$entry) {
          return false;
        }
      }
    } else if (l$valueIN != lOther$valueIN) {
      return false;
    }
    final l$valueNOTLIKE = valueNOTLIKE;
    final lOther$valueNOTLIKE = other.valueNOTLIKE;
    if (_$data.containsKey('valueNOTLIKE') !=
        other._$data.containsKey('valueNOTLIKE')) {
      return false;
    }
    if (l$valueNOTLIKE != lOther$valueNOTLIKE) {
      return false;
    }
    final l$valueLIKE = valueLIKE;
    final lOther$valueLIKE = other.valueLIKE;
    if (_$data.containsKey('valueLIKE') !=
        other._$data.containsKey('valueLIKE')) {
      return false;
    }
    if (l$valueLIKE != lOther$valueLIKE) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$global_key = global_key;
    final l$global_keyGT = global_keyGT;
    final l$global_keyGTE = global_keyGTE;
    final l$global_keyLT = global_keyLT;
    final l$global_keyLTE = global_keyLTE;
    final l$global_keyNEQ = global_keyNEQ;
    final l$global_keyEQ = global_keyEQ;
    final l$global_keyNOTIN = global_keyNOTIN;
    final l$global_keyIN = global_keyIN;
    final l$global_keyNOTLIKE = global_keyNOTLIKE;
    final l$global_keyLIKE = global_keyLIKE;
    final l$value = value;
    final l$valueGT = valueGT;
    final l$valueGTE = valueGTE;
    final l$valueLT = valueLT;
    final l$valueLTE = valueLTE;
    final l$valueNEQ = valueNEQ;
    final l$valueEQ = valueEQ;
    final l$valueNOTIN = valueNOTIN;
    final l$valueIN = valueIN;
    final l$valueNOTLIKE = valueNOTLIKE;
    final l$valueLIKE = valueLIKE;
    return Object.hashAll([
      _$data.containsKey('global_key') ? l$global_key : const {},
      _$data.containsKey('global_keyGT') ? l$global_keyGT : const {},
      _$data.containsKey('global_keyGTE') ? l$global_keyGTE : const {},
      _$data.containsKey('global_keyLT') ? l$global_keyLT : const {},
      _$data.containsKey('global_keyLTE') ? l$global_keyLTE : const {},
      _$data.containsKey('global_keyNEQ') ? l$global_keyNEQ : const {},
      _$data.containsKey('global_keyEQ') ? l$global_keyEQ : const {},
      _$data.containsKey('global_keyNOTIN')
          ? l$global_keyNOTIN == null
              ? null
              : Object.hashAll(l$global_keyNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('global_keyIN')
          ? l$global_keyIN == null
              ? null
              : Object.hashAll(l$global_keyIN.map((v) => v))
          : const {},
      _$data.containsKey('global_keyNOTLIKE') ? l$global_keyNOTLIKE : const {},
      _$data.containsKey('global_keyLIKE') ? l$global_keyLIKE : const {},
      _$data.containsKey('value') ? l$value : const {},
      _$data.containsKey('valueGT') ? l$valueGT : const {},
      _$data.containsKey('valueGTE') ? l$valueGTE : const {},
      _$data.containsKey('valueLT') ? l$valueLT : const {},
      _$data.containsKey('valueLTE') ? l$valueLTE : const {},
      _$data.containsKey('valueNEQ') ? l$valueNEQ : const {},
      _$data.containsKey('valueEQ') ? l$valueEQ : const {},
      _$data.containsKey('valueNOTIN')
          ? l$valueNOTIN == null
              ? null
              : Object.hashAll(l$valueNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('valueIN')
          ? l$valueIN == null
              ? null
              : Object.hashAll(l$valueIN.map((v) => v))
          : const {},
      _$data.containsKey('valueNOTLIKE') ? l$valueNOTLIKE : const {},
      _$data.containsKey('valueLIKE') ? l$valueLIKE : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_CounterWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_CounterWhereInput(
    Input$checkers_marq_CounterWhereInput instance,
    TRes Function(Input$checkers_marq_CounterWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_CounterWhereInput;

  factory CopyWith$Input$checkers_marq_CounterWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_CounterWhereInput;

  TRes call({
    String? global_key,
    String? global_keyGT,
    String? global_keyGTE,
    String? global_keyLT,
    String? global_keyLTE,
    String? global_keyNEQ,
    String? global_keyEQ,
    List<String?>? global_keyNOTIN,
    List<String?>? global_keyIN,
    String? global_keyNOTLIKE,
    String? global_keyLIKE,
    String? value,
    String? valueGT,
    String? valueGTE,
    String? valueLT,
    String? valueLTE,
    String? valueNEQ,
    String? valueEQ,
    List<String?>? valueNOTIN,
    List<String?>? valueIN,
    String? valueNOTLIKE,
    String? valueLIKE,
  });
}

class _CopyWithImpl$Input$checkers_marq_CounterWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_CounterWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_CounterWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_CounterWhereInput _instance;

  final TRes Function(Input$checkers_marq_CounterWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? global_key = _undefined,
    Object? global_keyGT = _undefined,
    Object? global_keyGTE = _undefined,
    Object? global_keyLT = _undefined,
    Object? global_keyLTE = _undefined,
    Object? global_keyNEQ = _undefined,
    Object? global_keyEQ = _undefined,
    Object? global_keyNOTIN = _undefined,
    Object? global_keyIN = _undefined,
    Object? global_keyNOTLIKE = _undefined,
    Object? global_keyLIKE = _undefined,
    Object? value = _undefined,
    Object? valueGT = _undefined,
    Object? valueGTE = _undefined,
    Object? valueLT = _undefined,
    Object? valueLTE = _undefined,
    Object? valueNEQ = _undefined,
    Object? valueEQ = _undefined,
    Object? valueNOTIN = _undefined,
    Object? valueIN = _undefined,
    Object? valueNOTLIKE = _undefined,
    Object? valueLIKE = _undefined,
  }) =>
      _then(Input$checkers_marq_CounterWhereInput._({
        ..._instance._$data,
        if (global_key != _undefined) 'global_key': (global_key as String?),
        if (global_keyGT != _undefined)
          'global_keyGT': (global_keyGT as String?),
        if (global_keyGTE != _undefined)
          'global_keyGTE': (global_keyGTE as String?),
        if (global_keyLT != _undefined)
          'global_keyLT': (global_keyLT as String?),
        if (global_keyLTE != _undefined)
          'global_keyLTE': (global_keyLTE as String?),
        if (global_keyNEQ != _undefined)
          'global_keyNEQ': (global_keyNEQ as String?),
        if (global_keyEQ != _undefined)
          'global_keyEQ': (global_keyEQ as String?),
        if (global_keyNOTIN != _undefined)
          'global_keyNOTIN': (global_keyNOTIN as List<String?>?),
        if (global_keyIN != _undefined)
          'global_keyIN': (global_keyIN as List<String?>?),
        if (global_keyNOTLIKE != _undefined)
          'global_keyNOTLIKE': (global_keyNOTLIKE as String?),
        if (global_keyLIKE != _undefined)
          'global_keyLIKE': (global_keyLIKE as String?),
        if (value != _undefined) 'value': (value as String?),
        if (valueGT != _undefined) 'valueGT': (valueGT as String?),
        if (valueGTE != _undefined) 'valueGTE': (valueGTE as String?),
        if (valueLT != _undefined) 'valueLT': (valueLT as String?),
        if (valueLTE != _undefined) 'valueLTE': (valueLTE as String?),
        if (valueNEQ != _undefined) 'valueNEQ': (valueNEQ as String?),
        if (valueEQ != _undefined) 'valueEQ': (valueEQ as String?),
        if (valueNOTIN != _undefined)
          'valueNOTIN': (valueNOTIN as List<String?>?),
        if (valueIN != _undefined) 'valueIN': (valueIN as List<String?>?),
        if (valueNOTLIKE != _undefined)
          'valueNOTLIKE': (valueNOTLIKE as String?),
        if (valueLIKE != _undefined) 'valueLIKE': (valueLIKE as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_CounterWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_CounterWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_CounterWhereInput(this._res);

  TRes _res;

  call({
    String? global_key,
    String? global_keyGT,
    String? global_keyGTE,
    String? global_keyLT,
    String? global_keyLTE,
    String? global_keyNEQ,
    String? global_keyEQ,
    List<String?>? global_keyNOTIN,
    List<String?>? global_keyIN,
    String? global_keyNOTLIKE,
    String? global_keyLIKE,
    String? value,
    String? valueGT,
    String? valueGTE,
    String? valueLT,
    String? valueLTE,
    String? valueNEQ,
    String? valueEQ,
    List<String?>? valueNOTIN,
    List<String?>? valueIN,
    String? valueNOTLIKE,
    String? valueLIKE,
  }) =>
      _res;
}

class Input$checkers_marq_KilledOrder {
  factory Input$checkers_marq_KilledOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_KilledOrderField field,
  }) =>
      Input$checkers_marq_KilledOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_KilledOrder._(this._$data);

  factory Input$checkers_marq_KilledOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_KilledOrderField((l$field as String));
    return Input$checkers_marq_KilledOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_KilledOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_KilledOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_KilledOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_KilledOrder<Input$checkers_marq_KilledOrder>
      get copyWith => CopyWith$Input$checkers_marq_KilledOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_KilledOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_KilledOrder<TRes> {
  factory CopyWith$Input$checkers_marq_KilledOrder(
    Input$checkers_marq_KilledOrder instance,
    TRes Function(Input$checkers_marq_KilledOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_KilledOrder;

  factory CopyWith$Input$checkers_marq_KilledOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_KilledOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_KilledOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_KilledOrder<TRes>
    implements CopyWith$Input$checkers_marq_KilledOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_KilledOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_KilledOrder _instance;

  final TRes Function(Input$checkers_marq_KilledOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_KilledOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_KilledOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_KilledOrder<TRes>
    implements CopyWith$Input$checkers_marq_KilledOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_KilledOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_KilledOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_KilledWhereInput {
  factory Input$checkers_marq_KilledWhereInput({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  }) =>
      Input$checkers_marq_KilledWhereInput._({
        if (session_id != null) r'session_id': session_id,
        if (session_idGT != null) r'session_idGT': session_idGT,
        if (session_idGTE != null) r'session_idGTE': session_idGTE,
        if (session_idLT != null) r'session_idLT': session_idLT,
        if (session_idLTE != null) r'session_idLTE': session_idLTE,
        if (session_idNEQ != null) r'session_idNEQ': session_idNEQ,
        if (session_idEQ != null) r'session_idEQ': session_idEQ,
        if (session_idNOTIN != null) r'session_idNOTIN': session_idNOTIN,
        if (session_idIN != null) r'session_idIN': session_idIN,
        if (session_idNOTLIKE != null) r'session_idNOTLIKE': session_idNOTLIKE,
        if (session_idLIKE != null) r'session_idLIKE': session_idLIKE,
        if (player != null) r'player': player,
        if (playerGT != null) r'playerGT': playerGT,
        if (playerGTE != null) r'playerGTE': playerGTE,
        if (playerLT != null) r'playerLT': playerLT,
        if (playerLTE != null) r'playerLTE': playerLTE,
        if (playerNEQ != null) r'playerNEQ': playerNEQ,
        if (playerEQ != null) r'playerEQ': playerEQ,
        if (playerNOTIN != null) r'playerNOTIN': playerNOTIN,
        if (playerIN != null) r'playerIN': playerIN,
        if (playerNOTLIKE != null) r'playerNOTLIKE': playerNOTLIKE,
        if (playerLIKE != null) r'playerLIKE': playerLIKE,
        if (row != null) r'row': row,
        if (rowGT != null) r'rowGT': rowGT,
        if (rowGTE != null) r'rowGTE': rowGTE,
        if (rowLT != null) r'rowLT': rowLT,
        if (rowLTE != null) r'rowLTE': rowLTE,
        if (rowNEQ != null) r'rowNEQ': rowNEQ,
        if (rowEQ != null) r'rowEQ': rowEQ,
        if (rowNOTIN != null) r'rowNOTIN': rowNOTIN,
        if (rowIN != null) r'rowIN': rowIN,
        if (rowNOTLIKE != null) r'rowNOTLIKE': rowNOTLIKE,
        if (rowLIKE != null) r'rowLIKE': rowLIKE,
        if (col != null) r'col': col,
        if (colGT != null) r'colGT': colGT,
        if (colGTE != null) r'colGTE': colGTE,
        if (colLT != null) r'colLT': colLT,
        if (colLTE != null) r'colLTE': colLTE,
        if (colNEQ != null) r'colNEQ': colNEQ,
        if (colEQ != null) r'colEQ': colEQ,
        if (colNOTIN != null) r'colNOTIN': colNOTIN,
        if (colIN != null) r'colIN': colIN,
        if (colNOTLIKE != null) r'colNOTLIKE': colNOTLIKE,
        if (colLIKE != null) r'colLIKE': colLIKE,
      });

  Input$checkers_marq_KilledWhereInput._(this._$data);

  factory Input$checkers_marq_KilledWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('session_id')) {
      final l$session_id = data['session_id'];
      result$data['session_id'] = (l$session_id as String?);
    }
    if (data.containsKey('session_idGT')) {
      final l$session_idGT = data['session_idGT'];
      result$data['session_idGT'] = (l$session_idGT as String?);
    }
    if (data.containsKey('session_idGTE')) {
      final l$session_idGTE = data['session_idGTE'];
      result$data['session_idGTE'] = (l$session_idGTE as String?);
    }
    if (data.containsKey('session_idLT')) {
      final l$session_idLT = data['session_idLT'];
      result$data['session_idLT'] = (l$session_idLT as String?);
    }
    if (data.containsKey('session_idLTE')) {
      final l$session_idLTE = data['session_idLTE'];
      result$data['session_idLTE'] = (l$session_idLTE as String?);
    }
    if (data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = data['session_idNEQ'];
      result$data['session_idNEQ'] = (l$session_idNEQ as String?);
    }
    if (data.containsKey('session_idEQ')) {
      final l$session_idEQ = data['session_idEQ'];
      result$data['session_idEQ'] = (l$session_idEQ as String?);
    }
    if (data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = data['session_idNOTIN'];
      result$data['session_idNOTIN'] = (l$session_idNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idIN')) {
      final l$session_idIN = data['session_idIN'];
      result$data['session_idIN'] = (l$session_idIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = data['session_idNOTLIKE'];
      result$data['session_idNOTLIKE'] = (l$session_idNOTLIKE as String?);
    }
    if (data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = data['session_idLIKE'];
      result$data['session_idLIKE'] = (l$session_idLIKE as String?);
    }
    if (data.containsKey('player')) {
      final l$player = data['player'];
      result$data['player'] = (l$player as String?);
    }
    if (data.containsKey('playerGT')) {
      final l$playerGT = data['playerGT'];
      result$data['playerGT'] = (l$playerGT as String?);
    }
    if (data.containsKey('playerGTE')) {
      final l$playerGTE = data['playerGTE'];
      result$data['playerGTE'] = (l$playerGTE as String?);
    }
    if (data.containsKey('playerLT')) {
      final l$playerLT = data['playerLT'];
      result$data['playerLT'] = (l$playerLT as String?);
    }
    if (data.containsKey('playerLTE')) {
      final l$playerLTE = data['playerLTE'];
      result$data['playerLTE'] = (l$playerLTE as String?);
    }
    if (data.containsKey('playerNEQ')) {
      final l$playerNEQ = data['playerNEQ'];
      result$data['playerNEQ'] = (l$playerNEQ as String?);
    }
    if (data.containsKey('playerEQ')) {
      final l$playerEQ = data['playerEQ'];
      result$data['playerEQ'] = (l$playerEQ as String?);
    }
    if (data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = data['playerNOTIN'];
      result$data['playerNOTIN'] = (l$playerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('playerIN')) {
      final l$playerIN = data['playerIN'];
      result$data['playerIN'] =
          (l$playerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = data['playerNOTLIKE'];
      result$data['playerNOTLIKE'] = (l$playerNOTLIKE as String?);
    }
    if (data.containsKey('playerLIKE')) {
      final l$playerLIKE = data['playerLIKE'];
      result$data['playerLIKE'] = (l$playerLIKE as String?);
    }
    if (data.containsKey('row')) {
      final l$row = data['row'];
      result$data['row'] = (l$row as String?);
    }
    if (data.containsKey('rowGT')) {
      final l$rowGT = data['rowGT'];
      result$data['rowGT'] = (l$rowGT as String?);
    }
    if (data.containsKey('rowGTE')) {
      final l$rowGTE = data['rowGTE'];
      result$data['rowGTE'] = (l$rowGTE as String?);
    }
    if (data.containsKey('rowLT')) {
      final l$rowLT = data['rowLT'];
      result$data['rowLT'] = (l$rowLT as String?);
    }
    if (data.containsKey('rowLTE')) {
      final l$rowLTE = data['rowLTE'];
      result$data['rowLTE'] = (l$rowLTE as String?);
    }
    if (data.containsKey('rowNEQ')) {
      final l$rowNEQ = data['rowNEQ'];
      result$data['rowNEQ'] = (l$rowNEQ as String?);
    }
    if (data.containsKey('rowEQ')) {
      final l$rowEQ = data['rowEQ'];
      result$data['rowEQ'] = (l$rowEQ as String?);
    }
    if (data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = data['rowNOTIN'];
      result$data['rowNOTIN'] =
          (l$rowNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowIN')) {
      final l$rowIN = data['rowIN'];
      result$data['rowIN'] =
          (l$rowIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = data['rowNOTLIKE'];
      result$data['rowNOTLIKE'] = (l$rowNOTLIKE as String?);
    }
    if (data.containsKey('rowLIKE')) {
      final l$rowLIKE = data['rowLIKE'];
      result$data['rowLIKE'] = (l$rowLIKE as String?);
    }
    if (data.containsKey('col')) {
      final l$col = data['col'];
      result$data['col'] = (l$col as String?);
    }
    if (data.containsKey('colGT')) {
      final l$colGT = data['colGT'];
      result$data['colGT'] = (l$colGT as String?);
    }
    if (data.containsKey('colGTE')) {
      final l$colGTE = data['colGTE'];
      result$data['colGTE'] = (l$colGTE as String?);
    }
    if (data.containsKey('colLT')) {
      final l$colLT = data['colLT'];
      result$data['colLT'] = (l$colLT as String?);
    }
    if (data.containsKey('colLTE')) {
      final l$colLTE = data['colLTE'];
      result$data['colLTE'] = (l$colLTE as String?);
    }
    if (data.containsKey('colNEQ')) {
      final l$colNEQ = data['colNEQ'];
      result$data['colNEQ'] = (l$colNEQ as String?);
    }
    if (data.containsKey('colEQ')) {
      final l$colEQ = data['colEQ'];
      result$data['colEQ'] = (l$colEQ as String?);
    }
    if (data.containsKey('colNOTIN')) {
      final l$colNOTIN = data['colNOTIN'];
      result$data['colNOTIN'] =
          (l$colNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colIN')) {
      final l$colIN = data['colIN'];
      result$data['colIN'] =
          (l$colIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = data['colNOTLIKE'];
      result$data['colNOTLIKE'] = (l$colNOTLIKE as String?);
    }
    if (data.containsKey('colLIKE')) {
      final l$colLIKE = data['colLIKE'];
      result$data['colLIKE'] = (l$colLIKE as String?);
    }
    return Input$checkers_marq_KilledWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get session_id => (_$data['session_id'] as String?);

  String? get session_idGT => (_$data['session_idGT'] as String?);

  String? get session_idGTE => (_$data['session_idGTE'] as String?);

  String? get session_idLT => (_$data['session_idLT'] as String?);

  String? get session_idLTE => (_$data['session_idLTE'] as String?);

  String? get session_idNEQ => (_$data['session_idNEQ'] as String?);

  String? get session_idEQ => (_$data['session_idEQ'] as String?);

  List<String?>? get session_idNOTIN =>
      (_$data['session_idNOTIN'] as List<String?>?);

  List<String?>? get session_idIN => (_$data['session_idIN'] as List<String?>?);

  String? get session_idNOTLIKE => (_$data['session_idNOTLIKE'] as String?);

  String? get session_idLIKE => (_$data['session_idLIKE'] as String?);

  String? get player => (_$data['player'] as String?);

  String? get playerGT => (_$data['playerGT'] as String?);

  String? get playerGTE => (_$data['playerGTE'] as String?);

  String? get playerLT => (_$data['playerLT'] as String?);

  String? get playerLTE => (_$data['playerLTE'] as String?);

  String? get playerNEQ => (_$data['playerNEQ'] as String?);

  String? get playerEQ => (_$data['playerEQ'] as String?);

  List<String?>? get playerNOTIN => (_$data['playerNOTIN'] as List<String?>?);

  List<String?>? get playerIN => (_$data['playerIN'] as List<String?>?);

  String? get playerNOTLIKE => (_$data['playerNOTLIKE'] as String?);

  String? get playerLIKE => (_$data['playerLIKE'] as String?);

  String? get row => (_$data['row'] as String?);

  String? get rowGT => (_$data['rowGT'] as String?);

  String? get rowGTE => (_$data['rowGTE'] as String?);

  String? get rowLT => (_$data['rowLT'] as String?);

  String? get rowLTE => (_$data['rowLTE'] as String?);

  String? get rowNEQ => (_$data['rowNEQ'] as String?);

  String? get rowEQ => (_$data['rowEQ'] as String?);

  List<String?>? get rowNOTIN => (_$data['rowNOTIN'] as List<String?>?);

  List<String?>? get rowIN => (_$data['rowIN'] as List<String?>?);

  String? get rowNOTLIKE => (_$data['rowNOTLIKE'] as String?);

  String? get rowLIKE => (_$data['rowLIKE'] as String?);

  String? get col => (_$data['col'] as String?);

  String? get colGT => (_$data['colGT'] as String?);

  String? get colGTE => (_$data['colGTE'] as String?);

  String? get colLT => (_$data['colLT'] as String?);

  String? get colLTE => (_$data['colLTE'] as String?);

  String? get colNEQ => (_$data['colNEQ'] as String?);

  String? get colEQ => (_$data['colEQ'] as String?);

  List<String?>? get colNOTIN => (_$data['colNOTIN'] as List<String?>?);

  List<String?>? get colIN => (_$data['colIN'] as List<String?>?);

  String? get colNOTLIKE => (_$data['colNOTLIKE'] as String?);

  String? get colLIKE => (_$data['colLIKE'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('session_id')) {
      final l$session_id = session_id;
      result$data['session_id'] = l$session_id;
    }
    if (_$data.containsKey('session_idGT')) {
      final l$session_idGT = session_idGT;
      result$data['session_idGT'] = l$session_idGT;
    }
    if (_$data.containsKey('session_idGTE')) {
      final l$session_idGTE = session_idGTE;
      result$data['session_idGTE'] = l$session_idGTE;
    }
    if (_$data.containsKey('session_idLT')) {
      final l$session_idLT = session_idLT;
      result$data['session_idLT'] = l$session_idLT;
    }
    if (_$data.containsKey('session_idLTE')) {
      final l$session_idLTE = session_idLTE;
      result$data['session_idLTE'] = l$session_idLTE;
    }
    if (_$data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = session_idNEQ;
      result$data['session_idNEQ'] = l$session_idNEQ;
    }
    if (_$data.containsKey('session_idEQ')) {
      final l$session_idEQ = session_idEQ;
      result$data['session_idEQ'] = l$session_idEQ;
    }
    if (_$data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = session_idNOTIN;
      result$data['session_idNOTIN'] =
          l$session_idNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idIN')) {
      final l$session_idIN = session_idIN;
      result$data['session_idIN'] = l$session_idIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = session_idNOTLIKE;
      result$data['session_idNOTLIKE'] = l$session_idNOTLIKE;
    }
    if (_$data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = session_idLIKE;
      result$data['session_idLIKE'] = l$session_idLIKE;
    }
    if (_$data.containsKey('player')) {
      final l$player = player;
      result$data['player'] = l$player;
    }
    if (_$data.containsKey('playerGT')) {
      final l$playerGT = playerGT;
      result$data['playerGT'] = l$playerGT;
    }
    if (_$data.containsKey('playerGTE')) {
      final l$playerGTE = playerGTE;
      result$data['playerGTE'] = l$playerGTE;
    }
    if (_$data.containsKey('playerLT')) {
      final l$playerLT = playerLT;
      result$data['playerLT'] = l$playerLT;
    }
    if (_$data.containsKey('playerLTE')) {
      final l$playerLTE = playerLTE;
      result$data['playerLTE'] = l$playerLTE;
    }
    if (_$data.containsKey('playerNEQ')) {
      final l$playerNEQ = playerNEQ;
      result$data['playerNEQ'] = l$playerNEQ;
    }
    if (_$data.containsKey('playerEQ')) {
      final l$playerEQ = playerEQ;
      result$data['playerEQ'] = l$playerEQ;
    }
    if (_$data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = playerNOTIN;
      result$data['playerNOTIN'] = l$playerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerIN')) {
      final l$playerIN = playerIN;
      result$data['playerIN'] = l$playerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = playerNOTLIKE;
      result$data['playerNOTLIKE'] = l$playerNOTLIKE;
    }
    if (_$data.containsKey('playerLIKE')) {
      final l$playerLIKE = playerLIKE;
      result$data['playerLIKE'] = l$playerLIKE;
    }
    if (_$data.containsKey('row')) {
      final l$row = row;
      result$data['row'] = l$row;
    }
    if (_$data.containsKey('rowGT')) {
      final l$rowGT = rowGT;
      result$data['rowGT'] = l$rowGT;
    }
    if (_$data.containsKey('rowGTE')) {
      final l$rowGTE = rowGTE;
      result$data['rowGTE'] = l$rowGTE;
    }
    if (_$data.containsKey('rowLT')) {
      final l$rowLT = rowLT;
      result$data['rowLT'] = l$rowLT;
    }
    if (_$data.containsKey('rowLTE')) {
      final l$rowLTE = rowLTE;
      result$data['rowLTE'] = l$rowLTE;
    }
    if (_$data.containsKey('rowNEQ')) {
      final l$rowNEQ = rowNEQ;
      result$data['rowNEQ'] = l$rowNEQ;
    }
    if (_$data.containsKey('rowEQ')) {
      final l$rowEQ = rowEQ;
      result$data['rowEQ'] = l$rowEQ;
    }
    if (_$data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = rowNOTIN;
      result$data['rowNOTIN'] = l$rowNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowIN')) {
      final l$rowIN = rowIN;
      result$data['rowIN'] = l$rowIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = rowNOTLIKE;
      result$data['rowNOTLIKE'] = l$rowNOTLIKE;
    }
    if (_$data.containsKey('rowLIKE')) {
      final l$rowLIKE = rowLIKE;
      result$data['rowLIKE'] = l$rowLIKE;
    }
    if (_$data.containsKey('col')) {
      final l$col = col;
      result$data['col'] = l$col;
    }
    if (_$data.containsKey('colGT')) {
      final l$colGT = colGT;
      result$data['colGT'] = l$colGT;
    }
    if (_$data.containsKey('colGTE')) {
      final l$colGTE = colGTE;
      result$data['colGTE'] = l$colGTE;
    }
    if (_$data.containsKey('colLT')) {
      final l$colLT = colLT;
      result$data['colLT'] = l$colLT;
    }
    if (_$data.containsKey('colLTE')) {
      final l$colLTE = colLTE;
      result$data['colLTE'] = l$colLTE;
    }
    if (_$data.containsKey('colNEQ')) {
      final l$colNEQ = colNEQ;
      result$data['colNEQ'] = l$colNEQ;
    }
    if (_$data.containsKey('colEQ')) {
      final l$colEQ = colEQ;
      result$data['colEQ'] = l$colEQ;
    }
    if (_$data.containsKey('colNOTIN')) {
      final l$colNOTIN = colNOTIN;
      result$data['colNOTIN'] = l$colNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colIN')) {
      final l$colIN = colIN;
      result$data['colIN'] = l$colIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = colNOTLIKE;
      result$data['colNOTLIKE'] = l$colNOTLIKE;
    }
    if (_$data.containsKey('colLIKE')) {
      final l$colLIKE = colLIKE;
      result$data['colLIKE'] = l$colLIKE;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_KilledWhereInput<
          Input$checkers_marq_KilledWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_KilledWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_KilledWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (_$data.containsKey('session_id') !=
        other._$data.containsKey('session_id')) {
      return false;
    }
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$session_idGT = session_idGT;
    final lOther$session_idGT = other.session_idGT;
    if (_$data.containsKey('session_idGT') !=
        other._$data.containsKey('session_idGT')) {
      return false;
    }
    if (l$session_idGT != lOther$session_idGT) {
      return false;
    }
    final l$session_idGTE = session_idGTE;
    final lOther$session_idGTE = other.session_idGTE;
    if (_$data.containsKey('session_idGTE') !=
        other._$data.containsKey('session_idGTE')) {
      return false;
    }
    if (l$session_idGTE != lOther$session_idGTE) {
      return false;
    }
    final l$session_idLT = session_idLT;
    final lOther$session_idLT = other.session_idLT;
    if (_$data.containsKey('session_idLT') !=
        other._$data.containsKey('session_idLT')) {
      return false;
    }
    if (l$session_idLT != lOther$session_idLT) {
      return false;
    }
    final l$session_idLTE = session_idLTE;
    final lOther$session_idLTE = other.session_idLTE;
    if (_$data.containsKey('session_idLTE') !=
        other._$data.containsKey('session_idLTE')) {
      return false;
    }
    if (l$session_idLTE != lOther$session_idLTE) {
      return false;
    }
    final l$session_idNEQ = session_idNEQ;
    final lOther$session_idNEQ = other.session_idNEQ;
    if (_$data.containsKey('session_idNEQ') !=
        other._$data.containsKey('session_idNEQ')) {
      return false;
    }
    if (l$session_idNEQ != lOther$session_idNEQ) {
      return false;
    }
    final l$session_idEQ = session_idEQ;
    final lOther$session_idEQ = other.session_idEQ;
    if (_$data.containsKey('session_idEQ') !=
        other._$data.containsKey('session_idEQ')) {
      return false;
    }
    if (l$session_idEQ != lOther$session_idEQ) {
      return false;
    }
    final l$session_idNOTIN = session_idNOTIN;
    final lOther$session_idNOTIN = other.session_idNOTIN;
    if (_$data.containsKey('session_idNOTIN') !=
        other._$data.containsKey('session_idNOTIN')) {
      return false;
    }
    if (l$session_idNOTIN != null && lOther$session_idNOTIN != null) {
      if (l$session_idNOTIN.length != lOther$session_idNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idNOTIN.length; i++) {
        final l$session_idNOTIN$entry = l$session_idNOTIN[i];
        final lOther$session_idNOTIN$entry = lOther$session_idNOTIN[i];
        if (l$session_idNOTIN$entry != lOther$session_idNOTIN$entry) {
          return false;
        }
      }
    } else if (l$session_idNOTIN != lOther$session_idNOTIN) {
      return false;
    }
    final l$session_idIN = session_idIN;
    final lOther$session_idIN = other.session_idIN;
    if (_$data.containsKey('session_idIN') !=
        other._$data.containsKey('session_idIN')) {
      return false;
    }
    if (l$session_idIN != null && lOther$session_idIN != null) {
      if (l$session_idIN.length != lOther$session_idIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idIN.length; i++) {
        final l$session_idIN$entry = l$session_idIN[i];
        final lOther$session_idIN$entry = lOther$session_idIN[i];
        if (l$session_idIN$entry != lOther$session_idIN$entry) {
          return false;
        }
      }
    } else if (l$session_idIN != lOther$session_idIN) {
      return false;
    }
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final lOther$session_idNOTLIKE = other.session_idNOTLIKE;
    if (_$data.containsKey('session_idNOTLIKE') !=
        other._$data.containsKey('session_idNOTLIKE')) {
      return false;
    }
    if (l$session_idNOTLIKE != lOther$session_idNOTLIKE) {
      return false;
    }
    final l$session_idLIKE = session_idLIKE;
    final lOther$session_idLIKE = other.session_idLIKE;
    if (_$data.containsKey('session_idLIKE') !=
        other._$data.containsKey('session_idLIKE')) {
      return false;
    }
    if (l$session_idLIKE != lOther$session_idLIKE) {
      return false;
    }
    final l$player = player;
    final lOther$player = other.player;
    if (_$data.containsKey('player') != other._$data.containsKey('player')) {
      return false;
    }
    if (l$player != lOther$player) {
      return false;
    }
    final l$playerGT = playerGT;
    final lOther$playerGT = other.playerGT;
    if (_$data.containsKey('playerGT') !=
        other._$data.containsKey('playerGT')) {
      return false;
    }
    if (l$playerGT != lOther$playerGT) {
      return false;
    }
    final l$playerGTE = playerGTE;
    final lOther$playerGTE = other.playerGTE;
    if (_$data.containsKey('playerGTE') !=
        other._$data.containsKey('playerGTE')) {
      return false;
    }
    if (l$playerGTE != lOther$playerGTE) {
      return false;
    }
    final l$playerLT = playerLT;
    final lOther$playerLT = other.playerLT;
    if (_$data.containsKey('playerLT') !=
        other._$data.containsKey('playerLT')) {
      return false;
    }
    if (l$playerLT != lOther$playerLT) {
      return false;
    }
    final l$playerLTE = playerLTE;
    final lOther$playerLTE = other.playerLTE;
    if (_$data.containsKey('playerLTE') !=
        other._$data.containsKey('playerLTE')) {
      return false;
    }
    if (l$playerLTE != lOther$playerLTE) {
      return false;
    }
    final l$playerNEQ = playerNEQ;
    final lOther$playerNEQ = other.playerNEQ;
    if (_$data.containsKey('playerNEQ') !=
        other._$data.containsKey('playerNEQ')) {
      return false;
    }
    if (l$playerNEQ != lOther$playerNEQ) {
      return false;
    }
    final l$playerEQ = playerEQ;
    final lOther$playerEQ = other.playerEQ;
    if (_$data.containsKey('playerEQ') !=
        other._$data.containsKey('playerEQ')) {
      return false;
    }
    if (l$playerEQ != lOther$playerEQ) {
      return false;
    }
    final l$playerNOTIN = playerNOTIN;
    final lOther$playerNOTIN = other.playerNOTIN;
    if (_$data.containsKey('playerNOTIN') !=
        other._$data.containsKey('playerNOTIN')) {
      return false;
    }
    if (l$playerNOTIN != null && lOther$playerNOTIN != null) {
      if (l$playerNOTIN.length != lOther$playerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerNOTIN.length; i++) {
        final l$playerNOTIN$entry = l$playerNOTIN[i];
        final lOther$playerNOTIN$entry = lOther$playerNOTIN[i];
        if (l$playerNOTIN$entry != lOther$playerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$playerNOTIN != lOther$playerNOTIN) {
      return false;
    }
    final l$playerIN = playerIN;
    final lOther$playerIN = other.playerIN;
    if (_$data.containsKey('playerIN') !=
        other._$data.containsKey('playerIN')) {
      return false;
    }
    if (l$playerIN != null && lOther$playerIN != null) {
      if (l$playerIN.length != lOther$playerIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerIN.length; i++) {
        final l$playerIN$entry = l$playerIN[i];
        final lOther$playerIN$entry = lOther$playerIN[i];
        if (l$playerIN$entry != lOther$playerIN$entry) {
          return false;
        }
      }
    } else if (l$playerIN != lOther$playerIN) {
      return false;
    }
    final l$playerNOTLIKE = playerNOTLIKE;
    final lOther$playerNOTLIKE = other.playerNOTLIKE;
    if (_$data.containsKey('playerNOTLIKE') !=
        other._$data.containsKey('playerNOTLIKE')) {
      return false;
    }
    if (l$playerNOTLIKE != lOther$playerNOTLIKE) {
      return false;
    }
    final l$playerLIKE = playerLIKE;
    final lOther$playerLIKE = other.playerLIKE;
    if (_$data.containsKey('playerLIKE') !=
        other._$data.containsKey('playerLIKE')) {
      return false;
    }
    if (l$playerLIKE != lOther$playerLIKE) {
      return false;
    }
    final l$row = row;
    final lOther$row = other.row;
    if (_$data.containsKey('row') != other._$data.containsKey('row')) {
      return false;
    }
    if (l$row != lOther$row) {
      return false;
    }
    final l$rowGT = rowGT;
    final lOther$rowGT = other.rowGT;
    if (_$data.containsKey('rowGT') != other._$data.containsKey('rowGT')) {
      return false;
    }
    if (l$rowGT != lOther$rowGT) {
      return false;
    }
    final l$rowGTE = rowGTE;
    final lOther$rowGTE = other.rowGTE;
    if (_$data.containsKey('rowGTE') != other._$data.containsKey('rowGTE')) {
      return false;
    }
    if (l$rowGTE != lOther$rowGTE) {
      return false;
    }
    final l$rowLT = rowLT;
    final lOther$rowLT = other.rowLT;
    if (_$data.containsKey('rowLT') != other._$data.containsKey('rowLT')) {
      return false;
    }
    if (l$rowLT != lOther$rowLT) {
      return false;
    }
    final l$rowLTE = rowLTE;
    final lOther$rowLTE = other.rowLTE;
    if (_$data.containsKey('rowLTE') != other._$data.containsKey('rowLTE')) {
      return false;
    }
    if (l$rowLTE != lOther$rowLTE) {
      return false;
    }
    final l$rowNEQ = rowNEQ;
    final lOther$rowNEQ = other.rowNEQ;
    if (_$data.containsKey('rowNEQ') != other._$data.containsKey('rowNEQ')) {
      return false;
    }
    if (l$rowNEQ != lOther$rowNEQ) {
      return false;
    }
    final l$rowEQ = rowEQ;
    final lOther$rowEQ = other.rowEQ;
    if (_$data.containsKey('rowEQ') != other._$data.containsKey('rowEQ')) {
      return false;
    }
    if (l$rowEQ != lOther$rowEQ) {
      return false;
    }
    final l$rowNOTIN = rowNOTIN;
    final lOther$rowNOTIN = other.rowNOTIN;
    if (_$data.containsKey('rowNOTIN') !=
        other._$data.containsKey('rowNOTIN')) {
      return false;
    }
    if (l$rowNOTIN != null && lOther$rowNOTIN != null) {
      if (l$rowNOTIN.length != lOther$rowNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowNOTIN.length; i++) {
        final l$rowNOTIN$entry = l$rowNOTIN[i];
        final lOther$rowNOTIN$entry = lOther$rowNOTIN[i];
        if (l$rowNOTIN$entry != lOther$rowNOTIN$entry) {
          return false;
        }
      }
    } else if (l$rowNOTIN != lOther$rowNOTIN) {
      return false;
    }
    final l$rowIN = rowIN;
    final lOther$rowIN = other.rowIN;
    if (_$data.containsKey('rowIN') != other._$data.containsKey('rowIN')) {
      return false;
    }
    if (l$rowIN != null && lOther$rowIN != null) {
      if (l$rowIN.length != lOther$rowIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowIN.length; i++) {
        final l$rowIN$entry = l$rowIN[i];
        final lOther$rowIN$entry = lOther$rowIN[i];
        if (l$rowIN$entry != lOther$rowIN$entry) {
          return false;
        }
      }
    } else if (l$rowIN != lOther$rowIN) {
      return false;
    }
    final l$rowNOTLIKE = rowNOTLIKE;
    final lOther$rowNOTLIKE = other.rowNOTLIKE;
    if (_$data.containsKey('rowNOTLIKE') !=
        other._$data.containsKey('rowNOTLIKE')) {
      return false;
    }
    if (l$rowNOTLIKE != lOther$rowNOTLIKE) {
      return false;
    }
    final l$rowLIKE = rowLIKE;
    final lOther$rowLIKE = other.rowLIKE;
    if (_$data.containsKey('rowLIKE') != other._$data.containsKey('rowLIKE')) {
      return false;
    }
    if (l$rowLIKE != lOther$rowLIKE) {
      return false;
    }
    final l$col = col;
    final lOther$col = other.col;
    if (_$data.containsKey('col') != other._$data.containsKey('col')) {
      return false;
    }
    if (l$col != lOther$col) {
      return false;
    }
    final l$colGT = colGT;
    final lOther$colGT = other.colGT;
    if (_$data.containsKey('colGT') != other._$data.containsKey('colGT')) {
      return false;
    }
    if (l$colGT != lOther$colGT) {
      return false;
    }
    final l$colGTE = colGTE;
    final lOther$colGTE = other.colGTE;
    if (_$data.containsKey('colGTE') != other._$data.containsKey('colGTE')) {
      return false;
    }
    if (l$colGTE != lOther$colGTE) {
      return false;
    }
    final l$colLT = colLT;
    final lOther$colLT = other.colLT;
    if (_$data.containsKey('colLT') != other._$data.containsKey('colLT')) {
      return false;
    }
    if (l$colLT != lOther$colLT) {
      return false;
    }
    final l$colLTE = colLTE;
    final lOther$colLTE = other.colLTE;
    if (_$data.containsKey('colLTE') != other._$data.containsKey('colLTE')) {
      return false;
    }
    if (l$colLTE != lOther$colLTE) {
      return false;
    }
    final l$colNEQ = colNEQ;
    final lOther$colNEQ = other.colNEQ;
    if (_$data.containsKey('colNEQ') != other._$data.containsKey('colNEQ')) {
      return false;
    }
    if (l$colNEQ != lOther$colNEQ) {
      return false;
    }
    final l$colEQ = colEQ;
    final lOther$colEQ = other.colEQ;
    if (_$data.containsKey('colEQ') != other._$data.containsKey('colEQ')) {
      return false;
    }
    if (l$colEQ != lOther$colEQ) {
      return false;
    }
    final l$colNOTIN = colNOTIN;
    final lOther$colNOTIN = other.colNOTIN;
    if (_$data.containsKey('colNOTIN') !=
        other._$data.containsKey('colNOTIN')) {
      return false;
    }
    if (l$colNOTIN != null && lOther$colNOTIN != null) {
      if (l$colNOTIN.length != lOther$colNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$colNOTIN.length; i++) {
        final l$colNOTIN$entry = l$colNOTIN[i];
        final lOther$colNOTIN$entry = lOther$colNOTIN[i];
        if (l$colNOTIN$entry != lOther$colNOTIN$entry) {
          return false;
        }
      }
    } else if (l$colNOTIN != lOther$colNOTIN) {
      return false;
    }
    final l$colIN = colIN;
    final lOther$colIN = other.colIN;
    if (_$data.containsKey('colIN') != other._$data.containsKey('colIN')) {
      return false;
    }
    if (l$colIN != null && lOther$colIN != null) {
      if (l$colIN.length != lOther$colIN.length) {
        return false;
      }
      for (int i = 0; i < l$colIN.length; i++) {
        final l$colIN$entry = l$colIN[i];
        final lOther$colIN$entry = lOther$colIN[i];
        if (l$colIN$entry != lOther$colIN$entry) {
          return false;
        }
      }
    } else if (l$colIN != lOther$colIN) {
      return false;
    }
    final l$colNOTLIKE = colNOTLIKE;
    final lOther$colNOTLIKE = other.colNOTLIKE;
    if (_$data.containsKey('colNOTLIKE') !=
        other._$data.containsKey('colNOTLIKE')) {
      return false;
    }
    if (l$colNOTLIKE != lOther$colNOTLIKE) {
      return false;
    }
    final l$colLIKE = colLIKE;
    final lOther$colLIKE = other.colLIKE;
    if (_$data.containsKey('colLIKE') != other._$data.containsKey('colLIKE')) {
      return false;
    }
    if (l$colLIKE != lOther$colLIKE) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$session_idGT = session_idGT;
    final l$session_idGTE = session_idGTE;
    final l$session_idLT = session_idLT;
    final l$session_idLTE = session_idLTE;
    final l$session_idNEQ = session_idNEQ;
    final l$session_idEQ = session_idEQ;
    final l$session_idNOTIN = session_idNOTIN;
    final l$session_idIN = session_idIN;
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final l$session_idLIKE = session_idLIKE;
    final l$player = player;
    final l$playerGT = playerGT;
    final l$playerGTE = playerGTE;
    final l$playerLT = playerLT;
    final l$playerLTE = playerLTE;
    final l$playerNEQ = playerNEQ;
    final l$playerEQ = playerEQ;
    final l$playerNOTIN = playerNOTIN;
    final l$playerIN = playerIN;
    final l$playerNOTLIKE = playerNOTLIKE;
    final l$playerLIKE = playerLIKE;
    final l$row = row;
    final l$rowGT = rowGT;
    final l$rowGTE = rowGTE;
    final l$rowLT = rowLT;
    final l$rowLTE = rowLTE;
    final l$rowNEQ = rowNEQ;
    final l$rowEQ = rowEQ;
    final l$rowNOTIN = rowNOTIN;
    final l$rowIN = rowIN;
    final l$rowNOTLIKE = rowNOTLIKE;
    final l$rowLIKE = rowLIKE;
    final l$col = col;
    final l$colGT = colGT;
    final l$colGTE = colGTE;
    final l$colLT = colLT;
    final l$colLTE = colLTE;
    final l$colNEQ = colNEQ;
    final l$colEQ = colEQ;
    final l$colNOTIN = colNOTIN;
    final l$colIN = colIN;
    final l$colNOTLIKE = colNOTLIKE;
    final l$colLIKE = colLIKE;
    return Object.hashAll([
      _$data.containsKey('session_id') ? l$session_id : const {},
      _$data.containsKey('session_idGT') ? l$session_idGT : const {},
      _$data.containsKey('session_idGTE') ? l$session_idGTE : const {},
      _$data.containsKey('session_idLT') ? l$session_idLT : const {},
      _$data.containsKey('session_idLTE') ? l$session_idLTE : const {},
      _$data.containsKey('session_idNEQ') ? l$session_idNEQ : const {},
      _$data.containsKey('session_idEQ') ? l$session_idEQ : const {},
      _$data.containsKey('session_idNOTIN')
          ? l$session_idNOTIN == null
              ? null
              : Object.hashAll(l$session_idNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idIN')
          ? l$session_idIN == null
              ? null
              : Object.hashAll(l$session_idIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idNOTLIKE') ? l$session_idNOTLIKE : const {},
      _$data.containsKey('session_idLIKE') ? l$session_idLIKE : const {},
      _$data.containsKey('player') ? l$player : const {},
      _$data.containsKey('playerGT') ? l$playerGT : const {},
      _$data.containsKey('playerGTE') ? l$playerGTE : const {},
      _$data.containsKey('playerLT') ? l$playerLT : const {},
      _$data.containsKey('playerLTE') ? l$playerLTE : const {},
      _$data.containsKey('playerNEQ') ? l$playerNEQ : const {},
      _$data.containsKey('playerEQ') ? l$playerEQ : const {},
      _$data.containsKey('playerNOTIN')
          ? l$playerNOTIN == null
              ? null
              : Object.hashAll(l$playerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('playerIN')
          ? l$playerIN == null
              ? null
              : Object.hashAll(l$playerIN.map((v) => v))
          : const {},
      _$data.containsKey('playerNOTLIKE') ? l$playerNOTLIKE : const {},
      _$data.containsKey('playerLIKE') ? l$playerLIKE : const {},
      _$data.containsKey('row') ? l$row : const {},
      _$data.containsKey('rowGT') ? l$rowGT : const {},
      _$data.containsKey('rowGTE') ? l$rowGTE : const {},
      _$data.containsKey('rowLT') ? l$rowLT : const {},
      _$data.containsKey('rowLTE') ? l$rowLTE : const {},
      _$data.containsKey('rowNEQ') ? l$rowNEQ : const {},
      _$data.containsKey('rowEQ') ? l$rowEQ : const {},
      _$data.containsKey('rowNOTIN')
          ? l$rowNOTIN == null
              ? null
              : Object.hashAll(l$rowNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('rowIN')
          ? l$rowIN == null
              ? null
              : Object.hashAll(l$rowIN.map((v) => v))
          : const {},
      _$data.containsKey('rowNOTLIKE') ? l$rowNOTLIKE : const {},
      _$data.containsKey('rowLIKE') ? l$rowLIKE : const {},
      _$data.containsKey('col') ? l$col : const {},
      _$data.containsKey('colGT') ? l$colGT : const {},
      _$data.containsKey('colGTE') ? l$colGTE : const {},
      _$data.containsKey('colLT') ? l$colLT : const {},
      _$data.containsKey('colLTE') ? l$colLTE : const {},
      _$data.containsKey('colNEQ') ? l$colNEQ : const {},
      _$data.containsKey('colEQ') ? l$colEQ : const {},
      _$data.containsKey('colNOTIN')
          ? l$colNOTIN == null
              ? null
              : Object.hashAll(l$colNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('colIN')
          ? l$colIN == null
              ? null
              : Object.hashAll(l$colIN.map((v) => v))
          : const {},
      _$data.containsKey('colNOTLIKE') ? l$colNOTLIKE : const {},
      _$data.containsKey('colLIKE') ? l$colLIKE : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_KilledWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_KilledWhereInput(
    Input$checkers_marq_KilledWhereInput instance,
    TRes Function(Input$checkers_marq_KilledWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_KilledWhereInput;

  factory CopyWith$Input$checkers_marq_KilledWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_KilledWhereInput;

  TRes call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  });
}

class _CopyWithImpl$Input$checkers_marq_KilledWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_KilledWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_KilledWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_KilledWhereInput _instance;

  final TRes Function(Input$checkers_marq_KilledWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? session_id = _undefined,
    Object? session_idGT = _undefined,
    Object? session_idGTE = _undefined,
    Object? session_idLT = _undefined,
    Object? session_idLTE = _undefined,
    Object? session_idNEQ = _undefined,
    Object? session_idEQ = _undefined,
    Object? session_idNOTIN = _undefined,
    Object? session_idIN = _undefined,
    Object? session_idNOTLIKE = _undefined,
    Object? session_idLIKE = _undefined,
    Object? player = _undefined,
    Object? playerGT = _undefined,
    Object? playerGTE = _undefined,
    Object? playerLT = _undefined,
    Object? playerLTE = _undefined,
    Object? playerNEQ = _undefined,
    Object? playerEQ = _undefined,
    Object? playerNOTIN = _undefined,
    Object? playerIN = _undefined,
    Object? playerNOTLIKE = _undefined,
    Object? playerLIKE = _undefined,
    Object? row = _undefined,
    Object? rowGT = _undefined,
    Object? rowGTE = _undefined,
    Object? rowLT = _undefined,
    Object? rowLTE = _undefined,
    Object? rowNEQ = _undefined,
    Object? rowEQ = _undefined,
    Object? rowNOTIN = _undefined,
    Object? rowIN = _undefined,
    Object? rowNOTLIKE = _undefined,
    Object? rowLIKE = _undefined,
    Object? col = _undefined,
    Object? colGT = _undefined,
    Object? colGTE = _undefined,
    Object? colLT = _undefined,
    Object? colLTE = _undefined,
    Object? colNEQ = _undefined,
    Object? colEQ = _undefined,
    Object? colNOTIN = _undefined,
    Object? colIN = _undefined,
    Object? colNOTLIKE = _undefined,
    Object? colLIKE = _undefined,
  }) =>
      _then(Input$checkers_marq_KilledWhereInput._({
        ..._instance._$data,
        if (session_id != _undefined) 'session_id': (session_id as String?),
        if (session_idGT != _undefined)
          'session_idGT': (session_idGT as String?),
        if (session_idGTE != _undefined)
          'session_idGTE': (session_idGTE as String?),
        if (session_idLT != _undefined)
          'session_idLT': (session_idLT as String?),
        if (session_idLTE != _undefined)
          'session_idLTE': (session_idLTE as String?),
        if (session_idNEQ != _undefined)
          'session_idNEQ': (session_idNEQ as String?),
        if (session_idEQ != _undefined)
          'session_idEQ': (session_idEQ as String?),
        if (session_idNOTIN != _undefined)
          'session_idNOTIN': (session_idNOTIN as List<String?>?),
        if (session_idIN != _undefined)
          'session_idIN': (session_idIN as List<String?>?),
        if (session_idNOTLIKE != _undefined)
          'session_idNOTLIKE': (session_idNOTLIKE as String?),
        if (session_idLIKE != _undefined)
          'session_idLIKE': (session_idLIKE as String?),
        if (player != _undefined) 'player': (player as String?),
        if (playerGT != _undefined) 'playerGT': (playerGT as String?),
        if (playerGTE != _undefined) 'playerGTE': (playerGTE as String?),
        if (playerLT != _undefined) 'playerLT': (playerLT as String?),
        if (playerLTE != _undefined) 'playerLTE': (playerLTE as String?),
        if (playerNEQ != _undefined) 'playerNEQ': (playerNEQ as String?),
        if (playerEQ != _undefined) 'playerEQ': (playerEQ as String?),
        if (playerNOTIN != _undefined)
          'playerNOTIN': (playerNOTIN as List<String?>?),
        if (playerIN != _undefined) 'playerIN': (playerIN as List<String?>?),
        if (playerNOTLIKE != _undefined)
          'playerNOTLIKE': (playerNOTLIKE as String?),
        if (playerLIKE != _undefined) 'playerLIKE': (playerLIKE as String?),
        if (row != _undefined) 'row': (row as String?),
        if (rowGT != _undefined) 'rowGT': (rowGT as String?),
        if (rowGTE != _undefined) 'rowGTE': (rowGTE as String?),
        if (rowLT != _undefined) 'rowLT': (rowLT as String?),
        if (rowLTE != _undefined) 'rowLTE': (rowLTE as String?),
        if (rowNEQ != _undefined) 'rowNEQ': (rowNEQ as String?),
        if (rowEQ != _undefined) 'rowEQ': (rowEQ as String?),
        if (rowNOTIN != _undefined) 'rowNOTIN': (rowNOTIN as List<String?>?),
        if (rowIN != _undefined) 'rowIN': (rowIN as List<String?>?),
        if (rowNOTLIKE != _undefined) 'rowNOTLIKE': (rowNOTLIKE as String?),
        if (rowLIKE != _undefined) 'rowLIKE': (rowLIKE as String?),
        if (col != _undefined) 'col': (col as String?),
        if (colGT != _undefined) 'colGT': (colGT as String?),
        if (colGTE != _undefined) 'colGTE': (colGTE as String?),
        if (colLT != _undefined) 'colLT': (colLT as String?),
        if (colLTE != _undefined) 'colLTE': (colLTE as String?),
        if (colNEQ != _undefined) 'colNEQ': (colNEQ as String?),
        if (colEQ != _undefined) 'colEQ': (colEQ as String?),
        if (colNOTIN != _undefined) 'colNOTIN': (colNOTIN as List<String?>?),
        if (colIN != _undefined) 'colIN': (colIN as List<String?>?),
        if (colNOTLIKE != _undefined) 'colNOTLIKE': (colNOTLIKE as String?),
        if (colLIKE != _undefined) 'colLIKE': (colLIKE as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_KilledWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_KilledWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_KilledWhereInput(this._res);

  TRes _res;

  call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  }) =>
      _res;
}

class Input$checkers_marq_KingOrder {
  factory Input$checkers_marq_KingOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_KingOrderField field,
  }) =>
      Input$checkers_marq_KingOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_KingOrder._(this._$data);

  factory Input$checkers_marq_KingOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_KingOrderField((l$field as String));
    return Input$checkers_marq_KingOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_KingOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_KingOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_KingOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_KingOrder<Input$checkers_marq_KingOrder>
      get copyWith => CopyWith$Input$checkers_marq_KingOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_KingOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_KingOrder<TRes> {
  factory CopyWith$Input$checkers_marq_KingOrder(
    Input$checkers_marq_KingOrder instance,
    TRes Function(Input$checkers_marq_KingOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_KingOrder;

  factory CopyWith$Input$checkers_marq_KingOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_KingOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_KingOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_KingOrder<TRes>
    implements CopyWith$Input$checkers_marq_KingOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_KingOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_KingOrder _instance;

  final TRes Function(Input$checkers_marq_KingOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_KingOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_KingOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_KingOrder<TRes>
    implements CopyWith$Input$checkers_marq_KingOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_KingOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_KingOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_KingWhereInput {
  factory Input$checkers_marq_KingWhereInput({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  }) =>
      Input$checkers_marq_KingWhereInput._({
        if (session_id != null) r'session_id': session_id,
        if (session_idGT != null) r'session_idGT': session_idGT,
        if (session_idGTE != null) r'session_idGTE': session_idGTE,
        if (session_idLT != null) r'session_idLT': session_idLT,
        if (session_idLTE != null) r'session_idLTE': session_idLTE,
        if (session_idNEQ != null) r'session_idNEQ': session_idNEQ,
        if (session_idEQ != null) r'session_idEQ': session_idEQ,
        if (session_idNOTIN != null) r'session_idNOTIN': session_idNOTIN,
        if (session_idIN != null) r'session_idIN': session_idIN,
        if (session_idNOTLIKE != null) r'session_idNOTLIKE': session_idNOTLIKE,
        if (session_idLIKE != null) r'session_idLIKE': session_idLIKE,
        if (player != null) r'player': player,
        if (playerGT != null) r'playerGT': playerGT,
        if (playerGTE != null) r'playerGTE': playerGTE,
        if (playerLT != null) r'playerLT': playerLT,
        if (playerLTE != null) r'playerLTE': playerLTE,
        if (playerNEQ != null) r'playerNEQ': playerNEQ,
        if (playerEQ != null) r'playerEQ': playerEQ,
        if (playerNOTIN != null) r'playerNOTIN': playerNOTIN,
        if (playerIN != null) r'playerIN': playerIN,
        if (playerNOTLIKE != null) r'playerNOTLIKE': playerNOTLIKE,
        if (playerLIKE != null) r'playerLIKE': playerLIKE,
        if (row != null) r'row': row,
        if (rowGT != null) r'rowGT': rowGT,
        if (rowGTE != null) r'rowGTE': rowGTE,
        if (rowLT != null) r'rowLT': rowLT,
        if (rowLTE != null) r'rowLTE': rowLTE,
        if (rowNEQ != null) r'rowNEQ': rowNEQ,
        if (rowEQ != null) r'rowEQ': rowEQ,
        if (rowNOTIN != null) r'rowNOTIN': rowNOTIN,
        if (rowIN != null) r'rowIN': rowIN,
        if (rowNOTLIKE != null) r'rowNOTLIKE': rowNOTLIKE,
        if (rowLIKE != null) r'rowLIKE': rowLIKE,
        if (col != null) r'col': col,
        if (colGT != null) r'colGT': colGT,
        if (colGTE != null) r'colGTE': colGTE,
        if (colLT != null) r'colLT': colLT,
        if (colLTE != null) r'colLTE': colLTE,
        if (colNEQ != null) r'colNEQ': colNEQ,
        if (colEQ != null) r'colEQ': colEQ,
        if (colNOTIN != null) r'colNOTIN': colNOTIN,
        if (colIN != null) r'colIN': colIN,
        if (colNOTLIKE != null) r'colNOTLIKE': colNOTLIKE,
        if (colLIKE != null) r'colLIKE': colLIKE,
      });

  Input$checkers_marq_KingWhereInput._(this._$data);

  factory Input$checkers_marq_KingWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('session_id')) {
      final l$session_id = data['session_id'];
      result$data['session_id'] = (l$session_id as String?);
    }
    if (data.containsKey('session_idGT')) {
      final l$session_idGT = data['session_idGT'];
      result$data['session_idGT'] = (l$session_idGT as String?);
    }
    if (data.containsKey('session_idGTE')) {
      final l$session_idGTE = data['session_idGTE'];
      result$data['session_idGTE'] = (l$session_idGTE as String?);
    }
    if (data.containsKey('session_idLT')) {
      final l$session_idLT = data['session_idLT'];
      result$data['session_idLT'] = (l$session_idLT as String?);
    }
    if (data.containsKey('session_idLTE')) {
      final l$session_idLTE = data['session_idLTE'];
      result$data['session_idLTE'] = (l$session_idLTE as String?);
    }
    if (data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = data['session_idNEQ'];
      result$data['session_idNEQ'] = (l$session_idNEQ as String?);
    }
    if (data.containsKey('session_idEQ')) {
      final l$session_idEQ = data['session_idEQ'];
      result$data['session_idEQ'] = (l$session_idEQ as String?);
    }
    if (data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = data['session_idNOTIN'];
      result$data['session_idNOTIN'] = (l$session_idNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idIN')) {
      final l$session_idIN = data['session_idIN'];
      result$data['session_idIN'] = (l$session_idIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = data['session_idNOTLIKE'];
      result$data['session_idNOTLIKE'] = (l$session_idNOTLIKE as String?);
    }
    if (data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = data['session_idLIKE'];
      result$data['session_idLIKE'] = (l$session_idLIKE as String?);
    }
    if (data.containsKey('player')) {
      final l$player = data['player'];
      result$data['player'] = (l$player as String?);
    }
    if (data.containsKey('playerGT')) {
      final l$playerGT = data['playerGT'];
      result$data['playerGT'] = (l$playerGT as String?);
    }
    if (data.containsKey('playerGTE')) {
      final l$playerGTE = data['playerGTE'];
      result$data['playerGTE'] = (l$playerGTE as String?);
    }
    if (data.containsKey('playerLT')) {
      final l$playerLT = data['playerLT'];
      result$data['playerLT'] = (l$playerLT as String?);
    }
    if (data.containsKey('playerLTE')) {
      final l$playerLTE = data['playerLTE'];
      result$data['playerLTE'] = (l$playerLTE as String?);
    }
    if (data.containsKey('playerNEQ')) {
      final l$playerNEQ = data['playerNEQ'];
      result$data['playerNEQ'] = (l$playerNEQ as String?);
    }
    if (data.containsKey('playerEQ')) {
      final l$playerEQ = data['playerEQ'];
      result$data['playerEQ'] = (l$playerEQ as String?);
    }
    if (data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = data['playerNOTIN'];
      result$data['playerNOTIN'] = (l$playerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('playerIN')) {
      final l$playerIN = data['playerIN'];
      result$data['playerIN'] =
          (l$playerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = data['playerNOTLIKE'];
      result$data['playerNOTLIKE'] = (l$playerNOTLIKE as String?);
    }
    if (data.containsKey('playerLIKE')) {
      final l$playerLIKE = data['playerLIKE'];
      result$data['playerLIKE'] = (l$playerLIKE as String?);
    }
    if (data.containsKey('row')) {
      final l$row = data['row'];
      result$data['row'] = (l$row as String?);
    }
    if (data.containsKey('rowGT')) {
      final l$rowGT = data['rowGT'];
      result$data['rowGT'] = (l$rowGT as String?);
    }
    if (data.containsKey('rowGTE')) {
      final l$rowGTE = data['rowGTE'];
      result$data['rowGTE'] = (l$rowGTE as String?);
    }
    if (data.containsKey('rowLT')) {
      final l$rowLT = data['rowLT'];
      result$data['rowLT'] = (l$rowLT as String?);
    }
    if (data.containsKey('rowLTE')) {
      final l$rowLTE = data['rowLTE'];
      result$data['rowLTE'] = (l$rowLTE as String?);
    }
    if (data.containsKey('rowNEQ')) {
      final l$rowNEQ = data['rowNEQ'];
      result$data['rowNEQ'] = (l$rowNEQ as String?);
    }
    if (data.containsKey('rowEQ')) {
      final l$rowEQ = data['rowEQ'];
      result$data['rowEQ'] = (l$rowEQ as String?);
    }
    if (data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = data['rowNOTIN'];
      result$data['rowNOTIN'] =
          (l$rowNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowIN')) {
      final l$rowIN = data['rowIN'];
      result$data['rowIN'] =
          (l$rowIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = data['rowNOTLIKE'];
      result$data['rowNOTLIKE'] = (l$rowNOTLIKE as String?);
    }
    if (data.containsKey('rowLIKE')) {
      final l$rowLIKE = data['rowLIKE'];
      result$data['rowLIKE'] = (l$rowLIKE as String?);
    }
    if (data.containsKey('col')) {
      final l$col = data['col'];
      result$data['col'] = (l$col as String?);
    }
    if (data.containsKey('colGT')) {
      final l$colGT = data['colGT'];
      result$data['colGT'] = (l$colGT as String?);
    }
    if (data.containsKey('colGTE')) {
      final l$colGTE = data['colGTE'];
      result$data['colGTE'] = (l$colGTE as String?);
    }
    if (data.containsKey('colLT')) {
      final l$colLT = data['colLT'];
      result$data['colLT'] = (l$colLT as String?);
    }
    if (data.containsKey('colLTE')) {
      final l$colLTE = data['colLTE'];
      result$data['colLTE'] = (l$colLTE as String?);
    }
    if (data.containsKey('colNEQ')) {
      final l$colNEQ = data['colNEQ'];
      result$data['colNEQ'] = (l$colNEQ as String?);
    }
    if (data.containsKey('colEQ')) {
      final l$colEQ = data['colEQ'];
      result$data['colEQ'] = (l$colEQ as String?);
    }
    if (data.containsKey('colNOTIN')) {
      final l$colNOTIN = data['colNOTIN'];
      result$data['colNOTIN'] =
          (l$colNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colIN')) {
      final l$colIN = data['colIN'];
      result$data['colIN'] =
          (l$colIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = data['colNOTLIKE'];
      result$data['colNOTLIKE'] = (l$colNOTLIKE as String?);
    }
    if (data.containsKey('colLIKE')) {
      final l$colLIKE = data['colLIKE'];
      result$data['colLIKE'] = (l$colLIKE as String?);
    }
    return Input$checkers_marq_KingWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get session_id => (_$data['session_id'] as String?);

  String? get session_idGT => (_$data['session_idGT'] as String?);

  String? get session_idGTE => (_$data['session_idGTE'] as String?);

  String? get session_idLT => (_$data['session_idLT'] as String?);

  String? get session_idLTE => (_$data['session_idLTE'] as String?);

  String? get session_idNEQ => (_$data['session_idNEQ'] as String?);

  String? get session_idEQ => (_$data['session_idEQ'] as String?);

  List<String?>? get session_idNOTIN =>
      (_$data['session_idNOTIN'] as List<String?>?);

  List<String?>? get session_idIN => (_$data['session_idIN'] as List<String?>?);

  String? get session_idNOTLIKE => (_$data['session_idNOTLIKE'] as String?);

  String? get session_idLIKE => (_$data['session_idLIKE'] as String?);

  String? get player => (_$data['player'] as String?);

  String? get playerGT => (_$data['playerGT'] as String?);

  String? get playerGTE => (_$data['playerGTE'] as String?);

  String? get playerLT => (_$data['playerLT'] as String?);

  String? get playerLTE => (_$data['playerLTE'] as String?);

  String? get playerNEQ => (_$data['playerNEQ'] as String?);

  String? get playerEQ => (_$data['playerEQ'] as String?);

  List<String?>? get playerNOTIN => (_$data['playerNOTIN'] as List<String?>?);

  List<String?>? get playerIN => (_$data['playerIN'] as List<String?>?);

  String? get playerNOTLIKE => (_$data['playerNOTLIKE'] as String?);

  String? get playerLIKE => (_$data['playerLIKE'] as String?);

  String? get row => (_$data['row'] as String?);

  String? get rowGT => (_$data['rowGT'] as String?);

  String? get rowGTE => (_$data['rowGTE'] as String?);

  String? get rowLT => (_$data['rowLT'] as String?);

  String? get rowLTE => (_$data['rowLTE'] as String?);

  String? get rowNEQ => (_$data['rowNEQ'] as String?);

  String? get rowEQ => (_$data['rowEQ'] as String?);

  List<String?>? get rowNOTIN => (_$data['rowNOTIN'] as List<String?>?);

  List<String?>? get rowIN => (_$data['rowIN'] as List<String?>?);

  String? get rowNOTLIKE => (_$data['rowNOTLIKE'] as String?);

  String? get rowLIKE => (_$data['rowLIKE'] as String?);

  String? get col => (_$data['col'] as String?);

  String? get colGT => (_$data['colGT'] as String?);

  String? get colGTE => (_$data['colGTE'] as String?);

  String? get colLT => (_$data['colLT'] as String?);

  String? get colLTE => (_$data['colLTE'] as String?);

  String? get colNEQ => (_$data['colNEQ'] as String?);

  String? get colEQ => (_$data['colEQ'] as String?);

  List<String?>? get colNOTIN => (_$data['colNOTIN'] as List<String?>?);

  List<String?>? get colIN => (_$data['colIN'] as List<String?>?);

  String? get colNOTLIKE => (_$data['colNOTLIKE'] as String?);

  String? get colLIKE => (_$data['colLIKE'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('session_id')) {
      final l$session_id = session_id;
      result$data['session_id'] = l$session_id;
    }
    if (_$data.containsKey('session_idGT')) {
      final l$session_idGT = session_idGT;
      result$data['session_idGT'] = l$session_idGT;
    }
    if (_$data.containsKey('session_idGTE')) {
      final l$session_idGTE = session_idGTE;
      result$data['session_idGTE'] = l$session_idGTE;
    }
    if (_$data.containsKey('session_idLT')) {
      final l$session_idLT = session_idLT;
      result$data['session_idLT'] = l$session_idLT;
    }
    if (_$data.containsKey('session_idLTE')) {
      final l$session_idLTE = session_idLTE;
      result$data['session_idLTE'] = l$session_idLTE;
    }
    if (_$data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = session_idNEQ;
      result$data['session_idNEQ'] = l$session_idNEQ;
    }
    if (_$data.containsKey('session_idEQ')) {
      final l$session_idEQ = session_idEQ;
      result$data['session_idEQ'] = l$session_idEQ;
    }
    if (_$data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = session_idNOTIN;
      result$data['session_idNOTIN'] =
          l$session_idNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idIN')) {
      final l$session_idIN = session_idIN;
      result$data['session_idIN'] = l$session_idIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = session_idNOTLIKE;
      result$data['session_idNOTLIKE'] = l$session_idNOTLIKE;
    }
    if (_$data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = session_idLIKE;
      result$data['session_idLIKE'] = l$session_idLIKE;
    }
    if (_$data.containsKey('player')) {
      final l$player = player;
      result$data['player'] = l$player;
    }
    if (_$data.containsKey('playerGT')) {
      final l$playerGT = playerGT;
      result$data['playerGT'] = l$playerGT;
    }
    if (_$data.containsKey('playerGTE')) {
      final l$playerGTE = playerGTE;
      result$data['playerGTE'] = l$playerGTE;
    }
    if (_$data.containsKey('playerLT')) {
      final l$playerLT = playerLT;
      result$data['playerLT'] = l$playerLT;
    }
    if (_$data.containsKey('playerLTE')) {
      final l$playerLTE = playerLTE;
      result$data['playerLTE'] = l$playerLTE;
    }
    if (_$data.containsKey('playerNEQ')) {
      final l$playerNEQ = playerNEQ;
      result$data['playerNEQ'] = l$playerNEQ;
    }
    if (_$data.containsKey('playerEQ')) {
      final l$playerEQ = playerEQ;
      result$data['playerEQ'] = l$playerEQ;
    }
    if (_$data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = playerNOTIN;
      result$data['playerNOTIN'] = l$playerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerIN')) {
      final l$playerIN = playerIN;
      result$data['playerIN'] = l$playerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = playerNOTLIKE;
      result$data['playerNOTLIKE'] = l$playerNOTLIKE;
    }
    if (_$data.containsKey('playerLIKE')) {
      final l$playerLIKE = playerLIKE;
      result$data['playerLIKE'] = l$playerLIKE;
    }
    if (_$data.containsKey('row')) {
      final l$row = row;
      result$data['row'] = l$row;
    }
    if (_$data.containsKey('rowGT')) {
      final l$rowGT = rowGT;
      result$data['rowGT'] = l$rowGT;
    }
    if (_$data.containsKey('rowGTE')) {
      final l$rowGTE = rowGTE;
      result$data['rowGTE'] = l$rowGTE;
    }
    if (_$data.containsKey('rowLT')) {
      final l$rowLT = rowLT;
      result$data['rowLT'] = l$rowLT;
    }
    if (_$data.containsKey('rowLTE')) {
      final l$rowLTE = rowLTE;
      result$data['rowLTE'] = l$rowLTE;
    }
    if (_$data.containsKey('rowNEQ')) {
      final l$rowNEQ = rowNEQ;
      result$data['rowNEQ'] = l$rowNEQ;
    }
    if (_$data.containsKey('rowEQ')) {
      final l$rowEQ = rowEQ;
      result$data['rowEQ'] = l$rowEQ;
    }
    if (_$data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = rowNOTIN;
      result$data['rowNOTIN'] = l$rowNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowIN')) {
      final l$rowIN = rowIN;
      result$data['rowIN'] = l$rowIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = rowNOTLIKE;
      result$data['rowNOTLIKE'] = l$rowNOTLIKE;
    }
    if (_$data.containsKey('rowLIKE')) {
      final l$rowLIKE = rowLIKE;
      result$data['rowLIKE'] = l$rowLIKE;
    }
    if (_$data.containsKey('col')) {
      final l$col = col;
      result$data['col'] = l$col;
    }
    if (_$data.containsKey('colGT')) {
      final l$colGT = colGT;
      result$data['colGT'] = l$colGT;
    }
    if (_$data.containsKey('colGTE')) {
      final l$colGTE = colGTE;
      result$data['colGTE'] = l$colGTE;
    }
    if (_$data.containsKey('colLT')) {
      final l$colLT = colLT;
      result$data['colLT'] = l$colLT;
    }
    if (_$data.containsKey('colLTE')) {
      final l$colLTE = colLTE;
      result$data['colLTE'] = l$colLTE;
    }
    if (_$data.containsKey('colNEQ')) {
      final l$colNEQ = colNEQ;
      result$data['colNEQ'] = l$colNEQ;
    }
    if (_$data.containsKey('colEQ')) {
      final l$colEQ = colEQ;
      result$data['colEQ'] = l$colEQ;
    }
    if (_$data.containsKey('colNOTIN')) {
      final l$colNOTIN = colNOTIN;
      result$data['colNOTIN'] = l$colNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colIN')) {
      final l$colIN = colIN;
      result$data['colIN'] = l$colIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = colNOTLIKE;
      result$data['colNOTLIKE'] = l$colNOTLIKE;
    }
    if (_$data.containsKey('colLIKE')) {
      final l$colLIKE = colLIKE;
      result$data['colLIKE'] = l$colLIKE;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_KingWhereInput<
          Input$checkers_marq_KingWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_KingWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_KingWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (_$data.containsKey('session_id') !=
        other._$data.containsKey('session_id')) {
      return false;
    }
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$session_idGT = session_idGT;
    final lOther$session_idGT = other.session_idGT;
    if (_$data.containsKey('session_idGT') !=
        other._$data.containsKey('session_idGT')) {
      return false;
    }
    if (l$session_idGT != lOther$session_idGT) {
      return false;
    }
    final l$session_idGTE = session_idGTE;
    final lOther$session_idGTE = other.session_idGTE;
    if (_$data.containsKey('session_idGTE') !=
        other._$data.containsKey('session_idGTE')) {
      return false;
    }
    if (l$session_idGTE != lOther$session_idGTE) {
      return false;
    }
    final l$session_idLT = session_idLT;
    final lOther$session_idLT = other.session_idLT;
    if (_$data.containsKey('session_idLT') !=
        other._$data.containsKey('session_idLT')) {
      return false;
    }
    if (l$session_idLT != lOther$session_idLT) {
      return false;
    }
    final l$session_idLTE = session_idLTE;
    final lOther$session_idLTE = other.session_idLTE;
    if (_$data.containsKey('session_idLTE') !=
        other._$data.containsKey('session_idLTE')) {
      return false;
    }
    if (l$session_idLTE != lOther$session_idLTE) {
      return false;
    }
    final l$session_idNEQ = session_idNEQ;
    final lOther$session_idNEQ = other.session_idNEQ;
    if (_$data.containsKey('session_idNEQ') !=
        other._$data.containsKey('session_idNEQ')) {
      return false;
    }
    if (l$session_idNEQ != lOther$session_idNEQ) {
      return false;
    }
    final l$session_idEQ = session_idEQ;
    final lOther$session_idEQ = other.session_idEQ;
    if (_$data.containsKey('session_idEQ') !=
        other._$data.containsKey('session_idEQ')) {
      return false;
    }
    if (l$session_idEQ != lOther$session_idEQ) {
      return false;
    }
    final l$session_idNOTIN = session_idNOTIN;
    final lOther$session_idNOTIN = other.session_idNOTIN;
    if (_$data.containsKey('session_idNOTIN') !=
        other._$data.containsKey('session_idNOTIN')) {
      return false;
    }
    if (l$session_idNOTIN != null && lOther$session_idNOTIN != null) {
      if (l$session_idNOTIN.length != lOther$session_idNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idNOTIN.length; i++) {
        final l$session_idNOTIN$entry = l$session_idNOTIN[i];
        final lOther$session_idNOTIN$entry = lOther$session_idNOTIN[i];
        if (l$session_idNOTIN$entry != lOther$session_idNOTIN$entry) {
          return false;
        }
      }
    } else if (l$session_idNOTIN != lOther$session_idNOTIN) {
      return false;
    }
    final l$session_idIN = session_idIN;
    final lOther$session_idIN = other.session_idIN;
    if (_$data.containsKey('session_idIN') !=
        other._$data.containsKey('session_idIN')) {
      return false;
    }
    if (l$session_idIN != null && lOther$session_idIN != null) {
      if (l$session_idIN.length != lOther$session_idIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idIN.length; i++) {
        final l$session_idIN$entry = l$session_idIN[i];
        final lOther$session_idIN$entry = lOther$session_idIN[i];
        if (l$session_idIN$entry != lOther$session_idIN$entry) {
          return false;
        }
      }
    } else if (l$session_idIN != lOther$session_idIN) {
      return false;
    }
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final lOther$session_idNOTLIKE = other.session_idNOTLIKE;
    if (_$data.containsKey('session_idNOTLIKE') !=
        other._$data.containsKey('session_idNOTLIKE')) {
      return false;
    }
    if (l$session_idNOTLIKE != lOther$session_idNOTLIKE) {
      return false;
    }
    final l$session_idLIKE = session_idLIKE;
    final lOther$session_idLIKE = other.session_idLIKE;
    if (_$data.containsKey('session_idLIKE') !=
        other._$data.containsKey('session_idLIKE')) {
      return false;
    }
    if (l$session_idLIKE != lOther$session_idLIKE) {
      return false;
    }
    final l$player = player;
    final lOther$player = other.player;
    if (_$data.containsKey('player') != other._$data.containsKey('player')) {
      return false;
    }
    if (l$player != lOther$player) {
      return false;
    }
    final l$playerGT = playerGT;
    final lOther$playerGT = other.playerGT;
    if (_$data.containsKey('playerGT') !=
        other._$data.containsKey('playerGT')) {
      return false;
    }
    if (l$playerGT != lOther$playerGT) {
      return false;
    }
    final l$playerGTE = playerGTE;
    final lOther$playerGTE = other.playerGTE;
    if (_$data.containsKey('playerGTE') !=
        other._$data.containsKey('playerGTE')) {
      return false;
    }
    if (l$playerGTE != lOther$playerGTE) {
      return false;
    }
    final l$playerLT = playerLT;
    final lOther$playerLT = other.playerLT;
    if (_$data.containsKey('playerLT') !=
        other._$data.containsKey('playerLT')) {
      return false;
    }
    if (l$playerLT != lOther$playerLT) {
      return false;
    }
    final l$playerLTE = playerLTE;
    final lOther$playerLTE = other.playerLTE;
    if (_$data.containsKey('playerLTE') !=
        other._$data.containsKey('playerLTE')) {
      return false;
    }
    if (l$playerLTE != lOther$playerLTE) {
      return false;
    }
    final l$playerNEQ = playerNEQ;
    final lOther$playerNEQ = other.playerNEQ;
    if (_$data.containsKey('playerNEQ') !=
        other._$data.containsKey('playerNEQ')) {
      return false;
    }
    if (l$playerNEQ != lOther$playerNEQ) {
      return false;
    }
    final l$playerEQ = playerEQ;
    final lOther$playerEQ = other.playerEQ;
    if (_$data.containsKey('playerEQ') !=
        other._$data.containsKey('playerEQ')) {
      return false;
    }
    if (l$playerEQ != lOther$playerEQ) {
      return false;
    }
    final l$playerNOTIN = playerNOTIN;
    final lOther$playerNOTIN = other.playerNOTIN;
    if (_$data.containsKey('playerNOTIN') !=
        other._$data.containsKey('playerNOTIN')) {
      return false;
    }
    if (l$playerNOTIN != null && lOther$playerNOTIN != null) {
      if (l$playerNOTIN.length != lOther$playerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerNOTIN.length; i++) {
        final l$playerNOTIN$entry = l$playerNOTIN[i];
        final lOther$playerNOTIN$entry = lOther$playerNOTIN[i];
        if (l$playerNOTIN$entry != lOther$playerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$playerNOTIN != lOther$playerNOTIN) {
      return false;
    }
    final l$playerIN = playerIN;
    final lOther$playerIN = other.playerIN;
    if (_$data.containsKey('playerIN') !=
        other._$data.containsKey('playerIN')) {
      return false;
    }
    if (l$playerIN != null && lOther$playerIN != null) {
      if (l$playerIN.length != lOther$playerIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerIN.length; i++) {
        final l$playerIN$entry = l$playerIN[i];
        final lOther$playerIN$entry = lOther$playerIN[i];
        if (l$playerIN$entry != lOther$playerIN$entry) {
          return false;
        }
      }
    } else if (l$playerIN != lOther$playerIN) {
      return false;
    }
    final l$playerNOTLIKE = playerNOTLIKE;
    final lOther$playerNOTLIKE = other.playerNOTLIKE;
    if (_$data.containsKey('playerNOTLIKE') !=
        other._$data.containsKey('playerNOTLIKE')) {
      return false;
    }
    if (l$playerNOTLIKE != lOther$playerNOTLIKE) {
      return false;
    }
    final l$playerLIKE = playerLIKE;
    final lOther$playerLIKE = other.playerLIKE;
    if (_$data.containsKey('playerLIKE') !=
        other._$data.containsKey('playerLIKE')) {
      return false;
    }
    if (l$playerLIKE != lOther$playerLIKE) {
      return false;
    }
    final l$row = row;
    final lOther$row = other.row;
    if (_$data.containsKey('row') != other._$data.containsKey('row')) {
      return false;
    }
    if (l$row != lOther$row) {
      return false;
    }
    final l$rowGT = rowGT;
    final lOther$rowGT = other.rowGT;
    if (_$data.containsKey('rowGT') != other._$data.containsKey('rowGT')) {
      return false;
    }
    if (l$rowGT != lOther$rowGT) {
      return false;
    }
    final l$rowGTE = rowGTE;
    final lOther$rowGTE = other.rowGTE;
    if (_$data.containsKey('rowGTE') != other._$data.containsKey('rowGTE')) {
      return false;
    }
    if (l$rowGTE != lOther$rowGTE) {
      return false;
    }
    final l$rowLT = rowLT;
    final lOther$rowLT = other.rowLT;
    if (_$data.containsKey('rowLT') != other._$data.containsKey('rowLT')) {
      return false;
    }
    if (l$rowLT != lOther$rowLT) {
      return false;
    }
    final l$rowLTE = rowLTE;
    final lOther$rowLTE = other.rowLTE;
    if (_$data.containsKey('rowLTE') != other._$data.containsKey('rowLTE')) {
      return false;
    }
    if (l$rowLTE != lOther$rowLTE) {
      return false;
    }
    final l$rowNEQ = rowNEQ;
    final lOther$rowNEQ = other.rowNEQ;
    if (_$data.containsKey('rowNEQ') != other._$data.containsKey('rowNEQ')) {
      return false;
    }
    if (l$rowNEQ != lOther$rowNEQ) {
      return false;
    }
    final l$rowEQ = rowEQ;
    final lOther$rowEQ = other.rowEQ;
    if (_$data.containsKey('rowEQ') != other._$data.containsKey('rowEQ')) {
      return false;
    }
    if (l$rowEQ != lOther$rowEQ) {
      return false;
    }
    final l$rowNOTIN = rowNOTIN;
    final lOther$rowNOTIN = other.rowNOTIN;
    if (_$data.containsKey('rowNOTIN') !=
        other._$data.containsKey('rowNOTIN')) {
      return false;
    }
    if (l$rowNOTIN != null && lOther$rowNOTIN != null) {
      if (l$rowNOTIN.length != lOther$rowNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowNOTIN.length; i++) {
        final l$rowNOTIN$entry = l$rowNOTIN[i];
        final lOther$rowNOTIN$entry = lOther$rowNOTIN[i];
        if (l$rowNOTIN$entry != lOther$rowNOTIN$entry) {
          return false;
        }
      }
    } else if (l$rowNOTIN != lOther$rowNOTIN) {
      return false;
    }
    final l$rowIN = rowIN;
    final lOther$rowIN = other.rowIN;
    if (_$data.containsKey('rowIN') != other._$data.containsKey('rowIN')) {
      return false;
    }
    if (l$rowIN != null && lOther$rowIN != null) {
      if (l$rowIN.length != lOther$rowIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowIN.length; i++) {
        final l$rowIN$entry = l$rowIN[i];
        final lOther$rowIN$entry = lOther$rowIN[i];
        if (l$rowIN$entry != lOther$rowIN$entry) {
          return false;
        }
      }
    } else if (l$rowIN != lOther$rowIN) {
      return false;
    }
    final l$rowNOTLIKE = rowNOTLIKE;
    final lOther$rowNOTLIKE = other.rowNOTLIKE;
    if (_$data.containsKey('rowNOTLIKE') !=
        other._$data.containsKey('rowNOTLIKE')) {
      return false;
    }
    if (l$rowNOTLIKE != lOther$rowNOTLIKE) {
      return false;
    }
    final l$rowLIKE = rowLIKE;
    final lOther$rowLIKE = other.rowLIKE;
    if (_$data.containsKey('rowLIKE') != other._$data.containsKey('rowLIKE')) {
      return false;
    }
    if (l$rowLIKE != lOther$rowLIKE) {
      return false;
    }
    final l$col = col;
    final lOther$col = other.col;
    if (_$data.containsKey('col') != other._$data.containsKey('col')) {
      return false;
    }
    if (l$col != lOther$col) {
      return false;
    }
    final l$colGT = colGT;
    final lOther$colGT = other.colGT;
    if (_$data.containsKey('colGT') != other._$data.containsKey('colGT')) {
      return false;
    }
    if (l$colGT != lOther$colGT) {
      return false;
    }
    final l$colGTE = colGTE;
    final lOther$colGTE = other.colGTE;
    if (_$data.containsKey('colGTE') != other._$data.containsKey('colGTE')) {
      return false;
    }
    if (l$colGTE != lOther$colGTE) {
      return false;
    }
    final l$colLT = colLT;
    final lOther$colLT = other.colLT;
    if (_$data.containsKey('colLT') != other._$data.containsKey('colLT')) {
      return false;
    }
    if (l$colLT != lOther$colLT) {
      return false;
    }
    final l$colLTE = colLTE;
    final lOther$colLTE = other.colLTE;
    if (_$data.containsKey('colLTE') != other._$data.containsKey('colLTE')) {
      return false;
    }
    if (l$colLTE != lOther$colLTE) {
      return false;
    }
    final l$colNEQ = colNEQ;
    final lOther$colNEQ = other.colNEQ;
    if (_$data.containsKey('colNEQ') != other._$data.containsKey('colNEQ')) {
      return false;
    }
    if (l$colNEQ != lOther$colNEQ) {
      return false;
    }
    final l$colEQ = colEQ;
    final lOther$colEQ = other.colEQ;
    if (_$data.containsKey('colEQ') != other._$data.containsKey('colEQ')) {
      return false;
    }
    if (l$colEQ != lOther$colEQ) {
      return false;
    }
    final l$colNOTIN = colNOTIN;
    final lOther$colNOTIN = other.colNOTIN;
    if (_$data.containsKey('colNOTIN') !=
        other._$data.containsKey('colNOTIN')) {
      return false;
    }
    if (l$colNOTIN != null && lOther$colNOTIN != null) {
      if (l$colNOTIN.length != lOther$colNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$colNOTIN.length; i++) {
        final l$colNOTIN$entry = l$colNOTIN[i];
        final lOther$colNOTIN$entry = lOther$colNOTIN[i];
        if (l$colNOTIN$entry != lOther$colNOTIN$entry) {
          return false;
        }
      }
    } else if (l$colNOTIN != lOther$colNOTIN) {
      return false;
    }
    final l$colIN = colIN;
    final lOther$colIN = other.colIN;
    if (_$data.containsKey('colIN') != other._$data.containsKey('colIN')) {
      return false;
    }
    if (l$colIN != null && lOther$colIN != null) {
      if (l$colIN.length != lOther$colIN.length) {
        return false;
      }
      for (int i = 0; i < l$colIN.length; i++) {
        final l$colIN$entry = l$colIN[i];
        final lOther$colIN$entry = lOther$colIN[i];
        if (l$colIN$entry != lOther$colIN$entry) {
          return false;
        }
      }
    } else if (l$colIN != lOther$colIN) {
      return false;
    }
    final l$colNOTLIKE = colNOTLIKE;
    final lOther$colNOTLIKE = other.colNOTLIKE;
    if (_$data.containsKey('colNOTLIKE') !=
        other._$data.containsKey('colNOTLIKE')) {
      return false;
    }
    if (l$colNOTLIKE != lOther$colNOTLIKE) {
      return false;
    }
    final l$colLIKE = colLIKE;
    final lOther$colLIKE = other.colLIKE;
    if (_$data.containsKey('colLIKE') != other._$data.containsKey('colLIKE')) {
      return false;
    }
    if (l$colLIKE != lOther$colLIKE) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$session_idGT = session_idGT;
    final l$session_idGTE = session_idGTE;
    final l$session_idLT = session_idLT;
    final l$session_idLTE = session_idLTE;
    final l$session_idNEQ = session_idNEQ;
    final l$session_idEQ = session_idEQ;
    final l$session_idNOTIN = session_idNOTIN;
    final l$session_idIN = session_idIN;
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final l$session_idLIKE = session_idLIKE;
    final l$player = player;
    final l$playerGT = playerGT;
    final l$playerGTE = playerGTE;
    final l$playerLT = playerLT;
    final l$playerLTE = playerLTE;
    final l$playerNEQ = playerNEQ;
    final l$playerEQ = playerEQ;
    final l$playerNOTIN = playerNOTIN;
    final l$playerIN = playerIN;
    final l$playerNOTLIKE = playerNOTLIKE;
    final l$playerLIKE = playerLIKE;
    final l$row = row;
    final l$rowGT = rowGT;
    final l$rowGTE = rowGTE;
    final l$rowLT = rowLT;
    final l$rowLTE = rowLTE;
    final l$rowNEQ = rowNEQ;
    final l$rowEQ = rowEQ;
    final l$rowNOTIN = rowNOTIN;
    final l$rowIN = rowIN;
    final l$rowNOTLIKE = rowNOTLIKE;
    final l$rowLIKE = rowLIKE;
    final l$col = col;
    final l$colGT = colGT;
    final l$colGTE = colGTE;
    final l$colLT = colLT;
    final l$colLTE = colLTE;
    final l$colNEQ = colNEQ;
    final l$colEQ = colEQ;
    final l$colNOTIN = colNOTIN;
    final l$colIN = colIN;
    final l$colNOTLIKE = colNOTLIKE;
    final l$colLIKE = colLIKE;
    return Object.hashAll([
      _$data.containsKey('session_id') ? l$session_id : const {},
      _$data.containsKey('session_idGT') ? l$session_idGT : const {},
      _$data.containsKey('session_idGTE') ? l$session_idGTE : const {},
      _$data.containsKey('session_idLT') ? l$session_idLT : const {},
      _$data.containsKey('session_idLTE') ? l$session_idLTE : const {},
      _$data.containsKey('session_idNEQ') ? l$session_idNEQ : const {},
      _$data.containsKey('session_idEQ') ? l$session_idEQ : const {},
      _$data.containsKey('session_idNOTIN')
          ? l$session_idNOTIN == null
              ? null
              : Object.hashAll(l$session_idNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idIN')
          ? l$session_idIN == null
              ? null
              : Object.hashAll(l$session_idIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idNOTLIKE') ? l$session_idNOTLIKE : const {},
      _$data.containsKey('session_idLIKE') ? l$session_idLIKE : const {},
      _$data.containsKey('player') ? l$player : const {},
      _$data.containsKey('playerGT') ? l$playerGT : const {},
      _$data.containsKey('playerGTE') ? l$playerGTE : const {},
      _$data.containsKey('playerLT') ? l$playerLT : const {},
      _$data.containsKey('playerLTE') ? l$playerLTE : const {},
      _$data.containsKey('playerNEQ') ? l$playerNEQ : const {},
      _$data.containsKey('playerEQ') ? l$playerEQ : const {},
      _$data.containsKey('playerNOTIN')
          ? l$playerNOTIN == null
              ? null
              : Object.hashAll(l$playerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('playerIN')
          ? l$playerIN == null
              ? null
              : Object.hashAll(l$playerIN.map((v) => v))
          : const {},
      _$data.containsKey('playerNOTLIKE') ? l$playerNOTLIKE : const {},
      _$data.containsKey('playerLIKE') ? l$playerLIKE : const {},
      _$data.containsKey('row') ? l$row : const {},
      _$data.containsKey('rowGT') ? l$rowGT : const {},
      _$data.containsKey('rowGTE') ? l$rowGTE : const {},
      _$data.containsKey('rowLT') ? l$rowLT : const {},
      _$data.containsKey('rowLTE') ? l$rowLTE : const {},
      _$data.containsKey('rowNEQ') ? l$rowNEQ : const {},
      _$data.containsKey('rowEQ') ? l$rowEQ : const {},
      _$data.containsKey('rowNOTIN')
          ? l$rowNOTIN == null
              ? null
              : Object.hashAll(l$rowNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('rowIN')
          ? l$rowIN == null
              ? null
              : Object.hashAll(l$rowIN.map((v) => v))
          : const {},
      _$data.containsKey('rowNOTLIKE') ? l$rowNOTLIKE : const {},
      _$data.containsKey('rowLIKE') ? l$rowLIKE : const {},
      _$data.containsKey('col') ? l$col : const {},
      _$data.containsKey('colGT') ? l$colGT : const {},
      _$data.containsKey('colGTE') ? l$colGTE : const {},
      _$data.containsKey('colLT') ? l$colLT : const {},
      _$data.containsKey('colLTE') ? l$colLTE : const {},
      _$data.containsKey('colNEQ') ? l$colNEQ : const {},
      _$data.containsKey('colEQ') ? l$colEQ : const {},
      _$data.containsKey('colNOTIN')
          ? l$colNOTIN == null
              ? null
              : Object.hashAll(l$colNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('colIN')
          ? l$colIN == null
              ? null
              : Object.hashAll(l$colIN.map((v) => v))
          : const {},
      _$data.containsKey('colNOTLIKE') ? l$colNOTLIKE : const {},
      _$data.containsKey('colLIKE') ? l$colLIKE : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_KingWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_KingWhereInput(
    Input$checkers_marq_KingWhereInput instance,
    TRes Function(Input$checkers_marq_KingWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_KingWhereInput;

  factory CopyWith$Input$checkers_marq_KingWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_KingWhereInput;

  TRes call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  });
}

class _CopyWithImpl$Input$checkers_marq_KingWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_KingWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_KingWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_KingWhereInput _instance;

  final TRes Function(Input$checkers_marq_KingWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? session_id = _undefined,
    Object? session_idGT = _undefined,
    Object? session_idGTE = _undefined,
    Object? session_idLT = _undefined,
    Object? session_idLTE = _undefined,
    Object? session_idNEQ = _undefined,
    Object? session_idEQ = _undefined,
    Object? session_idNOTIN = _undefined,
    Object? session_idIN = _undefined,
    Object? session_idNOTLIKE = _undefined,
    Object? session_idLIKE = _undefined,
    Object? player = _undefined,
    Object? playerGT = _undefined,
    Object? playerGTE = _undefined,
    Object? playerLT = _undefined,
    Object? playerLTE = _undefined,
    Object? playerNEQ = _undefined,
    Object? playerEQ = _undefined,
    Object? playerNOTIN = _undefined,
    Object? playerIN = _undefined,
    Object? playerNOTLIKE = _undefined,
    Object? playerLIKE = _undefined,
    Object? row = _undefined,
    Object? rowGT = _undefined,
    Object? rowGTE = _undefined,
    Object? rowLT = _undefined,
    Object? rowLTE = _undefined,
    Object? rowNEQ = _undefined,
    Object? rowEQ = _undefined,
    Object? rowNOTIN = _undefined,
    Object? rowIN = _undefined,
    Object? rowNOTLIKE = _undefined,
    Object? rowLIKE = _undefined,
    Object? col = _undefined,
    Object? colGT = _undefined,
    Object? colGTE = _undefined,
    Object? colLT = _undefined,
    Object? colLTE = _undefined,
    Object? colNEQ = _undefined,
    Object? colEQ = _undefined,
    Object? colNOTIN = _undefined,
    Object? colIN = _undefined,
    Object? colNOTLIKE = _undefined,
    Object? colLIKE = _undefined,
  }) =>
      _then(Input$checkers_marq_KingWhereInput._({
        ..._instance._$data,
        if (session_id != _undefined) 'session_id': (session_id as String?),
        if (session_idGT != _undefined)
          'session_idGT': (session_idGT as String?),
        if (session_idGTE != _undefined)
          'session_idGTE': (session_idGTE as String?),
        if (session_idLT != _undefined)
          'session_idLT': (session_idLT as String?),
        if (session_idLTE != _undefined)
          'session_idLTE': (session_idLTE as String?),
        if (session_idNEQ != _undefined)
          'session_idNEQ': (session_idNEQ as String?),
        if (session_idEQ != _undefined)
          'session_idEQ': (session_idEQ as String?),
        if (session_idNOTIN != _undefined)
          'session_idNOTIN': (session_idNOTIN as List<String?>?),
        if (session_idIN != _undefined)
          'session_idIN': (session_idIN as List<String?>?),
        if (session_idNOTLIKE != _undefined)
          'session_idNOTLIKE': (session_idNOTLIKE as String?),
        if (session_idLIKE != _undefined)
          'session_idLIKE': (session_idLIKE as String?),
        if (player != _undefined) 'player': (player as String?),
        if (playerGT != _undefined) 'playerGT': (playerGT as String?),
        if (playerGTE != _undefined) 'playerGTE': (playerGTE as String?),
        if (playerLT != _undefined) 'playerLT': (playerLT as String?),
        if (playerLTE != _undefined) 'playerLTE': (playerLTE as String?),
        if (playerNEQ != _undefined) 'playerNEQ': (playerNEQ as String?),
        if (playerEQ != _undefined) 'playerEQ': (playerEQ as String?),
        if (playerNOTIN != _undefined)
          'playerNOTIN': (playerNOTIN as List<String?>?),
        if (playerIN != _undefined) 'playerIN': (playerIN as List<String?>?),
        if (playerNOTLIKE != _undefined)
          'playerNOTLIKE': (playerNOTLIKE as String?),
        if (playerLIKE != _undefined) 'playerLIKE': (playerLIKE as String?),
        if (row != _undefined) 'row': (row as String?),
        if (rowGT != _undefined) 'rowGT': (rowGT as String?),
        if (rowGTE != _undefined) 'rowGTE': (rowGTE as String?),
        if (rowLT != _undefined) 'rowLT': (rowLT as String?),
        if (rowLTE != _undefined) 'rowLTE': (rowLTE as String?),
        if (rowNEQ != _undefined) 'rowNEQ': (rowNEQ as String?),
        if (rowEQ != _undefined) 'rowEQ': (rowEQ as String?),
        if (rowNOTIN != _undefined) 'rowNOTIN': (rowNOTIN as List<String?>?),
        if (rowIN != _undefined) 'rowIN': (rowIN as List<String?>?),
        if (rowNOTLIKE != _undefined) 'rowNOTLIKE': (rowNOTLIKE as String?),
        if (rowLIKE != _undefined) 'rowLIKE': (rowLIKE as String?),
        if (col != _undefined) 'col': (col as String?),
        if (colGT != _undefined) 'colGT': (colGT as String?),
        if (colGTE != _undefined) 'colGTE': (colGTE as String?),
        if (colLT != _undefined) 'colLT': (colLT as String?),
        if (colLTE != _undefined) 'colLTE': (colLTE as String?),
        if (colNEQ != _undefined) 'colNEQ': (colNEQ as String?),
        if (colEQ != _undefined) 'colEQ': (colEQ as String?),
        if (colNOTIN != _undefined) 'colNOTIN': (colNOTIN as List<String?>?),
        if (colIN != _undefined) 'colIN': (colIN as List<String?>?),
        if (colNOTLIKE != _undefined) 'colNOTLIKE': (colNOTLIKE as String?),
        if (colLIKE != _undefined) 'colLIKE': (colLIKE as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_KingWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_KingWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_KingWhereInput(this._res);

  TRes _res;

  call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  }) =>
      _res;
}

class Input$checkers_marq_MovedOrder {
  factory Input$checkers_marq_MovedOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_MovedOrderField field,
  }) =>
      Input$checkers_marq_MovedOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_MovedOrder._(this._$data);

  factory Input$checkers_marq_MovedOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_MovedOrderField((l$field as String));
    return Input$checkers_marq_MovedOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_MovedOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_MovedOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_MovedOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_MovedOrder<Input$checkers_marq_MovedOrder>
      get copyWith => CopyWith$Input$checkers_marq_MovedOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_MovedOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_MovedOrder<TRes> {
  factory CopyWith$Input$checkers_marq_MovedOrder(
    Input$checkers_marq_MovedOrder instance,
    TRes Function(Input$checkers_marq_MovedOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_MovedOrder;

  factory CopyWith$Input$checkers_marq_MovedOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_MovedOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_MovedOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_MovedOrder<TRes>
    implements CopyWith$Input$checkers_marq_MovedOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_MovedOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_MovedOrder _instance;

  final TRes Function(Input$checkers_marq_MovedOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_MovedOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_MovedOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_MovedOrder<TRes>
    implements CopyWith$Input$checkers_marq_MovedOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_MovedOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_MovedOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_MovedWhereInput {
  factory Input$checkers_marq_MovedWhereInput({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  }) =>
      Input$checkers_marq_MovedWhereInput._({
        if (session_id != null) r'session_id': session_id,
        if (session_idGT != null) r'session_idGT': session_idGT,
        if (session_idGTE != null) r'session_idGTE': session_idGTE,
        if (session_idLT != null) r'session_idLT': session_idLT,
        if (session_idLTE != null) r'session_idLTE': session_idLTE,
        if (session_idNEQ != null) r'session_idNEQ': session_idNEQ,
        if (session_idEQ != null) r'session_idEQ': session_idEQ,
        if (session_idNOTIN != null) r'session_idNOTIN': session_idNOTIN,
        if (session_idIN != null) r'session_idIN': session_idIN,
        if (session_idNOTLIKE != null) r'session_idNOTLIKE': session_idNOTLIKE,
        if (session_idLIKE != null) r'session_idLIKE': session_idLIKE,
        if (player != null) r'player': player,
        if (playerGT != null) r'playerGT': playerGT,
        if (playerGTE != null) r'playerGTE': playerGTE,
        if (playerLT != null) r'playerLT': playerLT,
        if (playerLTE != null) r'playerLTE': playerLTE,
        if (playerNEQ != null) r'playerNEQ': playerNEQ,
        if (playerEQ != null) r'playerEQ': playerEQ,
        if (playerNOTIN != null) r'playerNOTIN': playerNOTIN,
        if (playerIN != null) r'playerIN': playerIN,
        if (playerNOTLIKE != null) r'playerNOTLIKE': playerNOTLIKE,
        if (playerLIKE != null) r'playerLIKE': playerLIKE,
        if (row != null) r'row': row,
        if (rowGT != null) r'rowGT': rowGT,
        if (rowGTE != null) r'rowGTE': rowGTE,
        if (rowLT != null) r'rowLT': rowLT,
        if (rowLTE != null) r'rowLTE': rowLTE,
        if (rowNEQ != null) r'rowNEQ': rowNEQ,
        if (rowEQ != null) r'rowEQ': rowEQ,
        if (rowNOTIN != null) r'rowNOTIN': rowNOTIN,
        if (rowIN != null) r'rowIN': rowIN,
        if (rowNOTLIKE != null) r'rowNOTLIKE': rowNOTLIKE,
        if (rowLIKE != null) r'rowLIKE': rowLIKE,
        if (col != null) r'col': col,
        if (colGT != null) r'colGT': colGT,
        if (colGTE != null) r'colGTE': colGTE,
        if (colLT != null) r'colLT': colLT,
        if (colLTE != null) r'colLTE': colLTE,
        if (colNEQ != null) r'colNEQ': colNEQ,
        if (colEQ != null) r'colEQ': colEQ,
        if (colNOTIN != null) r'colNOTIN': colNOTIN,
        if (colIN != null) r'colIN': colIN,
        if (colNOTLIKE != null) r'colNOTLIKE': colNOTLIKE,
        if (colLIKE != null) r'colLIKE': colLIKE,
      });

  Input$checkers_marq_MovedWhereInput._(this._$data);

  factory Input$checkers_marq_MovedWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('session_id')) {
      final l$session_id = data['session_id'];
      result$data['session_id'] = (l$session_id as String?);
    }
    if (data.containsKey('session_idGT')) {
      final l$session_idGT = data['session_idGT'];
      result$data['session_idGT'] = (l$session_idGT as String?);
    }
    if (data.containsKey('session_idGTE')) {
      final l$session_idGTE = data['session_idGTE'];
      result$data['session_idGTE'] = (l$session_idGTE as String?);
    }
    if (data.containsKey('session_idLT')) {
      final l$session_idLT = data['session_idLT'];
      result$data['session_idLT'] = (l$session_idLT as String?);
    }
    if (data.containsKey('session_idLTE')) {
      final l$session_idLTE = data['session_idLTE'];
      result$data['session_idLTE'] = (l$session_idLTE as String?);
    }
    if (data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = data['session_idNEQ'];
      result$data['session_idNEQ'] = (l$session_idNEQ as String?);
    }
    if (data.containsKey('session_idEQ')) {
      final l$session_idEQ = data['session_idEQ'];
      result$data['session_idEQ'] = (l$session_idEQ as String?);
    }
    if (data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = data['session_idNOTIN'];
      result$data['session_idNOTIN'] = (l$session_idNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idIN')) {
      final l$session_idIN = data['session_idIN'];
      result$data['session_idIN'] = (l$session_idIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = data['session_idNOTLIKE'];
      result$data['session_idNOTLIKE'] = (l$session_idNOTLIKE as String?);
    }
    if (data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = data['session_idLIKE'];
      result$data['session_idLIKE'] = (l$session_idLIKE as String?);
    }
    if (data.containsKey('player')) {
      final l$player = data['player'];
      result$data['player'] = (l$player as String?);
    }
    if (data.containsKey('playerGT')) {
      final l$playerGT = data['playerGT'];
      result$data['playerGT'] = (l$playerGT as String?);
    }
    if (data.containsKey('playerGTE')) {
      final l$playerGTE = data['playerGTE'];
      result$data['playerGTE'] = (l$playerGTE as String?);
    }
    if (data.containsKey('playerLT')) {
      final l$playerLT = data['playerLT'];
      result$data['playerLT'] = (l$playerLT as String?);
    }
    if (data.containsKey('playerLTE')) {
      final l$playerLTE = data['playerLTE'];
      result$data['playerLTE'] = (l$playerLTE as String?);
    }
    if (data.containsKey('playerNEQ')) {
      final l$playerNEQ = data['playerNEQ'];
      result$data['playerNEQ'] = (l$playerNEQ as String?);
    }
    if (data.containsKey('playerEQ')) {
      final l$playerEQ = data['playerEQ'];
      result$data['playerEQ'] = (l$playerEQ as String?);
    }
    if (data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = data['playerNOTIN'];
      result$data['playerNOTIN'] = (l$playerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('playerIN')) {
      final l$playerIN = data['playerIN'];
      result$data['playerIN'] =
          (l$playerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = data['playerNOTLIKE'];
      result$data['playerNOTLIKE'] = (l$playerNOTLIKE as String?);
    }
    if (data.containsKey('playerLIKE')) {
      final l$playerLIKE = data['playerLIKE'];
      result$data['playerLIKE'] = (l$playerLIKE as String?);
    }
    if (data.containsKey('row')) {
      final l$row = data['row'];
      result$data['row'] = (l$row as String?);
    }
    if (data.containsKey('rowGT')) {
      final l$rowGT = data['rowGT'];
      result$data['rowGT'] = (l$rowGT as String?);
    }
    if (data.containsKey('rowGTE')) {
      final l$rowGTE = data['rowGTE'];
      result$data['rowGTE'] = (l$rowGTE as String?);
    }
    if (data.containsKey('rowLT')) {
      final l$rowLT = data['rowLT'];
      result$data['rowLT'] = (l$rowLT as String?);
    }
    if (data.containsKey('rowLTE')) {
      final l$rowLTE = data['rowLTE'];
      result$data['rowLTE'] = (l$rowLTE as String?);
    }
    if (data.containsKey('rowNEQ')) {
      final l$rowNEQ = data['rowNEQ'];
      result$data['rowNEQ'] = (l$rowNEQ as String?);
    }
    if (data.containsKey('rowEQ')) {
      final l$rowEQ = data['rowEQ'];
      result$data['rowEQ'] = (l$rowEQ as String?);
    }
    if (data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = data['rowNOTIN'];
      result$data['rowNOTIN'] =
          (l$rowNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowIN')) {
      final l$rowIN = data['rowIN'];
      result$data['rowIN'] =
          (l$rowIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = data['rowNOTLIKE'];
      result$data['rowNOTLIKE'] = (l$rowNOTLIKE as String?);
    }
    if (data.containsKey('rowLIKE')) {
      final l$rowLIKE = data['rowLIKE'];
      result$data['rowLIKE'] = (l$rowLIKE as String?);
    }
    if (data.containsKey('col')) {
      final l$col = data['col'];
      result$data['col'] = (l$col as String?);
    }
    if (data.containsKey('colGT')) {
      final l$colGT = data['colGT'];
      result$data['colGT'] = (l$colGT as String?);
    }
    if (data.containsKey('colGTE')) {
      final l$colGTE = data['colGTE'];
      result$data['colGTE'] = (l$colGTE as String?);
    }
    if (data.containsKey('colLT')) {
      final l$colLT = data['colLT'];
      result$data['colLT'] = (l$colLT as String?);
    }
    if (data.containsKey('colLTE')) {
      final l$colLTE = data['colLTE'];
      result$data['colLTE'] = (l$colLTE as String?);
    }
    if (data.containsKey('colNEQ')) {
      final l$colNEQ = data['colNEQ'];
      result$data['colNEQ'] = (l$colNEQ as String?);
    }
    if (data.containsKey('colEQ')) {
      final l$colEQ = data['colEQ'];
      result$data['colEQ'] = (l$colEQ as String?);
    }
    if (data.containsKey('colNOTIN')) {
      final l$colNOTIN = data['colNOTIN'];
      result$data['colNOTIN'] =
          (l$colNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colIN')) {
      final l$colIN = data['colIN'];
      result$data['colIN'] =
          (l$colIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = data['colNOTLIKE'];
      result$data['colNOTLIKE'] = (l$colNOTLIKE as String?);
    }
    if (data.containsKey('colLIKE')) {
      final l$colLIKE = data['colLIKE'];
      result$data['colLIKE'] = (l$colLIKE as String?);
    }
    return Input$checkers_marq_MovedWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get session_id => (_$data['session_id'] as String?);

  String? get session_idGT => (_$data['session_idGT'] as String?);

  String? get session_idGTE => (_$data['session_idGTE'] as String?);

  String? get session_idLT => (_$data['session_idLT'] as String?);

  String? get session_idLTE => (_$data['session_idLTE'] as String?);

  String? get session_idNEQ => (_$data['session_idNEQ'] as String?);

  String? get session_idEQ => (_$data['session_idEQ'] as String?);

  List<String?>? get session_idNOTIN =>
      (_$data['session_idNOTIN'] as List<String?>?);

  List<String?>? get session_idIN => (_$data['session_idIN'] as List<String?>?);

  String? get session_idNOTLIKE => (_$data['session_idNOTLIKE'] as String?);

  String? get session_idLIKE => (_$data['session_idLIKE'] as String?);

  String? get player => (_$data['player'] as String?);

  String? get playerGT => (_$data['playerGT'] as String?);

  String? get playerGTE => (_$data['playerGTE'] as String?);

  String? get playerLT => (_$data['playerLT'] as String?);

  String? get playerLTE => (_$data['playerLTE'] as String?);

  String? get playerNEQ => (_$data['playerNEQ'] as String?);

  String? get playerEQ => (_$data['playerEQ'] as String?);

  List<String?>? get playerNOTIN => (_$data['playerNOTIN'] as List<String?>?);

  List<String?>? get playerIN => (_$data['playerIN'] as List<String?>?);

  String? get playerNOTLIKE => (_$data['playerNOTLIKE'] as String?);

  String? get playerLIKE => (_$data['playerLIKE'] as String?);

  String? get row => (_$data['row'] as String?);

  String? get rowGT => (_$data['rowGT'] as String?);

  String? get rowGTE => (_$data['rowGTE'] as String?);

  String? get rowLT => (_$data['rowLT'] as String?);

  String? get rowLTE => (_$data['rowLTE'] as String?);

  String? get rowNEQ => (_$data['rowNEQ'] as String?);

  String? get rowEQ => (_$data['rowEQ'] as String?);

  List<String?>? get rowNOTIN => (_$data['rowNOTIN'] as List<String?>?);

  List<String?>? get rowIN => (_$data['rowIN'] as List<String?>?);

  String? get rowNOTLIKE => (_$data['rowNOTLIKE'] as String?);

  String? get rowLIKE => (_$data['rowLIKE'] as String?);

  String? get col => (_$data['col'] as String?);

  String? get colGT => (_$data['colGT'] as String?);

  String? get colGTE => (_$data['colGTE'] as String?);

  String? get colLT => (_$data['colLT'] as String?);

  String? get colLTE => (_$data['colLTE'] as String?);

  String? get colNEQ => (_$data['colNEQ'] as String?);

  String? get colEQ => (_$data['colEQ'] as String?);

  List<String?>? get colNOTIN => (_$data['colNOTIN'] as List<String?>?);

  List<String?>? get colIN => (_$data['colIN'] as List<String?>?);

  String? get colNOTLIKE => (_$data['colNOTLIKE'] as String?);

  String? get colLIKE => (_$data['colLIKE'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('session_id')) {
      final l$session_id = session_id;
      result$data['session_id'] = l$session_id;
    }
    if (_$data.containsKey('session_idGT')) {
      final l$session_idGT = session_idGT;
      result$data['session_idGT'] = l$session_idGT;
    }
    if (_$data.containsKey('session_idGTE')) {
      final l$session_idGTE = session_idGTE;
      result$data['session_idGTE'] = l$session_idGTE;
    }
    if (_$data.containsKey('session_idLT')) {
      final l$session_idLT = session_idLT;
      result$data['session_idLT'] = l$session_idLT;
    }
    if (_$data.containsKey('session_idLTE')) {
      final l$session_idLTE = session_idLTE;
      result$data['session_idLTE'] = l$session_idLTE;
    }
    if (_$data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = session_idNEQ;
      result$data['session_idNEQ'] = l$session_idNEQ;
    }
    if (_$data.containsKey('session_idEQ')) {
      final l$session_idEQ = session_idEQ;
      result$data['session_idEQ'] = l$session_idEQ;
    }
    if (_$data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = session_idNOTIN;
      result$data['session_idNOTIN'] =
          l$session_idNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idIN')) {
      final l$session_idIN = session_idIN;
      result$data['session_idIN'] = l$session_idIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = session_idNOTLIKE;
      result$data['session_idNOTLIKE'] = l$session_idNOTLIKE;
    }
    if (_$data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = session_idLIKE;
      result$data['session_idLIKE'] = l$session_idLIKE;
    }
    if (_$data.containsKey('player')) {
      final l$player = player;
      result$data['player'] = l$player;
    }
    if (_$data.containsKey('playerGT')) {
      final l$playerGT = playerGT;
      result$data['playerGT'] = l$playerGT;
    }
    if (_$data.containsKey('playerGTE')) {
      final l$playerGTE = playerGTE;
      result$data['playerGTE'] = l$playerGTE;
    }
    if (_$data.containsKey('playerLT')) {
      final l$playerLT = playerLT;
      result$data['playerLT'] = l$playerLT;
    }
    if (_$data.containsKey('playerLTE')) {
      final l$playerLTE = playerLTE;
      result$data['playerLTE'] = l$playerLTE;
    }
    if (_$data.containsKey('playerNEQ')) {
      final l$playerNEQ = playerNEQ;
      result$data['playerNEQ'] = l$playerNEQ;
    }
    if (_$data.containsKey('playerEQ')) {
      final l$playerEQ = playerEQ;
      result$data['playerEQ'] = l$playerEQ;
    }
    if (_$data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = playerNOTIN;
      result$data['playerNOTIN'] = l$playerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerIN')) {
      final l$playerIN = playerIN;
      result$data['playerIN'] = l$playerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = playerNOTLIKE;
      result$data['playerNOTLIKE'] = l$playerNOTLIKE;
    }
    if (_$data.containsKey('playerLIKE')) {
      final l$playerLIKE = playerLIKE;
      result$data['playerLIKE'] = l$playerLIKE;
    }
    if (_$data.containsKey('row')) {
      final l$row = row;
      result$data['row'] = l$row;
    }
    if (_$data.containsKey('rowGT')) {
      final l$rowGT = rowGT;
      result$data['rowGT'] = l$rowGT;
    }
    if (_$data.containsKey('rowGTE')) {
      final l$rowGTE = rowGTE;
      result$data['rowGTE'] = l$rowGTE;
    }
    if (_$data.containsKey('rowLT')) {
      final l$rowLT = rowLT;
      result$data['rowLT'] = l$rowLT;
    }
    if (_$data.containsKey('rowLTE')) {
      final l$rowLTE = rowLTE;
      result$data['rowLTE'] = l$rowLTE;
    }
    if (_$data.containsKey('rowNEQ')) {
      final l$rowNEQ = rowNEQ;
      result$data['rowNEQ'] = l$rowNEQ;
    }
    if (_$data.containsKey('rowEQ')) {
      final l$rowEQ = rowEQ;
      result$data['rowEQ'] = l$rowEQ;
    }
    if (_$data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = rowNOTIN;
      result$data['rowNOTIN'] = l$rowNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowIN')) {
      final l$rowIN = rowIN;
      result$data['rowIN'] = l$rowIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = rowNOTLIKE;
      result$data['rowNOTLIKE'] = l$rowNOTLIKE;
    }
    if (_$data.containsKey('rowLIKE')) {
      final l$rowLIKE = rowLIKE;
      result$data['rowLIKE'] = l$rowLIKE;
    }
    if (_$data.containsKey('col')) {
      final l$col = col;
      result$data['col'] = l$col;
    }
    if (_$data.containsKey('colGT')) {
      final l$colGT = colGT;
      result$data['colGT'] = l$colGT;
    }
    if (_$data.containsKey('colGTE')) {
      final l$colGTE = colGTE;
      result$data['colGTE'] = l$colGTE;
    }
    if (_$data.containsKey('colLT')) {
      final l$colLT = colLT;
      result$data['colLT'] = l$colLT;
    }
    if (_$data.containsKey('colLTE')) {
      final l$colLTE = colLTE;
      result$data['colLTE'] = l$colLTE;
    }
    if (_$data.containsKey('colNEQ')) {
      final l$colNEQ = colNEQ;
      result$data['colNEQ'] = l$colNEQ;
    }
    if (_$data.containsKey('colEQ')) {
      final l$colEQ = colEQ;
      result$data['colEQ'] = l$colEQ;
    }
    if (_$data.containsKey('colNOTIN')) {
      final l$colNOTIN = colNOTIN;
      result$data['colNOTIN'] = l$colNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colIN')) {
      final l$colIN = colIN;
      result$data['colIN'] = l$colIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = colNOTLIKE;
      result$data['colNOTLIKE'] = l$colNOTLIKE;
    }
    if (_$data.containsKey('colLIKE')) {
      final l$colLIKE = colLIKE;
      result$data['colLIKE'] = l$colLIKE;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_MovedWhereInput<
          Input$checkers_marq_MovedWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_MovedWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_MovedWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (_$data.containsKey('session_id') !=
        other._$data.containsKey('session_id')) {
      return false;
    }
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$session_idGT = session_idGT;
    final lOther$session_idGT = other.session_idGT;
    if (_$data.containsKey('session_idGT') !=
        other._$data.containsKey('session_idGT')) {
      return false;
    }
    if (l$session_idGT != lOther$session_idGT) {
      return false;
    }
    final l$session_idGTE = session_idGTE;
    final lOther$session_idGTE = other.session_idGTE;
    if (_$data.containsKey('session_idGTE') !=
        other._$data.containsKey('session_idGTE')) {
      return false;
    }
    if (l$session_idGTE != lOther$session_idGTE) {
      return false;
    }
    final l$session_idLT = session_idLT;
    final lOther$session_idLT = other.session_idLT;
    if (_$data.containsKey('session_idLT') !=
        other._$data.containsKey('session_idLT')) {
      return false;
    }
    if (l$session_idLT != lOther$session_idLT) {
      return false;
    }
    final l$session_idLTE = session_idLTE;
    final lOther$session_idLTE = other.session_idLTE;
    if (_$data.containsKey('session_idLTE') !=
        other._$data.containsKey('session_idLTE')) {
      return false;
    }
    if (l$session_idLTE != lOther$session_idLTE) {
      return false;
    }
    final l$session_idNEQ = session_idNEQ;
    final lOther$session_idNEQ = other.session_idNEQ;
    if (_$data.containsKey('session_idNEQ') !=
        other._$data.containsKey('session_idNEQ')) {
      return false;
    }
    if (l$session_idNEQ != lOther$session_idNEQ) {
      return false;
    }
    final l$session_idEQ = session_idEQ;
    final lOther$session_idEQ = other.session_idEQ;
    if (_$data.containsKey('session_idEQ') !=
        other._$data.containsKey('session_idEQ')) {
      return false;
    }
    if (l$session_idEQ != lOther$session_idEQ) {
      return false;
    }
    final l$session_idNOTIN = session_idNOTIN;
    final lOther$session_idNOTIN = other.session_idNOTIN;
    if (_$data.containsKey('session_idNOTIN') !=
        other._$data.containsKey('session_idNOTIN')) {
      return false;
    }
    if (l$session_idNOTIN != null && lOther$session_idNOTIN != null) {
      if (l$session_idNOTIN.length != lOther$session_idNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idNOTIN.length; i++) {
        final l$session_idNOTIN$entry = l$session_idNOTIN[i];
        final lOther$session_idNOTIN$entry = lOther$session_idNOTIN[i];
        if (l$session_idNOTIN$entry != lOther$session_idNOTIN$entry) {
          return false;
        }
      }
    } else if (l$session_idNOTIN != lOther$session_idNOTIN) {
      return false;
    }
    final l$session_idIN = session_idIN;
    final lOther$session_idIN = other.session_idIN;
    if (_$data.containsKey('session_idIN') !=
        other._$data.containsKey('session_idIN')) {
      return false;
    }
    if (l$session_idIN != null && lOther$session_idIN != null) {
      if (l$session_idIN.length != lOther$session_idIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idIN.length; i++) {
        final l$session_idIN$entry = l$session_idIN[i];
        final lOther$session_idIN$entry = lOther$session_idIN[i];
        if (l$session_idIN$entry != lOther$session_idIN$entry) {
          return false;
        }
      }
    } else if (l$session_idIN != lOther$session_idIN) {
      return false;
    }
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final lOther$session_idNOTLIKE = other.session_idNOTLIKE;
    if (_$data.containsKey('session_idNOTLIKE') !=
        other._$data.containsKey('session_idNOTLIKE')) {
      return false;
    }
    if (l$session_idNOTLIKE != lOther$session_idNOTLIKE) {
      return false;
    }
    final l$session_idLIKE = session_idLIKE;
    final lOther$session_idLIKE = other.session_idLIKE;
    if (_$data.containsKey('session_idLIKE') !=
        other._$data.containsKey('session_idLIKE')) {
      return false;
    }
    if (l$session_idLIKE != lOther$session_idLIKE) {
      return false;
    }
    final l$player = player;
    final lOther$player = other.player;
    if (_$data.containsKey('player') != other._$data.containsKey('player')) {
      return false;
    }
    if (l$player != lOther$player) {
      return false;
    }
    final l$playerGT = playerGT;
    final lOther$playerGT = other.playerGT;
    if (_$data.containsKey('playerGT') !=
        other._$data.containsKey('playerGT')) {
      return false;
    }
    if (l$playerGT != lOther$playerGT) {
      return false;
    }
    final l$playerGTE = playerGTE;
    final lOther$playerGTE = other.playerGTE;
    if (_$data.containsKey('playerGTE') !=
        other._$data.containsKey('playerGTE')) {
      return false;
    }
    if (l$playerGTE != lOther$playerGTE) {
      return false;
    }
    final l$playerLT = playerLT;
    final lOther$playerLT = other.playerLT;
    if (_$data.containsKey('playerLT') !=
        other._$data.containsKey('playerLT')) {
      return false;
    }
    if (l$playerLT != lOther$playerLT) {
      return false;
    }
    final l$playerLTE = playerLTE;
    final lOther$playerLTE = other.playerLTE;
    if (_$data.containsKey('playerLTE') !=
        other._$data.containsKey('playerLTE')) {
      return false;
    }
    if (l$playerLTE != lOther$playerLTE) {
      return false;
    }
    final l$playerNEQ = playerNEQ;
    final lOther$playerNEQ = other.playerNEQ;
    if (_$data.containsKey('playerNEQ') !=
        other._$data.containsKey('playerNEQ')) {
      return false;
    }
    if (l$playerNEQ != lOther$playerNEQ) {
      return false;
    }
    final l$playerEQ = playerEQ;
    final lOther$playerEQ = other.playerEQ;
    if (_$data.containsKey('playerEQ') !=
        other._$data.containsKey('playerEQ')) {
      return false;
    }
    if (l$playerEQ != lOther$playerEQ) {
      return false;
    }
    final l$playerNOTIN = playerNOTIN;
    final lOther$playerNOTIN = other.playerNOTIN;
    if (_$data.containsKey('playerNOTIN') !=
        other._$data.containsKey('playerNOTIN')) {
      return false;
    }
    if (l$playerNOTIN != null && lOther$playerNOTIN != null) {
      if (l$playerNOTIN.length != lOther$playerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerNOTIN.length; i++) {
        final l$playerNOTIN$entry = l$playerNOTIN[i];
        final lOther$playerNOTIN$entry = lOther$playerNOTIN[i];
        if (l$playerNOTIN$entry != lOther$playerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$playerNOTIN != lOther$playerNOTIN) {
      return false;
    }
    final l$playerIN = playerIN;
    final lOther$playerIN = other.playerIN;
    if (_$data.containsKey('playerIN') !=
        other._$data.containsKey('playerIN')) {
      return false;
    }
    if (l$playerIN != null && lOther$playerIN != null) {
      if (l$playerIN.length != lOther$playerIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerIN.length; i++) {
        final l$playerIN$entry = l$playerIN[i];
        final lOther$playerIN$entry = lOther$playerIN[i];
        if (l$playerIN$entry != lOther$playerIN$entry) {
          return false;
        }
      }
    } else if (l$playerIN != lOther$playerIN) {
      return false;
    }
    final l$playerNOTLIKE = playerNOTLIKE;
    final lOther$playerNOTLIKE = other.playerNOTLIKE;
    if (_$data.containsKey('playerNOTLIKE') !=
        other._$data.containsKey('playerNOTLIKE')) {
      return false;
    }
    if (l$playerNOTLIKE != lOther$playerNOTLIKE) {
      return false;
    }
    final l$playerLIKE = playerLIKE;
    final lOther$playerLIKE = other.playerLIKE;
    if (_$data.containsKey('playerLIKE') !=
        other._$data.containsKey('playerLIKE')) {
      return false;
    }
    if (l$playerLIKE != lOther$playerLIKE) {
      return false;
    }
    final l$row = row;
    final lOther$row = other.row;
    if (_$data.containsKey('row') != other._$data.containsKey('row')) {
      return false;
    }
    if (l$row != lOther$row) {
      return false;
    }
    final l$rowGT = rowGT;
    final lOther$rowGT = other.rowGT;
    if (_$data.containsKey('rowGT') != other._$data.containsKey('rowGT')) {
      return false;
    }
    if (l$rowGT != lOther$rowGT) {
      return false;
    }
    final l$rowGTE = rowGTE;
    final lOther$rowGTE = other.rowGTE;
    if (_$data.containsKey('rowGTE') != other._$data.containsKey('rowGTE')) {
      return false;
    }
    if (l$rowGTE != lOther$rowGTE) {
      return false;
    }
    final l$rowLT = rowLT;
    final lOther$rowLT = other.rowLT;
    if (_$data.containsKey('rowLT') != other._$data.containsKey('rowLT')) {
      return false;
    }
    if (l$rowLT != lOther$rowLT) {
      return false;
    }
    final l$rowLTE = rowLTE;
    final lOther$rowLTE = other.rowLTE;
    if (_$data.containsKey('rowLTE') != other._$data.containsKey('rowLTE')) {
      return false;
    }
    if (l$rowLTE != lOther$rowLTE) {
      return false;
    }
    final l$rowNEQ = rowNEQ;
    final lOther$rowNEQ = other.rowNEQ;
    if (_$data.containsKey('rowNEQ') != other._$data.containsKey('rowNEQ')) {
      return false;
    }
    if (l$rowNEQ != lOther$rowNEQ) {
      return false;
    }
    final l$rowEQ = rowEQ;
    final lOther$rowEQ = other.rowEQ;
    if (_$data.containsKey('rowEQ') != other._$data.containsKey('rowEQ')) {
      return false;
    }
    if (l$rowEQ != lOther$rowEQ) {
      return false;
    }
    final l$rowNOTIN = rowNOTIN;
    final lOther$rowNOTIN = other.rowNOTIN;
    if (_$data.containsKey('rowNOTIN') !=
        other._$data.containsKey('rowNOTIN')) {
      return false;
    }
    if (l$rowNOTIN != null && lOther$rowNOTIN != null) {
      if (l$rowNOTIN.length != lOther$rowNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowNOTIN.length; i++) {
        final l$rowNOTIN$entry = l$rowNOTIN[i];
        final lOther$rowNOTIN$entry = lOther$rowNOTIN[i];
        if (l$rowNOTIN$entry != lOther$rowNOTIN$entry) {
          return false;
        }
      }
    } else if (l$rowNOTIN != lOther$rowNOTIN) {
      return false;
    }
    final l$rowIN = rowIN;
    final lOther$rowIN = other.rowIN;
    if (_$data.containsKey('rowIN') != other._$data.containsKey('rowIN')) {
      return false;
    }
    if (l$rowIN != null && lOther$rowIN != null) {
      if (l$rowIN.length != lOther$rowIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowIN.length; i++) {
        final l$rowIN$entry = l$rowIN[i];
        final lOther$rowIN$entry = lOther$rowIN[i];
        if (l$rowIN$entry != lOther$rowIN$entry) {
          return false;
        }
      }
    } else if (l$rowIN != lOther$rowIN) {
      return false;
    }
    final l$rowNOTLIKE = rowNOTLIKE;
    final lOther$rowNOTLIKE = other.rowNOTLIKE;
    if (_$data.containsKey('rowNOTLIKE') !=
        other._$data.containsKey('rowNOTLIKE')) {
      return false;
    }
    if (l$rowNOTLIKE != lOther$rowNOTLIKE) {
      return false;
    }
    final l$rowLIKE = rowLIKE;
    final lOther$rowLIKE = other.rowLIKE;
    if (_$data.containsKey('rowLIKE') != other._$data.containsKey('rowLIKE')) {
      return false;
    }
    if (l$rowLIKE != lOther$rowLIKE) {
      return false;
    }
    final l$col = col;
    final lOther$col = other.col;
    if (_$data.containsKey('col') != other._$data.containsKey('col')) {
      return false;
    }
    if (l$col != lOther$col) {
      return false;
    }
    final l$colGT = colGT;
    final lOther$colGT = other.colGT;
    if (_$data.containsKey('colGT') != other._$data.containsKey('colGT')) {
      return false;
    }
    if (l$colGT != lOther$colGT) {
      return false;
    }
    final l$colGTE = colGTE;
    final lOther$colGTE = other.colGTE;
    if (_$data.containsKey('colGTE') != other._$data.containsKey('colGTE')) {
      return false;
    }
    if (l$colGTE != lOther$colGTE) {
      return false;
    }
    final l$colLT = colLT;
    final lOther$colLT = other.colLT;
    if (_$data.containsKey('colLT') != other._$data.containsKey('colLT')) {
      return false;
    }
    if (l$colLT != lOther$colLT) {
      return false;
    }
    final l$colLTE = colLTE;
    final lOther$colLTE = other.colLTE;
    if (_$data.containsKey('colLTE') != other._$data.containsKey('colLTE')) {
      return false;
    }
    if (l$colLTE != lOther$colLTE) {
      return false;
    }
    final l$colNEQ = colNEQ;
    final lOther$colNEQ = other.colNEQ;
    if (_$data.containsKey('colNEQ') != other._$data.containsKey('colNEQ')) {
      return false;
    }
    if (l$colNEQ != lOther$colNEQ) {
      return false;
    }
    final l$colEQ = colEQ;
    final lOther$colEQ = other.colEQ;
    if (_$data.containsKey('colEQ') != other._$data.containsKey('colEQ')) {
      return false;
    }
    if (l$colEQ != lOther$colEQ) {
      return false;
    }
    final l$colNOTIN = colNOTIN;
    final lOther$colNOTIN = other.colNOTIN;
    if (_$data.containsKey('colNOTIN') !=
        other._$data.containsKey('colNOTIN')) {
      return false;
    }
    if (l$colNOTIN != null && lOther$colNOTIN != null) {
      if (l$colNOTIN.length != lOther$colNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$colNOTIN.length; i++) {
        final l$colNOTIN$entry = l$colNOTIN[i];
        final lOther$colNOTIN$entry = lOther$colNOTIN[i];
        if (l$colNOTIN$entry != lOther$colNOTIN$entry) {
          return false;
        }
      }
    } else if (l$colNOTIN != lOther$colNOTIN) {
      return false;
    }
    final l$colIN = colIN;
    final lOther$colIN = other.colIN;
    if (_$data.containsKey('colIN') != other._$data.containsKey('colIN')) {
      return false;
    }
    if (l$colIN != null && lOther$colIN != null) {
      if (l$colIN.length != lOther$colIN.length) {
        return false;
      }
      for (int i = 0; i < l$colIN.length; i++) {
        final l$colIN$entry = l$colIN[i];
        final lOther$colIN$entry = lOther$colIN[i];
        if (l$colIN$entry != lOther$colIN$entry) {
          return false;
        }
      }
    } else if (l$colIN != lOther$colIN) {
      return false;
    }
    final l$colNOTLIKE = colNOTLIKE;
    final lOther$colNOTLIKE = other.colNOTLIKE;
    if (_$data.containsKey('colNOTLIKE') !=
        other._$data.containsKey('colNOTLIKE')) {
      return false;
    }
    if (l$colNOTLIKE != lOther$colNOTLIKE) {
      return false;
    }
    final l$colLIKE = colLIKE;
    final lOther$colLIKE = other.colLIKE;
    if (_$data.containsKey('colLIKE') != other._$data.containsKey('colLIKE')) {
      return false;
    }
    if (l$colLIKE != lOther$colLIKE) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$session_idGT = session_idGT;
    final l$session_idGTE = session_idGTE;
    final l$session_idLT = session_idLT;
    final l$session_idLTE = session_idLTE;
    final l$session_idNEQ = session_idNEQ;
    final l$session_idEQ = session_idEQ;
    final l$session_idNOTIN = session_idNOTIN;
    final l$session_idIN = session_idIN;
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final l$session_idLIKE = session_idLIKE;
    final l$player = player;
    final l$playerGT = playerGT;
    final l$playerGTE = playerGTE;
    final l$playerLT = playerLT;
    final l$playerLTE = playerLTE;
    final l$playerNEQ = playerNEQ;
    final l$playerEQ = playerEQ;
    final l$playerNOTIN = playerNOTIN;
    final l$playerIN = playerIN;
    final l$playerNOTLIKE = playerNOTLIKE;
    final l$playerLIKE = playerLIKE;
    final l$row = row;
    final l$rowGT = rowGT;
    final l$rowGTE = rowGTE;
    final l$rowLT = rowLT;
    final l$rowLTE = rowLTE;
    final l$rowNEQ = rowNEQ;
    final l$rowEQ = rowEQ;
    final l$rowNOTIN = rowNOTIN;
    final l$rowIN = rowIN;
    final l$rowNOTLIKE = rowNOTLIKE;
    final l$rowLIKE = rowLIKE;
    final l$col = col;
    final l$colGT = colGT;
    final l$colGTE = colGTE;
    final l$colLT = colLT;
    final l$colLTE = colLTE;
    final l$colNEQ = colNEQ;
    final l$colEQ = colEQ;
    final l$colNOTIN = colNOTIN;
    final l$colIN = colIN;
    final l$colNOTLIKE = colNOTLIKE;
    final l$colLIKE = colLIKE;
    return Object.hashAll([
      _$data.containsKey('session_id') ? l$session_id : const {},
      _$data.containsKey('session_idGT') ? l$session_idGT : const {},
      _$data.containsKey('session_idGTE') ? l$session_idGTE : const {},
      _$data.containsKey('session_idLT') ? l$session_idLT : const {},
      _$data.containsKey('session_idLTE') ? l$session_idLTE : const {},
      _$data.containsKey('session_idNEQ') ? l$session_idNEQ : const {},
      _$data.containsKey('session_idEQ') ? l$session_idEQ : const {},
      _$data.containsKey('session_idNOTIN')
          ? l$session_idNOTIN == null
              ? null
              : Object.hashAll(l$session_idNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idIN')
          ? l$session_idIN == null
              ? null
              : Object.hashAll(l$session_idIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idNOTLIKE') ? l$session_idNOTLIKE : const {},
      _$data.containsKey('session_idLIKE') ? l$session_idLIKE : const {},
      _$data.containsKey('player') ? l$player : const {},
      _$data.containsKey('playerGT') ? l$playerGT : const {},
      _$data.containsKey('playerGTE') ? l$playerGTE : const {},
      _$data.containsKey('playerLT') ? l$playerLT : const {},
      _$data.containsKey('playerLTE') ? l$playerLTE : const {},
      _$data.containsKey('playerNEQ') ? l$playerNEQ : const {},
      _$data.containsKey('playerEQ') ? l$playerEQ : const {},
      _$data.containsKey('playerNOTIN')
          ? l$playerNOTIN == null
              ? null
              : Object.hashAll(l$playerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('playerIN')
          ? l$playerIN == null
              ? null
              : Object.hashAll(l$playerIN.map((v) => v))
          : const {},
      _$data.containsKey('playerNOTLIKE') ? l$playerNOTLIKE : const {},
      _$data.containsKey('playerLIKE') ? l$playerLIKE : const {},
      _$data.containsKey('row') ? l$row : const {},
      _$data.containsKey('rowGT') ? l$rowGT : const {},
      _$data.containsKey('rowGTE') ? l$rowGTE : const {},
      _$data.containsKey('rowLT') ? l$rowLT : const {},
      _$data.containsKey('rowLTE') ? l$rowLTE : const {},
      _$data.containsKey('rowNEQ') ? l$rowNEQ : const {},
      _$data.containsKey('rowEQ') ? l$rowEQ : const {},
      _$data.containsKey('rowNOTIN')
          ? l$rowNOTIN == null
              ? null
              : Object.hashAll(l$rowNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('rowIN')
          ? l$rowIN == null
              ? null
              : Object.hashAll(l$rowIN.map((v) => v))
          : const {},
      _$data.containsKey('rowNOTLIKE') ? l$rowNOTLIKE : const {},
      _$data.containsKey('rowLIKE') ? l$rowLIKE : const {},
      _$data.containsKey('col') ? l$col : const {},
      _$data.containsKey('colGT') ? l$colGT : const {},
      _$data.containsKey('colGTE') ? l$colGTE : const {},
      _$data.containsKey('colLT') ? l$colLT : const {},
      _$data.containsKey('colLTE') ? l$colLTE : const {},
      _$data.containsKey('colNEQ') ? l$colNEQ : const {},
      _$data.containsKey('colEQ') ? l$colEQ : const {},
      _$data.containsKey('colNOTIN')
          ? l$colNOTIN == null
              ? null
              : Object.hashAll(l$colNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('colIN')
          ? l$colIN == null
              ? null
              : Object.hashAll(l$colIN.map((v) => v))
          : const {},
      _$data.containsKey('colNOTLIKE') ? l$colNOTLIKE : const {},
      _$data.containsKey('colLIKE') ? l$colLIKE : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_MovedWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_MovedWhereInput(
    Input$checkers_marq_MovedWhereInput instance,
    TRes Function(Input$checkers_marq_MovedWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_MovedWhereInput;

  factory CopyWith$Input$checkers_marq_MovedWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_MovedWhereInput;

  TRes call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  });
}

class _CopyWithImpl$Input$checkers_marq_MovedWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_MovedWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_MovedWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_MovedWhereInput _instance;

  final TRes Function(Input$checkers_marq_MovedWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? session_id = _undefined,
    Object? session_idGT = _undefined,
    Object? session_idGTE = _undefined,
    Object? session_idLT = _undefined,
    Object? session_idLTE = _undefined,
    Object? session_idNEQ = _undefined,
    Object? session_idEQ = _undefined,
    Object? session_idNOTIN = _undefined,
    Object? session_idIN = _undefined,
    Object? session_idNOTLIKE = _undefined,
    Object? session_idLIKE = _undefined,
    Object? player = _undefined,
    Object? playerGT = _undefined,
    Object? playerGTE = _undefined,
    Object? playerLT = _undefined,
    Object? playerLTE = _undefined,
    Object? playerNEQ = _undefined,
    Object? playerEQ = _undefined,
    Object? playerNOTIN = _undefined,
    Object? playerIN = _undefined,
    Object? playerNOTLIKE = _undefined,
    Object? playerLIKE = _undefined,
    Object? row = _undefined,
    Object? rowGT = _undefined,
    Object? rowGTE = _undefined,
    Object? rowLT = _undefined,
    Object? rowLTE = _undefined,
    Object? rowNEQ = _undefined,
    Object? rowEQ = _undefined,
    Object? rowNOTIN = _undefined,
    Object? rowIN = _undefined,
    Object? rowNOTLIKE = _undefined,
    Object? rowLIKE = _undefined,
    Object? col = _undefined,
    Object? colGT = _undefined,
    Object? colGTE = _undefined,
    Object? colLT = _undefined,
    Object? colLTE = _undefined,
    Object? colNEQ = _undefined,
    Object? colEQ = _undefined,
    Object? colNOTIN = _undefined,
    Object? colIN = _undefined,
    Object? colNOTLIKE = _undefined,
    Object? colLIKE = _undefined,
  }) =>
      _then(Input$checkers_marq_MovedWhereInput._({
        ..._instance._$data,
        if (session_id != _undefined) 'session_id': (session_id as String?),
        if (session_idGT != _undefined)
          'session_idGT': (session_idGT as String?),
        if (session_idGTE != _undefined)
          'session_idGTE': (session_idGTE as String?),
        if (session_idLT != _undefined)
          'session_idLT': (session_idLT as String?),
        if (session_idLTE != _undefined)
          'session_idLTE': (session_idLTE as String?),
        if (session_idNEQ != _undefined)
          'session_idNEQ': (session_idNEQ as String?),
        if (session_idEQ != _undefined)
          'session_idEQ': (session_idEQ as String?),
        if (session_idNOTIN != _undefined)
          'session_idNOTIN': (session_idNOTIN as List<String?>?),
        if (session_idIN != _undefined)
          'session_idIN': (session_idIN as List<String?>?),
        if (session_idNOTLIKE != _undefined)
          'session_idNOTLIKE': (session_idNOTLIKE as String?),
        if (session_idLIKE != _undefined)
          'session_idLIKE': (session_idLIKE as String?),
        if (player != _undefined) 'player': (player as String?),
        if (playerGT != _undefined) 'playerGT': (playerGT as String?),
        if (playerGTE != _undefined) 'playerGTE': (playerGTE as String?),
        if (playerLT != _undefined) 'playerLT': (playerLT as String?),
        if (playerLTE != _undefined) 'playerLTE': (playerLTE as String?),
        if (playerNEQ != _undefined) 'playerNEQ': (playerNEQ as String?),
        if (playerEQ != _undefined) 'playerEQ': (playerEQ as String?),
        if (playerNOTIN != _undefined)
          'playerNOTIN': (playerNOTIN as List<String?>?),
        if (playerIN != _undefined) 'playerIN': (playerIN as List<String?>?),
        if (playerNOTLIKE != _undefined)
          'playerNOTLIKE': (playerNOTLIKE as String?),
        if (playerLIKE != _undefined) 'playerLIKE': (playerLIKE as String?),
        if (row != _undefined) 'row': (row as String?),
        if (rowGT != _undefined) 'rowGT': (rowGT as String?),
        if (rowGTE != _undefined) 'rowGTE': (rowGTE as String?),
        if (rowLT != _undefined) 'rowLT': (rowLT as String?),
        if (rowLTE != _undefined) 'rowLTE': (rowLTE as String?),
        if (rowNEQ != _undefined) 'rowNEQ': (rowNEQ as String?),
        if (rowEQ != _undefined) 'rowEQ': (rowEQ as String?),
        if (rowNOTIN != _undefined) 'rowNOTIN': (rowNOTIN as List<String?>?),
        if (rowIN != _undefined) 'rowIN': (rowIN as List<String?>?),
        if (rowNOTLIKE != _undefined) 'rowNOTLIKE': (rowNOTLIKE as String?),
        if (rowLIKE != _undefined) 'rowLIKE': (rowLIKE as String?),
        if (col != _undefined) 'col': (col as String?),
        if (colGT != _undefined) 'colGT': (colGT as String?),
        if (colGTE != _undefined) 'colGTE': (colGTE as String?),
        if (colLT != _undefined) 'colLT': (colLT as String?),
        if (colLTE != _undefined) 'colLTE': (colLTE as String?),
        if (colNEQ != _undefined) 'colNEQ': (colNEQ as String?),
        if (colEQ != _undefined) 'colEQ': (colEQ as String?),
        if (colNOTIN != _undefined) 'colNOTIN': (colNOTIN as List<String?>?),
        if (colIN != _undefined) 'colIN': (colIN as List<String?>?),
        if (colNOTLIKE != _undefined) 'colNOTLIKE': (colNOTLIKE as String?),
        if (colLIKE != _undefined) 'colLIKE': (colLIKE as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_MovedWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_MovedWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_MovedWhereInput(this._res);

  TRes _res;

  call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
  }) =>
      _res;
}

class Input$checkers_marq_PieceOrder {
  factory Input$checkers_marq_PieceOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_PieceOrderField field,
  }) =>
      Input$checkers_marq_PieceOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_PieceOrder._(this._$data);

  factory Input$checkers_marq_PieceOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_PieceOrderField((l$field as String));
    return Input$checkers_marq_PieceOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_PieceOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_PieceOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_PieceOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_PieceOrder<Input$checkers_marq_PieceOrder>
      get copyWith => CopyWith$Input$checkers_marq_PieceOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_PieceOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_PieceOrder<TRes> {
  factory CopyWith$Input$checkers_marq_PieceOrder(
    Input$checkers_marq_PieceOrder instance,
    TRes Function(Input$checkers_marq_PieceOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_PieceOrder;

  factory CopyWith$Input$checkers_marq_PieceOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_PieceOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_PieceOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_PieceOrder<TRes>
    implements CopyWith$Input$checkers_marq_PieceOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_PieceOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_PieceOrder _instance;

  final TRes Function(Input$checkers_marq_PieceOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_PieceOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_PieceOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_PieceOrder<TRes>
    implements CopyWith$Input$checkers_marq_PieceOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_PieceOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_PieceOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_PieceWhereInput {
  factory Input$checkers_marq_PieceWhereInput({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? position,
    String? is_king,
    String? is_alive,
  }) =>
      Input$checkers_marq_PieceWhereInput._({
        if (session_id != null) r'session_id': session_id,
        if (session_idGT != null) r'session_idGT': session_idGT,
        if (session_idGTE != null) r'session_idGTE': session_idGTE,
        if (session_idLT != null) r'session_idLT': session_idLT,
        if (session_idLTE != null) r'session_idLTE': session_idLTE,
        if (session_idNEQ != null) r'session_idNEQ': session_idNEQ,
        if (session_idEQ != null) r'session_idEQ': session_idEQ,
        if (session_idNOTIN != null) r'session_idNOTIN': session_idNOTIN,
        if (session_idIN != null) r'session_idIN': session_idIN,
        if (session_idNOTLIKE != null) r'session_idNOTLIKE': session_idNOTLIKE,
        if (session_idLIKE != null) r'session_idLIKE': session_idLIKE,
        if (row != null) r'row': row,
        if (rowGT != null) r'rowGT': rowGT,
        if (rowGTE != null) r'rowGTE': rowGTE,
        if (rowLT != null) r'rowLT': rowLT,
        if (rowLTE != null) r'rowLTE': rowLTE,
        if (rowNEQ != null) r'rowNEQ': rowNEQ,
        if (rowEQ != null) r'rowEQ': rowEQ,
        if (rowNOTIN != null) r'rowNOTIN': rowNOTIN,
        if (rowIN != null) r'rowIN': rowIN,
        if (rowNOTLIKE != null) r'rowNOTLIKE': rowNOTLIKE,
        if (rowLIKE != null) r'rowLIKE': rowLIKE,
        if (col != null) r'col': col,
        if (colGT != null) r'colGT': colGT,
        if (colGTE != null) r'colGTE': colGTE,
        if (colLT != null) r'colLT': colLT,
        if (colLTE != null) r'colLTE': colLTE,
        if (colNEQ != null) r'colNEQ': colNEQ,
        if (colEQ != null) r'colEQ': colEQ,
        if (colNOTIN != null) r'colNOTIN': colNOTIN,
        if (colIN != null) r'colIN': colIN,
        if (colNOTLIKE != null) r'colNOTLIKE': colNOTLIKE,
        if (colLIKE != null) r'colLIKE': colLIKE,
        if (player != null) r'player': player,
        if (playerGT != null) r'playerGT': playerGT,
        if (playerGTE != null) r'playerGTE': playerGTE,
        if (playerLT != null) r'playerLT': playerLT,
        if (playerLTE != null) r'playerLTE': playerLTE,
        if (playerNEQ != null) r'playerNEQ': playerNEQ,
        if (playerEQ != null) r'playerEQ': playerEQ,
        if (playerNOTIN != null) r'playerNOTIN': playerNOTIN,
        if (playerIN != null) r'playerIN': playerIN,
        if (playerNOTLIKE != null) r'playerNOTLIKE': playerNOTLIKE,
        if (playerLIKE != null) r'playerLIKE': playerLIKE,
        if (position != null) r'position': position,
        if (is_king != null) r'is_king': is_king,
        if (is_alive != null) r'is_alive': is_alive,
      });

  Input$checkers_marq_PieceWhereInput._(this._$data);

  factory Input$checkers_marq_PieceWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('session_id')) {
      final l$session_id = data['session_id'];
      result$data['session_id'] = (l$session_id as String?);
    }
    if (data.containsKey('session_idGT')) {
      final l$session_idGT = data['session_idGT'];
      result$data['session_idGT'] = (l$session_idGT as String?);
    }
    if (data.containsKey('session_idGTE')) {
      final l$session_idGTE = data['session_idGTE'];
      result$data['session_idGTE'] = (l$session_idGTE as String?);
    }
    if (data.containsKey('session_idLT')) {
      final l$session_idLT = data['session_idLT'];
      result$data['session_idLT'] = (l$session_idLT as String?);
    }
    if (data.containsKey('session_idLTE')) {
      final l$session_idLTE = data['session_idLTE'];
      result$data['session_idLTE'] = (l$session_idLTE as String?);
    }
    if (data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = data['session_idNEQ'];
      result$data['session_idNEQ'] = (l$session_idNEQ as String?);
    }
    if (data.containsKey('session_idEQ')) {
      final l$session_idEQ = data['session_idEQ'];
      result$data['session_idEQ'] = (l$session_idEQ as String?);
    }
    if (data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = data['session_idNOTIN'];
      result$data['session_idNOTIN'] = (l$session_idNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idIN')) {
      final l$session_idIN = data['session_idIN'];
      result$data['session_idIN'] = (l$session_idIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = data['session_idNOTLIKE'];
      result$data['session_idNOTLIKE'] = (l$session_idNOTLIKE as String?);
    }
    if (data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = data['session_idLIKE'];
      result$data['session_idLIKE'] = (l$session_idLIKE as String?);
    }
    if (data.containsKey('row')) {
      final l$row = data['row'];
      result$data['row'] = (l$row as String?);
    }
    if (data.containsKey('rowGT')) {
      final l$rowGT = data['rowGT'];
      result$data['rowGT'] = (l$rowGT as String?);
    }
    if (data.containsKey('rowGTE')) {
      final l$rowGTE = data['rowGTE'];
      result$data['rowGTE'] = (l$rowGTE as String?);
    }
    if (data.containsKey('rowLT')) {
      final l$rowLT = data['rowLT'];
      result$data['rowLT'] = (l$rowLT as String?);
    }
    if (data.containsKey('rowLTE')) {
      final l$rowLTE = data['rowLTE'];
      result$data['rowLTE'] = (l$rowLTE as String?);
    }
    if (data.containsKey('rowNEQ')) {
      final l$rowNEQ = data['rowNEQ'];
      result$data['rowNEQ'] = (l$rowNEQ as String?);
    }
    if (data.containsKey('rowEQ')) {
      final l$rowEQ = data['rowEQ'];
      result$data['rowEQ'] = (l$rowEQ as String?);
    }
    if (data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = data['rowNOTIN'];
      result$data['rowNOTIN'] =
          (l$rowNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowIN')) {
      final l$rowIN = data['rowIN'];
      result$data['rowIN'] =
          (l$rowIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = data['rowNOTLIKE'];
      result$data['rowNOTLIKE'] = (l$rowNOTLIKE as String?);
    }
    if (data.containsKey('rowLIKE')) {
      final l$rowLIKE = data['rowLIKE'];
      result$data['rowLIKE'] = (l$rowLIKE as String?);
    }
    if (data.containsKey('col')) {
      final l$col = data['col'];
      result$data['col'] = (l$col as String?);
    }
    if (data.containsKey('colGT')) {
      final l$colGT = data['colGT'];
      result$data['colGT'] = (l$colGT as String?);
    }
    if (data.containsKey('colGTE')) {
      final l$colGTE = data['colGTE'];
      result$data['colGTE'] = (l$colGTE as String?);
    }
    if (data.containsKey('colLT')) {
      final l$colLT = data['colLT'];
      result$data['colLT'] = (l$colLT as String?);
    }
    if (data.containsKey('colLTE')) {
      final l$colLTE = data['colLTE'];
      result$data['colLTE'] = (l$colLTE as String?);
    }
    if (data.containsKey('colNEQ')) {
      final l$colNEQ = data['colNEQ'];
      result$data['colNEQ'] = (l$colNEQ as String?);
    }
    if (data.containsKey('colEQ')) {
      final l$colEQ = data['colEQ'];
      result$data['colEQ'] = (l$colEQ as String?);
    }
    if (data.containsKey('colNOTIN')) {
      final l$colNOTIN = data['colNOTIN'];
      result$data['colNOTIN'] =
          (l$colNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colIN')) {
      final l$colIN = data['colIN'];
      result$data['colIN'] =
          (l$colIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = data['colNOTLIKE'];
      result$data['colNOTLIKE'] = (l$colNOTLIKE as String?);
    }
    if (data.containsKey('colLIKE')) {
      final l$colLIKE = data['colLIKE'];
      result$data['colLIKE'] = (l$colLIKE as String?);
    }
    if (data.containsKey('player')) {
      final l$player = data['player'];
      result$data['player'] = (l$player as String?);
    }
    if (data.containsKey('playerGT')) {
      final l$playerGT = data['playerGT'];
      result$data['playerGT'] = (l$playerGT as String?);
    }
    if (data.containsKey('playerGTE')) {
      final l$playerGTE = data['playerGTE'];
      result$data['playerGTE'] = (l$playerGTE as String?);
    }
    if (data.containsKey('playerLT')) {
      final l$playerLT = data['playerLT'];
      result$data['playerLT'] = (l$playerLT as String?);
    }
    if (data.containsKey('playerLTE')) {
      final l$playerLTE = data['playerLTE'];
      result$data['playerLTE'] = (l$playerLTE as String?);
    }
    if (data.containsKey('playerNEQ')) {
      final l$playerNEQ = data['playerNEQ'];
      result$data['playerNEQ'] = (l$playerNEQ as String?);
    }
    if (data.containsKey('playerEQ')) {
      final l$playerEQ = data['playerEQ'];
      result$data['playerEQ'] = (l$playerEQ as String?);
    }
    if (data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = data['playerNOTIN'];
      result$data['playerNOTIN'] = (l$playerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('playerIN')) {
      final l$playerIN = data['playerIN'];
      result$data['playerIN'] =
          (l$playerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = data['playerNOTLIKE'];
      result$data['playerNOTLIKE'] = (l$playerNOTLIKE as String?);
    }
    if (data.containsKey('playerLIKE')) {
      final l$playerLIKE = data['playerLIKE'];
      result$data['playerLIKE'] = (l$playerLIKE as String?);
    }
    if (data.containsKey('position')) {
      final l$position = data['position'];
      result$data['position'] = (l$position as String?);
    }
    if (data.containsKey('is_king')) {
      final l$is_king = data['is_king'];
      result$data['is_king'] = (l$is_king as String?);
    }
    if (data.containsKey('is_alive')) {
      final l$is_alive = data['is_alive'];
      result$data['is_alive'] = (l$is_alive as String?);
    }
    return Input$checkers_marq_PieceWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get session_id => (_$data['session_id'] as String?);

  String? get session_idGT => (_$data['session_idGT'] as String?);

  String? get session_idGTE => (_$data['session_idGTE'] as String?);

  String? get session_idLT => (_$data['session_idLT'] as String?);

  String? get session_idLTE => (_$data['session_idLTE'] as String?);

  String? get session_idNEQ => (_$data['session_idNEQ'] as String?);

  String? get session_idEQ => (_$data['session_idEQ'] as String?);

  List<String?>? get session_idNOTIN =>
      (_$data['session_idNOTIN'] as List<String?>?);

  List<String?>? get session_idIN => (_$data['session_idIN'] as List<String?>?);

  String? get session_idNOTLIKE => (_$data['session_idNOTLIKE'] as String?);

  String? get session_idLIKE => (_$data['session_idLIKE'] as String?);

  String? get row => (_$data['row'] as String?);

  String? get rowGT => (_$data['rowGT'] as String?);

  String? get rowGTE => (_$data['rowGTE'] as String?);

  String? get rowLT => (_$data['rowLT'] as String?);

  String? get rowLTE => (_$data['rowLTE'] as String?);

  String? get rowNEQ => (_$data['rowNEQ'] as String?);

  String? get rowEQ => (_$data['rowEQ'] as String?);

  List<String?>? get rowNOTIN => (_$data['rowNOTIN'] as List<String?>?);

  List<String?>? get rowIN => (_$data['rowIN'] as List<String?>?);

  String? get rowNOTLIKE => (_$data['rowNOTLIKE'] as String?);

  String? get rowLIKE => (_$data['rowLIKE'] as String?);

  String? get col => (_$data['col'] as String?);

  String? get colGT => (_$data['colGT'] as String?);

  String? get colGTE => (_$data['colGTE'] as String?);

  String? get colLT => (_$data['colLT'] as String?);

  String? get colLTE => (_$data['colLTE'] as String?);

  String? get colNEQ => (_$data['colNEQ'] as String?);

  String? get colEQ => (_$data['colEQ'] as String?);

  List<String?>? get colNOTIN => (_$data['colNOTIN'] as List<String?>?);

  List<String?>? get colIN => (_$data['colIN'] as List<String?>?);

  String? get colNOTLIKE => (_$data['colNOTLIKE'] as String?);

  String? get colLIKE => (_$data['colLIKE'] as String?);

  String? get player => (_$data['player'] as String?);

  String? get playerGT => (_$data['playerGT'] as String?);

  String? get playerGTE => (_$data['playerGTE'] as String?);

  String? get playerLT => (_$data['playerLT'] as String?);

  String? get playerLTE => (_$data['playerLTE'] as String?);

  String? get playerNEQ => (_$data['playerNEQ'] as String?);

  String? get playerEQ => (_$data['playerEQ'] as String?);

  List<String?>? get playerNOTIN => (_$data['playerNOTIN'] as List<String?>?);

  List<String?>? get playerIN => (_$data['playerIN'] as List<String?>?);

  String? get playerNOTLIKE => (_$data['playerNOTLIKE'] as String?);

  String? get playerLIKE => (_$data['playerLIKE'] as String?);

  String? get position => (_$data['position'] as String?);

  String? get is_king => (_$data['is_king'] as String?);

  String? get is_alive => (_$data['is_alive'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('session_id')) {
      final l$session_id = session_id;
      result$data['session_id'] = l$session_id;
    }
    if (_$data.containsKey('session_idGT')) {
      final l$session_idGT = session_idGT;
      result$data['session_idGT'] = l$session_idGT;
    }
    if (_$data.containsKey('session_idGTE')) {
      final l$session_idGTE = session_idGTE;
      result$data['session_idGTE'] = l$session_idGTE;
    }
    if (_$data.containsKey('session_idLT')) {
      final l$session_idLT = session_idLT;
      result$data['session_idLT'] = l$session_idLT;
    }
    if (_$data.containsKey('session_idLTE')) {
      final l$session_idLTE = session_idLTE;
      result$data['session_idLTE'] = l$session_idLTE;
    }
    if (_$data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = session_idNEQ;
      result$data['session_idNEQ'] = l$session_idNEQ;
    }
    if (_$data.containsKey('session_idEQ')) {
      final l$session_idEQ = session_idEQ;
      result$data['session_idEQ'] = l$session_idEQ;
    }
    if (_$data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = session_idNOTIN;
      result$data['session_idNOTIN'] =
          l$session_idNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idIN')) {
      final l$session_idIN = session_idIN;
      result$data['session_idIN'] = l$session_idIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = session_idNOTLIKE;
      result$data['session_idNOTLIKE'] = l$session_idNOTLIKE;
    }
    if (_$data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = session_idLIKE;
      result$data['session_idLIKE'] = l$session_idLIKE;
    }
    if (_$data.containsKey('row')) {
      final l$row = row;
      result$data['row'] = l$row;
    }
    if (_$data.containsKey('rowGT')) {
      final l$rowGT = rowGT;
      result$data['rowGT'] = l$rowGT;
    }
    if (_$data.containsKey('rowGTE')) {
      final l$rowGTE = rowGTE;
      result$data['rowGTE'] = l$rowGTE;
    }
    if (_$data.containsKey('rowLT')) {
      final l$rowLT = rowLT;
      result$data['rowLT'] = l$rowLT;
    }
    if (_$data.containsKey('rowLTE')) {
      final l$rowLTE = rowLTE;
      result$data['rowLTE'] = l$rowLTE;
    }
    if (_$data.containsKey('rowNEQ')) {
      final l$rowNEQ = rowNEQ;
      result$data['rowNEQ'] = l$rowNEQ;
    }
    if (_$data.containsKey('rowEQ')) {
      final l$rowEQ = rowEQ;
      result$data['rowEQ'] = l$rowEQ;
    }
    if (_$data.containsKey('rowNOTIN')) {
      final l$rowNOTIN = rowNOTIN;
      result$data['rowNOTIN'] = l$rowNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowIN')) {
      final l$rowIN = rowIN;
      result$data['rowIN'] = l$rowIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('rowNOTLIKE')) {
      final l$rowNOTLIKE = rowNOTLIKE;
      result$data['rowNOTLIKE'] = l$rowNOTLIKE;
    }
    if (_$data.containsKey('rowLIKE')) {
      final l$rowLIKE = rowLIKE;
      result$data['rowLIKE'] = l$rowLIKE;
    }
    if (_$data.containsKey('col')) {
      final l$col = col;
      result$data['col'] = l$col;
    }
    if (_$data.containsKey('colGT')) {
      final l$colGT = colGT;
      result$data['colGT'] = l$colGT;
    }
    if (_$data.containsKey('colGTE')) {
      final l$colGTE = colGTE;
      result$data['colGTE'] = l$colGTE;
    }
    if (_$data.containsKey('colLT')) {
      final l$colLT = colLT;
      result$data['colLT'] = l$colLT;
    }
    if (_$data.containsKey('colLTE')) {
      final l$colLTE = colLTE;
      result$data['colLTE'] = l$colLTE;
    }
    if (_$data.containsKey('colNEQ')) {
      final l$colNEQ = colNEQ;
      result$data['colNEQ'] = l$colNEQ;
    }
    if (_$data.containsKey('colEQ')) {
      final l$colEQ = colEQ;
      result$data['colEQ'] = l$colEQ;
    }
    if (_$data.containsKey('colNOTIN')) {
      final l$colNOTIN = colNOTIN;
      result$data['colNOTIN'] = l$colNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colIN')) {
      final l$colIN = colIN;
      result$data['colIN'] = l$colIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('colNOTLIKE')) {
      final l$colNOTLIKE = colNOTLIKE;
      result$data['colNOTLIKE'] = l$colNOTLIKE;
    }
    if (_$data.containsKey('colLIKE')) {
      final l$colLIKE = colLIKE;
      result$data['colLIKE'] = l$colLIKE;
    }
    if (_$data.containsKey('player')) {
      final l$player = player;
      result$data['player'] = l$player;
    }
    if (_$data.containsKey('playerGT')) {
      final l$playerGT = playerGT;
      result$data['playerGT'] = l$playerGT;
    }
    if (_$data.containsKey('playerGTE')) {
      final l$playerGTE = playerGTE;
      result$data['playerGTE'] = l$playerGTE;
    }
    if (_$data.containsKey('playerLT')) {
      final l$playerLT = playerLT;
      result$data['playerLT'] = l$playerLT;
    }
    if (_$data.containsKey('playerLTE')) {
      final l$playerLTE = playerLTE;
      result$data['playerLTE'] = l$playerLTE;
    }
    if (_$data.containsKey('playerNEQ')) {
      final l$playerNEQ = playerNEQ;
      result$data['playerNEQ'] = l$playerNEQ;
    }
    if (_$data.containsKey('playerEQ')) {
      final l$playerEQ = playerEQ;
      result$data['playerEQ'] = l$playerEQ;
    }
    if (_$data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = playerNOTIN;
      result$data['playerNOTIN'] = l$playerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerIN')) {
      final l$playerIN = playerIN;
      result$data['playerIN'] = l$playerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = playerNOTLIKE;
      result$data['playerNOTLIKE'] = l$playerNOTLIKE;
    }
    if (_$data.containsKey('playerLIKE')) {
      final l$playerLIKE = playerLIKE;
      result$data['playerLIKE'] = l$playerLIKE;
    }
    if (_$data.containsKey('position')) {
      final l$position = position;
      result$data['position'] = l$position;
    }
    if (_$data.containsKey('is_king')) {
      final l$is_king = is_king;
      result$data['is_king'] = l$is_king;
    }
    if (_$data.containsKey('is_alive')) {
      final l$is_alive = is_alive;
      result$data['is_alive'] = l$is_alive;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_PieceWhereInput<
          Input$checkers_marq_PieceWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_PieceWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_PieceWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (_$data.containsKey('session_id') !=
        other._$data.containsKey('session_id')) {
      return false;
    }
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$session_idGT = session_idGT;
    final lOther$session_idGT = other.session_idGT;
    if (_$data.containsKey('session_idGT') !=
        other._$data.containsKey('session_idGT')) {
      return false;
    }
    if (l$session_idGT != lOther$session_idGT) {
      return false;
    }
    final l$session_idGTE = session_idGTE;
    final lOther$session_idGTE = other.session_idGTE;
    if (_$data.containsKey('session_idGTE') !=
        other._$data.containsKey('session_idGTE')) {
      return false;
    }
    if (l$session_idGTE != lOther$session_idGTE) {
      return false;
    }
    final l$session_idLT = session_idLT;
    final lOther$session_idLT = other.session_idLT;
    if (_$data.containsKey('session_idLT') !=
        other._$data.containsKey('session_idLT')) {
      return false;
    }
    if (l$session_idLT != lOther$session_idLT) {
      return false;
    }
    final l$session_idLTE = session_idLTE;
    final lOther$session_idLTE = other.session_idLTE;
    if (_$data.containsKey('session_idLTE') !=
        other._$data.containsKey('session_idLTE')) {
      return false;
    }
    if (l$session_idLTE != lOther$session_idLTE) {
      return false;
    }
    final l$session_idNEQ = session_idNEQ;
    final lOther$session_idNEQ = other.session_idNEQ;
    if (_$data.containsKey('session_idNEQ') !=
        other._$data.containsKey('session_idNEQ')) {
      return false;
    }
    if (l$session_idNEQ != lOther$session_idNEQ) {
      return false;
    }
    final l$session_idEQ = session_idEQ;
    final lOther$session_idEQ = other.session_idEQ;
    if (_$data.containsKey('session_idEQ') !=
        other._$data.containsKey('session_idEQ')) {
      return false;
    }
    if (l$session_idEQ != lOther$session_idEQ) {
      return false;
    }
    final l$session_idNOTIN = session_idNOTIN;
    final lOther$session_idNOTIN = other.session_idNOTIN;
    if (_$data.containsKey('session_idNOTIN') !=
        other._$data.containsKey('session_idNOTIN')) {
      return false;
    }
    if (l$session_idNOTIN != null && lOther$session_idNOTIN != null) {
      if (l$session_idNOTIN.length != lOther$session_idNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idNOTIN.length; i++) {
        final l$session_idNOTIN$entry = l$session_idNOTIN[i];
        final lOther$session_idNOTIN$entry = lOther$session_idNOTIN[i];
        if (l$session_idNOTIN$entry != lOther$session_idNOTIN$entry) {
          return false;
        }
      }
    } else if (l$session_idNOTIN != lOther$session_idNOTIN) {
      return false;
    }
    final l$session_idIN = session_idIN;
    final lOther$session_idIN = other.session_idIN;
    if (_$data.containsKey('session_idIN') !=
        other._$data.containsKey('session_idIN')) {
      return false;
    }
    if (l$session_idIN != null && lOther$session_idIN != null) {
      if (l$session_idIN.length != lOther$session_idIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idIN.length; i++) {
        final l$session_idIN$entry = l$session_idIN[i];
        final lOther$session_idIN$entry = lOther$session_idIN[i];
        if (l$session_idIN$entry != lOther$session_idIN$entry) {
          return false;
        }
      }
    } else if (l$session_idIN != lOther$session_idIN) {
      return false;
    }
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final lOther$session_idNOTLIKE = other.session_idNOTLIKE;
    if (_$data.containsKey('session_idNOTLIKE') !=
        other._$data.containsKey('session_idNOTLIKE')) {
      return false;
    }
    if (l$session_idNOTLIKE != lOther$session_idNOTLIKE) {
      return false;
    }
    final l$session_idLIKE = session_idLIKE;
    final lOther$session_idLIKE = other.session_idLIKE;
    if (_$data.containsKey('session_idLIKE') !=
        other._$data.containsKey('session_idLIKE')) {
      return false;
    }
    if (l$session_idLIKE != lOther$session_idLIKE) {
      return false;
    }
    final l$row = row;
    final lOther$row = other.row;
    if (_$data.containsKey('row') != other._$data.containsKey('row')) {
      return false;
    }
    if (l$row != lOther$row) {
      return false;
    }
    final l$rowGT = rowGT;
    final lOther$rowGT = other.rowGT;
    if (_$data.containsKey('rowGT') != other._$data.containsKey('rowGT')) {
      return false;
    }
    if (l$rowGT != lOther$rowGT) {
      return false;
    }
    final l$rowGTE = rowGTE;
    final lOther$rowGTE = other.rowGTE;
    if (_$data.containsKey('rowGTE') != other._$data.containsKey('rowGTE')) {
      return false;
    }
    if (l$rowGTE != lOther$rowGTE) {
      return false;
    }
    final l$rowLT = rowLT;
    final lOther$rowLT = other.rowLT;
    if (_$data.containsKey('rowLT') != other._$data.containsKey('rowLT')) {
      return false;
    }
    if (l$rowLT != lOther$rowLT) {
      return false;
    }
    final l$rowLTE = rowLTE;
    final lOther$rowLTE = other.rowLTE;
    if (_$data.containsKey('rowLTE') != other._$data.containsKey('rowLTE')) {
      return false;
    }
    if (l$rowLTE != lOther$rowLTE) {
      return false;
    }
    final l$rowNEQ = rowNEQ;
    final lOther$rowNEQ = other.rowNEQ;
    if (_$data.containsKey('rowNEQ') != other._$data.containsKey('rowNEQ')) {
      return false;
    }
    if (l$rowNEQ != lOther$rowNEQ) {
      return false;
    }
    final l$rowEQ = rowEQ;
    final lOther$rowEQ = other.rowEQ;
    if (_$data.containsKey('rowEQ') != other._$data.containsKey('rowEQ')) {
      return false;
    }
    if (l$rowEQ != lOther$rowEQ) {
      return false;
    }
    final l$rowNOTIN = rowNOTIN;
    final lOther$rowNOTIN = other.rowNOTIN;
    if (_$data.containsKey('rowNOTIN') !=
        other._$data.containsKey('rowNOTIN')) {
      return false;
    }
    if (l$rowNOTIN != null && lOther$rowNOTIN != null) {
      if (l$rowNOTIN.length != lOther$rowNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowNOTIN.length; i++) {
        final l$rowNOTIN$entry = l$rowNOTIN[i];
        final lOther$rowNOTIN$entry = lOther$rowNOTIN[i];
        if (l$rowNOTIN$entry != lOther$rowNOTIN$entry) {
          return false;
        }
      }
    } else if (l$rowNOTIN != lOther$rowNOTIN) {
      return false;
    }
    final l$rowIN = rowIN;
    final lOther$rowIN = other.rowIN;
    if (_$data.containsKey('rowIN') != other._$data.containsKey('rowIN')) {
      return false;
    }
    if (l$rowIN != null && lOther$rowIN != null) {
      if (l$rowIN.length != lOther$rowIN.length) {
        return false;
      }
      for (int i = 0; i < l$rowIN.length; i++) {
        final l$rowIN$entry = l$rowIN[i];
        final lOther$rowIN$entry = lOther$rowIN[i];
        if (l$rowIN$entry != lOther$rowIN$entry) {
          return false;
        }
      }
    } else if (l$rowIN != lOther$rowIN) {
      return false;
    }
    final l$rowNOTLIKE = rowNOTLIKE;
    final lOther$rowNOTLIKE = other.rowNOTLIKE;
    if (_$data.containsKey('rowNOTLIKE') !=
        other._$data.containsKey('rowNOTLIKE')) {
      return false;
    }
    if (l$rowNOTLIKE != lOther$rowNOTLIKE) {
      return false;
    }
    final l$rowLIKE = rowLIKE;
    final lOther$rowLIKE = other.rowLIKE;
    if (_$data.containsKey('rowLIKE') != other._$data.containsKey('rowLIKE')) {
      return false;
    }
    if (l$rowLIKE != lOther$rowLIKE) {
      return false;
    }
    final l$col = col;
    final lOther$col = other.col;
    if (_$data.containsKey('col') != other._$data.containsKey('col')) {
      return false;
    }
    if (l$col != lOther$col) {
      return false;
    }
    final l$colGT = colGT;
    final lOther$colGT = other.colGT;
    if (_$data.containsKey('colGT') != other._$data.containsKey('colGT')) {
      return false;
    }
    if (l$colGT != lOther$colGT) {
      return false;
    }
    final l$colGTE = colGTE;
    final lOther$colGTE = other.colGTE;
    if (_$data.containsKey('colGTE') != other._$data.containsKey('colGTE')) {
      return false;
    }
    if (l$colGTE != lOther$colGTE) {
      return false;
    }
    final l$colLT = colLT;
    final lOther$colLT = other.colLT;
    if (_$data.containsKey('colLT') != other._$data.containsKey('colLT')) {
      return false;
    }
    if (l$colLT != lOther$colLT) {
      return false;
    }
    final l$colLTE = colLTE;
    final lOther$colLTE = other.colLTE;
    if (_$data.containsKey('colLTE') != other._$data.containsKey('colLTE')) {
      return false;
    }
    if (l$colLTE != lOther$colLTE) {
      return false;
    }
    final l$colNEQ = colNEQ;
    final lOther$colNEQ = other.colNEQ;
    if (_$data.containsKey('colNEQ') != other._$data.containsKey('colNEQ')) {
      return false;
    }
    if (l$colNEQ != lOther$colNEQ) {
      return false;
    }
    final l$colEQ = colEQ;
    final lOther$colEQ = other.colEQ;
    if (_$data.containsKey('colEQ') != other._$data.containsKey('colEQ')) {
      return false;
    }
    if (l$colEQ != lOther$colEQ) {
      return false;
    }
    final l$colNOTIN = colNOTIN;
    final lOther$colNOTIN = other.colNOTIN;
    if (_$data.containsKey('colNOTIN') !=
        other._$data.containsKey('colNOTIN')) {
      return false;
    }
    if (l$colNOTIN != null && lOther$colNOTIN != null) {
      if (l$colNOTIN.length != lOther$colNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$colNOTIN.length; i++) {
        final l$colNOTIN$entry = l$colNOTIN[i];
        final lOther$colNOTIN$entry = lOther$colNOTIN[i];
        if (l$colNOTIN$entry != lOther$colNOTIN$entry) {
          return false;
        }
      }
    } else if (l$colNOTIN != lOther$colNOTIN) {
      return false;
    }
    final l$colIN = colIN;
    final lOther$colIN = other.colIN;
    if (_$data.containsKey('colIN') != other._$data.containsKey('colIN')) {
      return false;
    }
    if (l$colIN != null && lOther$colIN != null) {
      if (l$colIN.length != lOther$colIN.length) {
        return false;
      }
      for (int i = 0; i < l$colIN.length; i++) {
        final l$colIN$entry = l$colIN[i];
        final lOther$colIN$entry = lOther$colIN[i];
        if (l$colIN$entry != lOther$colIN$entry) {
          return false;
        }
      }
    } else if (l$colIN != lOther$colIN) {
      return false;
    }
    final l$colNOTLIKE = colNOTLIKE;
    final lOther$colNOTLIKE = other.colNOTLIKE;
    if (_$data.containsKey('colNOTLIKE') !=
        other._$data.containsKey('colNOTLIKE')) {
      return false;
    }
    if (l$colNOTLIKE != lOther$colNOTLIKE) {
      return false;
    }
    final l$colLIKE = colLIKE;
    final lOther$colLIKE = other.colLIKE;
    if (_$data.containsKey('colLIKE') != other._$data.containsKey('colLIKE')) {
      return false;
    }
    if (l$colLIKE != lOther$colLIKE) {
      return false;
    }
    final l$player = player;
    final lOther$player = other.player;
    if (_$data.containsKey('player') != other._$data.containsKey('player')) {
      return false;
    }
    if (l$player != lOther$player) {
      return false;
    }
    final l$playerGT = playerGT;
    final lOther$playerGT = other.playerGT;
    if (_$data.containsKey('playerGT') !=
        other._$data.containsKey('playerGT')) {
      return false;
    }
    if (l$playerGT != lOther$playerGT) {
      return false;
    }
    final l$playerGTE = playerGTE;
    final lOther$playerGTE = other.playerGTE;
    if (_$data.containsKey('playerGTE') !=
        other._$data.containsKey('playerGTE')) {
      return false;
    }
    if (l$playerGTE != lOther$playerGTE) {
      return false;
    }
    final l$playerLT = playerLT;
    final lOther$playerLT = other.playerLT;
    if (_$data.containsKey('playerLT') !=
        other._$data.containsKey('playerLT')) {
      return false;
    }
    if (l$playerLT != lOther$playerLT) {
      return false;
    }
    final l$playerLTE = playerLTE;
    final lOther$playerLTE = other.playerLTE;
    if (_$data.containsKey('playerLTE') !=
        other._$data.containsKey('playerLTE')) {
      return false;
    }
    if (l$playerLTE != lOther$playerLTE) {
      return false;
    }
    final l$playerNEQ = playerNEQ;
    final lOther$playerNEQ = other.playerNEQ;
    if (_$data.containsKey('playerNEQ') !=
        other._$data.containsKey('playerNEQ')) {
      return false;
    }
    if (l$playerNEQ != lOther$playerNEQ) {
      return false;
    }
    final l$playerEQ = playerEQ;
    final lOther$playerEQ = other.playerEQ;
    if (_$data.containsKey('playerEQ') !=
        other._$data.containsKey('playerEQ')) {
      return false;
    }
    if (l$playerEQ != lOther$playerEQ) {
      return false;
    }
    final l$playerNOTIN = playerNOTIN;
    final lOther$playerNOTIN = other.playerNOTIN;
    if (_$data.containsKey('playerNOTIN') !=
        other._$data.containsKey('playerNOTIN')) {
      return false;
    }
    if (l$playerNOTIN != null && lOther$playerNOTIN != null) {
      if (l$playerNOTIN.length != lOther$playerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerNOTIN.length; i++) {
        final l$playerNOTIN$entry = l$playerNOTIN[i];
        final lOther$playerNOTIN$entry = lOther$playerNOTIN[i];
        if (l$playerNOTIN$entry != lOther$playerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$playerNOTIN != lOther$playerNOTIN) {
      return false;
    }
    final l$playerIN = playerIN;
    final lOther$playerIN = other.playerIN;
    if (_$data.containsKey('playerIN') !=
        other._$data.containsKey('playerIN')) {
      return false;
    }
    if (l$playerIN != null && lOther$playerIN != null) {
      if (l$playerIN.length != lOther$playerIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerIN.length; i++) {
        final l$playerIN$entry = l$playerIN[i];
        final lOther$playerIN$entry = lOther$playerIN[i];
        if (l$playerIN$entry != lOther$playerIN$entry) {
          return false;
        }
      }
    } else if (l$playerIN != lOther$playerIN) {
      return false;
    }
    final l$playerNOTLIKE = playerNOTLIKE;
    final lOther$playerNOTLIKE = other.playerNOTLIKE;
    if (_$data.containsKey('playerNOTLIKE') !=
        other._$data.containsKey('playerNOTLIKE')) {
      return false;
    }
    if (l$playerNOTLIKE != lOther$playerNOTLIKE) {
      return false;
    }
    final l$playerLIKE = playerLIKE;
    final lOther$playerLIKE = other.playerLIKE;
    if (_$data.containsKey('playerLIKE') !=
        other._$data.containsKey('playerLIKE')) {
      return false;
    }
    if (l$playerLIKE != lOther$playerLIKE) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (_$data.containsKey('position') !=
        other._$data.containsKey('position')) {
      return false;
    }
    if (l$position != lOther$position) {
      return false;
    }
    final l$is_king = is_king;
    final lOther$is_king = other.is_king;
    if (_$data.containsKey('is_king') != other._$data.containsKey('is_king')) {
      return false;
    }
    if (l$is_king != lOther$is_king) {
      return false;
    }
    final l$is_alive = is_alive;
    final lOther$is_alive = other.is_alive;
    if (_$data.containsKey('is_alive') !=
        other._$data.containsKey('is_alive')) {
      return false;
    }
    if (l$is_alive != lOther$is_alive) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$session_idGT = session_idGT;
    final l$session_idGTE = session_idGTE;
    final l$session_idLT = session_idLT;
    final l$session_idLTE = session_idLTE;
    final l$session_idNEQ = session_idNEQ;
    final l$session_idEQ = session_idEQ;
    final l$session_idNOTIN = session_idNOTIN;
    final l$session_idIN = session_idIN;
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final l$session_idLIKE = session_idLIKE;
    final l$row = row;
    final l$rowGT = rowGT;
    final l$rowGTE = rowGTE;
    final l$rowLT = rowLT;
    final l$rowLTE = rowLTE;
    final l$rowNEQ = rowNEQ;
    final l$rowEQ = rowEQ;
    final l$rowNOTIN = rowNOTIN;
    final l$rowIN = rowIN;
    final l$rowNOTLIKE = rowNOTLIKE;
    final l$rowLIKE = rowLIKE;
    final l$col = col;
    final l$colGT = colGT;
    final l$colGTE = colGTE;
    final l$colLT = colLT;
    final l$colLTE = colLTE;
    final l$colNEQ = colNEQ;
    final l$colEQ = colEQ;
    final l$colNOTIN = colNOTIN;
    final l$colIN = colIN;
    final l$colNOTLIKE = colNOTLIKE;
    final l$colLIKE = colLIKE;
    final l$player = player;
    final l$playerGT = playerGT;
    final l$playerGTE = playerGTE;
    final l$playerLT = playerLT;
    final l$playerLTE = playerLTE;
    final l$playerNEQ = playerNEQ;
    final l$playerEQ = playerEQ;
    final l$playerNOTIN = playerNOTIN;
    final l$playerIN = playerIN;
    final l$playerNOTLIKE = playerNOTLIKE;
    final l$playerLIKE = playerLIKE;
    final l$position = position;
    final l$is_king = is_king;
    final l$is_alive = is_alive;
    return Object.hashAll([
      _$data.containsKey('session_id') ? l$session_id : const {},
      _$data.containsKey('session_idGT') ? l$session_idGT : const {},
      _$data.containsKey('session_idGTE') ? l$session_idGTE : const {},
      _$data.containsKey('session_idLT') ? l$session_idLT : const {},
      _$data.containsKey('session_idLTE') ? l$session_idLTE : const {},
      _$data.containsKey('session_idNEQ') ? l$session_idNEQ : const {},
      _$data.containsKey('session_idEQ') ? l$session_idEQ : const {},
      _$data.containsKey('session_idNOTIN')
          ? l$session_idNOTIN == null
              ? null
              : Object.hashAll(l$session_idNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idIN')
          ? l$session_idIN == null
              ? null
              : Object.hashAll(l$session_idIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idNOTLIKE') ? l$session_idNOTLIKE : const {},
      _$data.containsKey('session_idLIKE') ? l$session_idLIKE : const {},
      _$data.containsKey('row') ? l$row : const {},
      _$data.containsKey('rowGT') ? l$rowGT : const {},
      _$data.containsKey('rowGTE') ? l$rowGTE : const {},
      _$data.containsKey('rowLT') ? l$rowLT : const {},
      _$data.containsKey('rowLTE') ? l$rowLTE : const {},
      _$data.containsKey('rowNEQ') ? l$rowNEQ : const {},
      _$data.containsKey('rowEQ') ? l$rowEQ : const {},
      _$data.containsKey('rowNOTIN')
          ? l$rowNOTIN == null
              ? null
              : Object.hashAll(l$rowNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('rowIN')
          ? l$rowIN == null
              ? null
              : Object.hashAll(l$rowIN.map((v) => v))
          : const {},
      _$data.containsKey('rowNOTLIKE') ? l$rowNOTLIKE : const {},
      _$data.containsKey('rowLIKE') ? l$rowLIKE : const {},
      _$data.containsKey('col') ? l$col : const {},
      _$data.containsKey('colGT') ? l$colGT : const {},
      _$data.containsKey('colGTE') ? l$colGTE : const {},
      _$data.containsKey('colLT') ? l$colLT : const {},
      _$data.containsKey('colLTE') ? l$colLTE : const {},
      _$data.containsKey('colNEQ') ? l$colNEQ : const {},
      _$data.containsKey('colEQ') ? l$colEQ : const {},
      _$data.containsKey('colNOTIN')
          ? l$colNOTIN == null
              ? null
              : Object.hashAll(l$colNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('colIN')
          ? l$colIN == null
              ? null
              : Object.hashAll(l$colIN.map((v) => v))
          : const {},
      _$data.containsKey('colNOTLIKE') ? l$colNOTLIKE : const {},
      _$data.containsKey('colLIKE') ? l$colLIKE : const {},
      _$data.containsKey('player') ? l$player : const {},
      _$data.containsKey('playerGT') ? l$playerGT : const {},
      _$data.containsKey('playerGTE') ? l$playerGTE : const {},
      _$data.containsKey('playerLT') ? l$playerLT : const {},
      _$data.containsKey('playerLTE') ? l$playerLTE : const {},
      _$data.containsKey('playerNEQ') ? l$playerNEQ : const {},
      _$data.containsKey('playerEQ') ? l$playerEQ : const {},
      _$data.containsKey('playerNOTIN')
          ? l$playerNOTIN == null
              ? null
              : Object.hashAll(l$playerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('playerIN')
          ? l$playerIN == null
              ? null
              : Object.hashAll(l$playerIN.map((v) => v))
          : const {},
      _$data.containsKey('playerNOTLIKE') ? l$playerNOTLIKE : const {},
      _$data.containsKey('playerLIKE') ? l$playerLIKE : const {},
      _$data.containsKey('position') ? l$position : const {},
      _$data.containsKey('is_king') ? l$is_king : const {},
      _$data.containsKey('is_alive') ? l$is_alive : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_PieceWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_PieceWhereInput(
    Input$checkers_marq_PieceWhereInput instance,
    TRes Function(Input$checkers_marq_PieceWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_PieceWhereInput;

  factory CopyWith$Input$checkers_marq_PieceWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_PieceWhereInput;

  TRes call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? position,
    String? is_king,
    String? is_alive,
  });
}

class _CopyWithImpl$Input$checkers_marq_PieceWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_PieceWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_PieceWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_PieceWhereInput _instance;

  final TRes Function(Input$checkers_marq_PieceWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? session_id = _undefined,
    Object? session_idGT = _undefined,
    Object? session_idGTE = _undefined,
    Object? session_idLT = _undefined,
    Object? session_idLTE = _undefined,
    Object? session_idNEQ = _undefined,
    Object? session_idEQ = _undefined,
    Object? session_idNOTIN = _undefined,
    Object? session_idIN = _undefined,
    Object? session_idNOTLIKE = _undefined,
    Object? session_idLIKE = _undefined,
    Object? row = _undefined,
    Object? rowGT = _undefined,
    Object? rowGTE = _undefined,
    Object? rowLT = _undefined,
    Object? rowLTE = _undefined,
    Object? rowNEQ = _undefined,
    Object? rowEQ = _undefined,
    Object? rowNOTIN = _undefined,
    Object? rowIN = _undefined,
    Object? rowNOTLIKE = _undefined,
    Object? rowLIKE = _undefined,
    Object? col = _undefined,
    Object? colGT = _undefined,
    Object? colGTE = _undefined,
    Object? colLT = _undefined,
    Object? colLTE = _undefined,
    Object? colNEQ = _undefined,
    Object? colEQ = _undefined,
    Object? colNOTIN = _undefined,
    Object? colIN = _undefined,
    Object? colNOTLIKE = _undefined,
    Object? colLIKE = _undefined,
    Object? player = _undefined,
    Object? playerGT = _undefined,
    Object? playerGTE = _undefined,
    Object? playerLT = _undefined,
    Object? playerLTE = _undefined,
    Object? playerNEQ = _undefined,
    Object? playerEQ = _undefined,
    Object? playerNOTIN = _undefined,
    Object? playerIN = _undefined,
    Object? playerNOTLIKE = _undefined,
    Object? playerLIKE = _undefined,
    Object? position = _undefined,
    Object? is_king = _undefined,
    Object? is_alive = _undefined,
  }) =>
      _then(Input$checkers_marq_PieceWhereInput._({
        ..._instance._$data,
        if (session_id != _undefined) 'session_id': (session_id as String?),
        if (session_idGT != _undefined)
          'session_idGT': (session_idGT as String?),
        if (session_idGTE != _undefined)
          'session_idGTE': (session_idGTE as String?),
        if (session_idLT != _undefined)
          'session_idLT': (session_idLT as String?),
        if (session_idLTE != _undefined)
          'session_idLTE': (session_idLTE as String?),
        if (session_idNEQ != _undefined)
          'session_idNEQ': (session_idNEQ as String?),
        if (session_idEQ != _undefined)
          'session_idEQ': (session_idEQ as String?),
        if (session_idNOTIN != _undefined)
          'session_idNOTIN': (session_idNOTIN as List<String?>?),
        if (session_idIN != _undefined)
          'session_idIN': (session_idIN as List<String?>?),
        if (session_idNOTLIKE != _undefined)
          'session_idNOTLIKE': (session_idNOTLIKE as String?),
        if (session_idLIKE != _undefined)
          'session_idLIKE': (session_idLIKE as String?),
        if (row != _undefined) 'row': (row as String?),
        if (rowGT != _undefined) 'rowGT': (rowGT as String?),
        if (rowGTE != _undefined) 'rowGTE': (rowGTE as String?),
        if (rowLT != _undefined) 'rowLT': (rowLT as String?),
        if (rowLTE != _undefined) 'rowLTE': (rowLTE as String?),
        if (rowNEQ != _undefined) 'rowNEQ': (rowNEQ as String?),
        if (rowEQ != _undefined) 'rowEQ': (rowEQ as String?),
        if (rowNOTIN != _undefined) 'rowNOTIN': (rowNOTIN as List<String?>?),
        if (rowIN != _undefined) 'rowIN': (rowIN as List<String?>?),
        if (rowNOTLIKE != _undefined) 'rowNOTLIKE': (rowNOTLIKE as String?),
        if (rowLIKE != _undefined) 'rowLIKE': (rowLIKE as String?),
        if (col != _undefined) 'col': (col as String?),
        if (colGT != _undefined) 'colGT': (colGT as String?),
        if (colGTE != _undefined) 'colGTE': (colGTE as String?),
        if (colLT != _undefined) 'colLT': (colLT as String?),
        if (colLTE != _undefined) 'colLTE': (colLTE as String?),
        if (colNEQ != _undefined) 'colNEQ': (colNEQ as String?),
        if (colEQ != _undefined) 'colEQ': (colEQ as String?),
        if (colNOTIN != _undefined) 'colNOTIN': (colNOTIN as List<String?>?),
        if (colIN != _undefined) 'colIN': (colIN as List<String?>?),
        if (colNOTLIKE != _undefined) 'colNOTLIKE': (colNOTLIKE as String?),
        if (colLIKE != _undefined) 'colLIKE': (colLIKE as String?),
        if (player != _undefined) 'player': (player as String?),
        if (playerGT != _undefined) 'playerGT': (playerGT as String?),
        if (playerGTE != _undefined) 'playerGTE': (playerGTE as String?),
        if (playerLT != _undefined) 'playerLT': (playerLT as String?),
        if (playerLTE != _undefined) 'playerLTE': (playerLTE as String?),
        if (playerNEQ != _undefined) 'playerNEQ': (playerNEQ as String?),
        if (playerEQ != _undefined) 'playerEQ': (playerEQ as String?),
        if (playerNOTIN != _undefined)
          'playerNOTIN': (playerNOTIN as List<String?>?),
        if (playerIN != _undefined) 'playerIN': (playerIN as List<String?>?),
        if (playerNOTLIKE != _undefined)
          'playerNOTLIKE': (playerNOTLIKE as String?),
        if (playerLIKE != _undefined) 'playerLIKE': (playerLIKE as String?),
        if (position != _undefined) 'position': (position as String?),
        if (is_king != _undefined) 'is_king': (is_king as String?),
        if (is_alive != _undefined) 'is_alive': (is_alive as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_PieceWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_PieceWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_PieceWhereInput(this._res);

  TRes _res;

  call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? row,
    String? rowGT,
    String? rowGTE,
    String? rowLT,
    String? rowLTE,
    String? rowNEQ,
    String? rowEQ,
    List<String?>? rowNOTIN,
    List<String?>? rowIN,
    String? rowNOTLIKE,
    String? rowLIKE,
    String? col,
    String? colGT,
    String? colGTE,
    String? colLT,
    String? colLTE,
    String? colNEQ,
    String? colEQ,
    List<String?>? colNOTIN,
    List<String?>? colIN,
    String? colNOTLIKE,
    String? colLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? position,
    String? is_king,
    String? is_alive,
  }) =>
      _res;
}

class Input$checkers_marq_PlayerOrder {
  factory Input$checkers_marq_PlayerOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_PlayerOrderField field,
  }) =>
      Input$checkers_marq_PlayerOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_PlayerOrder._(this._$data);

  factory Input$checkers_marq_PlayerOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_PlayerOrderField((l$field as String));
    return Input$checkers_marq_PlayerOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_PlayerOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_PlayerOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_PlayerOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_PlayerOrder<Input$checkers_marq_PlayerOrder>
      get copyWith => CopyWith$Input$checkers_marq_PlayerOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_PlayerOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_PlayerOrder<TRes> {
  factory CopyWith$Input$checkers_marq_PlayerOrder(
    Input$checkers_marq_PlayerOrder instance,
    TRes Function(Input$checkers_marq_PlayerOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_PlayerOrder;

  factory CopyWith$Input$checkers_marq_PlayerOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_PlayerOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_PlayerOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_PlayerOrder<TRes>
    implements CopyWith$Input$checkers_marq_PlayerOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_PlayerOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_PlayerOrder _instance;

  final TRes Function(Input$checkers_marq_PlayerOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_PlayerOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_PlayerOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_PlayerOrder<TRes>
    implements CopyWith$Input$checkers_marq_PlayerOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_PlayerOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_PlayerOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_PlayerWhereInput {
  factory Input$checkers_marq_PlayerWhereInput({
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? remaining_pieces,
    String? remaining_piecesGT,
    String? remaining_piecesGTE,
    String? remaining_piecesLT,
    String? remaining_piecesLTE,
    String? remaining_piecesNEQ,
    String? remaining_piecesEQ,
    List<String?>? remaining_piecesNOTIN,
    List<String?>? remaining_piecesIN,
    String? remaining_piecesNOTLIKE,
    String? remaining_piecesLIKE,
  }) =>
      Input$checkers_marq_PlayerWhereInput._({
        if (player != null) r'player': player,
        if (playerGT != null) r'playerGT': playerGT,
        if (playerGTE != null) r'playerGTE': playerGTE,
        if (playerLT != null) r'playerLT': playerLT,
        if (playerLTE != null) r'playerLTE': playerLTE,
        if (playerNEQ != null) r'playerNEQ': playerNEQ,
        if (playerEQ != null) r'playerEQ': playerEQ,
        if (playerNOTIN != null) r'playerNOTIN': playerNOTIN,
        if (playerIN != null) r'playerIN': playerIN,
        if (playerNOTLIKE != null) r'playerNOTLIKE': playerNOTLIKE,
        if (playerLIKE != null) r'playerLIKE': playerLIKE,
        if (remaining_pieces != null) r'remaining_pieces': remaining_pieces,
        if (remaining_piecesGT != null)
          r'remaining_piecesGT': remaining_piecesGT,
        if (remaining_piecesGTE != null)
          r'remaining_piecesGTE': remaining_piecesGTE,
        if (remaining_piecesLT != null)
          r'remaining_piecesLT': remaining_piecesLT,
        if (remaining_piecesLTE != null)
          r'remaining_piecesLTE': remaining_piecesLTE,
        if (remaining_piecesNEQ != null)
          r'remaining_piecesNEQ': remaining_piecesNEQ,
        if (remaining_piecesEQ != null)
          r'remaining_piecesEQ': remaining_piecesEQ,
        if (remaining_piecesNOTIN != null)
          r'remaining_piecesNOTIN': remaining_piecesNOTIN,
        if (remaining_piecesIN != null)
          r'remaining_piecesIN': remaining_piecesIN,
        if (remaining_piecesNOTLIKE != null)
          r'remaining_piecesNOTLIKE': remaining_piecesNOTLIKE,
        if (remaining_piecesLIKE != null)
          r'remaining_piecesLIKE': remaining_piecesLIKE,
      });

  Input$checkers_marq_PlayerWhereInput._(this._$data);

  factory Input$checkers_marq_PlayerWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('player')) {
      final l$player = data['player'];
      result$data['player'] = (l$player as String?);
    }
    if (data.containsKey('playerGT')) {
      final l$playerGT = data['playerGT'];
      result$data['playerGT'] = (l$playerGT as String?);
    }
    if (data.containsKey('playerGTE')) {
      final l$playerGTE = data['playerGTE'];
      result$data['playerGTE'] = (l$playerGTE as String?);
    }
    if (data.containsKey('playerLT')) {
      final l$playerLT = data['playerLT'];
      result$data['playerLT'] = (l$playerLT as String?);
    }
    if (data.containsKey('playerLTE')) {
      final l$playerLTE = data['playerLTE'];
      result$data['playerLTE'] = (l$playerLTE as String?);
    }
    if (data.containsKey('playerNEQ')) {
      final l$playerNEQ = data['playerNEQ'];
      result$data['playerNEQ'] = (l$playerNEQ as String?);
    }
    if (data.containsKey('playerEQ')) {
      final l$playerEQ = data['playerEQ'];
      result$data['playerEQ'] = (l$playerEQ as String?);
    }
    if (data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = data['playerNOTIN'];
      result$data['playerNOTIN'] = (l$playerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('playerIN')) {
      final l$playerIN = data['playerIN'];
      result$data['playerIN'] =
          (l$playerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = data['playerNOTLIKE'];
      result$data['playerNOTLIKE'] = (l$playerNOTLIKE as String?);
    }
    if (data.containsKey('playerLIKE')) {
      final l$playerLIKE = data['playerLIKE'];
      result$data['playerLIKE'] = (l$playerLIKE as String?);
    }
    if (data.containsKey('remaining_pieces')) {
      final l$remaining_pieces = data['remaining_pieces'];
      result$data['remaining_pieces'] = (l$remaining_pieces as String?);
    }
    if (data.containsKey('remaining_piecesGT')) {
      final l$remaining_piecesGT = data['remaining_piecesGT'];
      result$data['remaining_piecesGT'] = (l$remaining_piecesGT as String?);
    }
    if (data.containsKey('remaining_piecesGTE')) {
      final l$remaining_piecesGTE = data['remaining_piecesGTE'];
      result$data['remaining_piecesGTE'] = (l$remaining_piecesGTE as String?);
    }
    if (data.containsKey('remaining_piecesLT')) {
      final l$remaining_piecesLT = data['remaining_piecesLT'];
      result$data['remaining_piecesLT'] = (l$remaining_piecesLT as String?);
    }
    if (data.containsKey('remaining_piecesLTE')) {
      final l$remaining_piecesLTE = data['remaining_piecesLTE'];
      result$data['remaining_piecesLTE'] = (l$remaining_piecesLTE as String?);
    }
    if (data.containsKey('remaining_piecesNEQ')) {
      final l$remaining_piecesNEQ = data['remaining_piecesNEQ'];
      result$data['remaining_piecesNEQ'] = (l$remaining_piecesNEQ as String?);
    }
    if (data.containsKey('remaining_piecesEQ')) {
      final l$remaining_piecesEQ = data['remaining_piecesEQ'];
      result$data['remaining_piecesEQ'] = (l$remaining_piecesEQ as String?);
    }
    if (data.containsKey('remaining_piecesNOTIN')) {
      final l$remaining_piecesNOTIN = data['remaining_piecesNOTIN'];
      result$data['remaining_piecesNOTIN'] =
          (l$remaining_piecesNOTIN as List<dynamic>?)
              ?.map((e) => (e as String?))
              .toList();
    }
    if (data.containsKey('remaining_piecesIN')) {
      final l$remaining_piecesIN = data['remaining_piecesIN'];
      result$data['remaining_piecesIN'] =
          (l$remaining_piecesIN as List<dynamic>?)
              ?.map((e) => (e as String?))
              .toList();
    }
    if (data.containsKey('remaining_piecesNOTLIKE')) {
      final l$remaining_piecesNOTLIKE = data['remaining_piecesNOTLIKE'];
      result$data['remaining_piecesNOTLIKE'] =
          (l$remaining_piecesNOTLIKE as String?);
    }
    if (data.containsKey('remaining_piecesLIKE')) {
      final l$remaining_piecesLIKE = data['remaining_piecesLIKE'];
      result$data['remaining_piecesLIKE'] = (l$remaining_piecesLIKE as String?);
    }
    return Input$checkers_marq_PlayerWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get player => (_$data['player'] as String?);

  String? get playerGT => (_$data['playerGT'] as String?);

  String? get playerGTE => (_$data['playerGTE'] as String?);

  String? get playerLT => (_$data['playerLT'] as String?);

  String? get playerLTE => (_$data['playerLTE'] as String?);

  String? get playerNEQ => (_$data['playerNEQ'] as String?);

  String? get playerEQ => (_$data['playerEQ'] as String?);

  List<String?>? get playerNOTIN => (_$data['playerNOTIN'] as List<String?>?);

  List<String?>? get playerIN => (_$data['playerIN'] as List<String?>?);

  String? get playerNOTLIKE => (_$data['playerNOTLIKE'] as String?);

  String? get playerLIKE => (_$data['playerLIKE'] as String?);

  String? get remaining_pieces => (_$data['remaining_pieces'] as String?);

  String? get remaining_piecesGT => (_$data['remaining_piecesGT'] as String?);

  String? get remaining_piecesGTE => (_$data['remaining_piecesGTE'] as String?);

  String? get remaining_piecesLT => (_$data['remaining_piecesLT'] as String?);

  String? get remaining_piecesLTE => (_$data['remaining_piecesLTE'] as String?);

  String? get remaining_piecesNEQ => (_$data['remaining_piecesNEQ'] as String?);

  String? get remaining_piecesEQ => (_$data['remaining_piecesEQ'] as String?);

  List<String?>? get remaining_piecesNOTIN =>
      (_$data['remaining_piecesNOTIN'] as List<String?>?);

  List<String?>? get remaining_piecesIN =>
      (_$data['remaining_piecesIN'] as List<String?>?);

  String? get remaining_piecesNOTLIKE =>
      (_$data['remaining_piecesNOTLIKE'] as String?);

  String? get remaining_piecesLIKE =>
      (_$data['remaining_piecesLIKE'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('player')) {
      final l$player = player;
      result$data['player'] = l$player;
    }
    if (_$data.containsKey('playerGT')) {
      final l$playerGT = playerGT;
      result$data['playerGT'] = l$playerGT;
    }
    if (_$data.containsKey('playerGTE')) {
      final l$playerGTE = playerGTE;
      result$data['playerGTE'] = l$playerGTE;
    }
    if (_$data.containsKey('playerLT')) {
      final l$playerLT = playerLT;
      result$data['playerLT'] = l$playerLT;
    }
    if (_$data.containsKey('playerLTE')) {
      final l$playerLTE = playerLTE;
      result$data['playerLTE'] = l$playerLTE;
    }
    if (_$data.containsKey('playerNEQ')) {
      final l$playerNEQ = playerNEQ;
      result$data['playerNEQ'] = l$playerNEQ;
    }
    if (_$data.containsKey('playerEQ')) {
      final l$playerEQ = playerEQ;
      result$data['playerEQ'] = l$playerEQ;
    }
    if (_$data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = playerNOTIN;
      result$data['playerNOTIN'] = l$playerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerIN')) {
      final l$playerIN = playerIN;
      result$data['playerIN'] = l$playerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = playerNOTLIKE;
      result$data['playerNOTLIKE'] = l$playerNOTLIKE;
    }
    if (_$data.containsKey('playerLIKE')) {
      final l$playerLIKE = playerLIKE;
      result$data['playerLIKE'] = l$playerLIKE;
    }
    if (_$data.containsKey('remaining_pieces')) {
      final l$remaining_pieces = remaining_pieces;
      result$data['remaining_pieces'] = l$remaining_pieces;
    }
    if (_$data.containsKey('remaining_piecesGT')) {
      final l$remaining_piecesGT = remaining_piecesGT;
      result$data['remaining_piecesGT'] = l$remaining_piecesGT;
    }
    if (_$data.containsKey('remaining_piecesGTE')) {
      final l$remaining_piecesGTE = remaining_piecesGTE;
      result$data['remaining_piecesGTE'] = l$remaining_piecesGTE;
    }
    if (_$data.containsKey('remaining_piecesLT')) {
      final l$remaining_piecesLT = remaining_piecesLT;
      result$data['remaining_piecesLT'] = l$remaining_piecesLT;
    }
    if (_$data.containsKey('remaining_piecesLTE')) {
      final l$remaining_piecesLTE = remaining_piecesLTE;
      result$data['remaining_piecesLTE'] = l$remaining_piecesLTE;
    }
    if (_$data.containsKey('remaining_piecesNEQ')) {
      final l$remaining_piecesNEQ = remaining_piecesNEQ;
      result$data['remaining_piecesNEQ'] = l$remaining_piecesNEQ;
    }
    if (_$data.containsKey('remaining_piecesEQ')) {
      final l$remaining_piecesEQ = remaining_piecesEQ;
      result$data['remaining_piecesEQ'] = l$remaining_piecesEQ;
    }
    if (_$data.containsKey('remaining_piecesNOTIN')) {
      final l$remaining_piecesNOTIN = remaining_piecesNOTIN;
      result$data['remaining_piecesNOTIN'] =
          l$remaining_piecesNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('remaining_piecesIN')) {
      final l$remaining_piecesIN = remaining_piecesIN;
      result$data['remaining_piecesIN'] =
          l$remaining_piecesIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('remaining_piecesNOTLIKE')) {
      final l$remaining_piecesNOTLIKE = remaining_piecesNOTLIKE;
      result$data['remaining_piecesNOTLIKE'] = l$remaining_piecesNOTLIKE;
    }
    if (_$data.containsKey('remaining_piecesLIKE')) {
      final l$remaining_piecesLIKE = remaining_piecesLIKE;
      result$data['remaining_piecesLIKE'] = l$remaining_piecesLIKE;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_PlayerWhereInput<
          Input$checkers_marq_PlayerWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_PlayerWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_PlayerWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$player = player;
    final lOther$player = other.player;
    if (_$data.containsKey('player') != other._$data.containsKey('player')) {
      return false;
    }
    if (l$player != lOther$player) {
      return false;
    }
    final l$playerGT = playerGT;
    final lOther$playerGT = other.playerGT;
    if (_$data.containsKey('playerGT') !=
        other._$data.containsKey('playerGT')) {
      return false;
    }
    if (l$playerGT != lOther$playerGT) {
      return false;
    }
    final l$playerGTE = playerGTE;
    final lOther$playerGTE = other.playerGTE;
    if (_$data.containsKey('playerGTE') !=
        other._$data.containsKey('playerGTE')) {
      return false;
    }
    if (l$playerGTE != lOther$playerGTE) {
      return false;
    }
    final l$playerLT = playerLT;
    final lOther$playerLT = other.playerLT;
    if (_$data.containsKey('playerLT') !=
        other._$data.containsKey('playerLT')) {
      return false;
    }
    if (l$playerLT != lOther$playerLT) {
      return false;
    }
    final l$playerLTE = playerLTE;
    final lOther$playerLTE = other.playerLTE;
    if (_$data.containsKey('playerLTE') !=
        other._$data.containsKey('playerLTE')) {
      return false;
    }
    if (l$playerLTE != lOther$playerLTE) {
      return false;
    }
    final l$playerNEQ = playerNEQ;
    final lOther$playerNEQ = other.playerNEQ;
    if (_$data.containsKey('playerNEQ') !=
        other._$data.containsKey('playerNEQ')) {
      return false;
    }
    if (l$playerNEQ != lOther$playerNEQ) {
      return false;
    }
    final l$playerEQ = playerEQ;
    final lOther$playerEQ = other.playerEQ;
    if (_$data.containsKey('playerEQ') !=
        other._$data.containsKey('playerEQ')) {
      return false;
    }
    if (l$playerEQ != lOther$playerEQ) {
      return false;
    }
    final l$playerNOTIN = playerNOTIN;
    final lOther$playerNOTIN = other.playerNOTIN;
    if (_$data.containsKey('playerNOTIN') !=
        other._$data.containsKey('playerNOTIN')) {
      return false;
    }
    if (l$playerNOTIN != null && lOther$playerNOTIN != null) {
      if (l$playerNOTIN.length != lOther$playerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerNOTIN.length; i++) {
        final l$playerNOTIN$entry = l$playerNOTIN[i];
        final lOther$playerNOTIN$entry = lOther$playerNOTIN[i];
        if (l$playerNOTIN$entry != lOther$playerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$playerNOTIN != lOther$playerNOTIN) {
      return false;
    }
    final l$playerIN = playerIN;
    final lOther$playerIN = other.playerIN;
    if (_$data.containsKey('playerIN') !=
        other._$data.containsKey('playerIN')) {
      return false;
    }
    if (l$playerIN != null && lOther$playerIN != null) {
      if (l$playerIN.length != lOther$playerIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerIN.length; i++) {
        final l$playerIN$entry = l$playerIN[i];
        final lOther$playerIN$entry = lOther$playerIN[i];
        if (l$playerIN$entry != lOther$playerIN$entry) {
          return false;
        }
      }
    } else if (l$playerIN != lOther$playerIN) {
      return false;
    }
    final l$playerNOTLIKE = playerNOTLIKE;
    final lOther$playerNOTLIKE = other.playerNOTLIKE;
    if (_$data.containsKey('playerNOTLIKE') !=
        other._$data.containsKey('playerNOTLIKE')) {
      return false;
    }
    if (l$playerNOTLIKE != lOther$playerNOTLIKE) {
      return false;
    }
    final l$playerLIKE = playerLIKE;
    final lOther$playerLIKE = other.playerLIKE;
    if (_$data.containsKey('playerLIKE') !=
        other._$data.containsKey('playerLIKE')) {
      return false;
    }
    if (l$playerLIKE != lOther$playerLIKE) {
      return false;
    }
    final l$remaining_pieces = remaining_pieces;
    final lOther$remaining_pieces = other.remaining_pieces;
    if (_$data.containsKey('remaining_pieces') !=
        other._$data.containsKey('remaining_pieces')) {
      return false;
    }
    if (l$remaining_pieces != lOther$remaining_pieces) {
      return false;
    }
    final l$remaining_piecesGT = remaining_piecesGT;
    final lOther$remaining_piecesGT = other.remaining_piecesGT;
    if (_$data.containsKey('remaining_piecesGT') !=
        other._$data.containsKey('remaining_piecesGT')) {
      return false;
    }
    if (l$remaining_piecesGT != lOther$remaining_piecesGT) {
      return false;
    }
    final l$remaining_piecesGTE = remaining_piecesGTE;
    final lOther$remaining_piecesGTE = other.remaining_piecesGTE;
    if (_$data.containsKey('remaining_piecesGTE') !=
        other._$data.containsKey('remaining_piecesGTE')) {
      return false;
    }
    if (l$remaining_piecesGTE != lOther$remaining_piecesGTE) {
      return false;
    }
    final l$remaining_piecesLT = remaining_piecesLT;
    final lOther$remaining_piecesLT = other.remaining_piecesLT;
    if (_$data.containsKey('remaining_piecesLT') !=
        other._$data.containsKey('remaining_piecesLT')) {
      return false;
    }
    if (l$remaining_piecesLT != lOther$remaining_piecesLT) {
      return false;
    }
    final l$remaining_piecesLTE = remaining_piecesLTE;
    final lOther$remaining_piecesLTE = other.remaining_piecesLTE;
    if (_$data.containsKey('remaining_piecesLTE') !=
        other._$data.containsKey('remaining_piecesLTE')) {
      return false;
    }
    if (l$remaining_piecesLTE != lOther$remaining_piecesLTE) {
      return false;
    }
    final l$remaining_piecesNEQ = remaining_piecesNEQ;
    final lOther$remaining_piecesNEQ = other.remaining_piecesNEQ;
    if (_$data.containsKey('remaining_piecesNEQ') !=
        other._$data.containsKey('remaining_piecesNEQ')) {
      return false;
    }
    if (l$remaining_piecesNEQ != lOther$remaining_piecesNEQ) {
      return false;
    }
    final l$remaining_piecesEQ = remaining_piecesEQ;
    final lOther$remaining_piecesEQ = other.remaining_piecesEQ;
    if (_$data.containsKey('remaining_piecesEQ') !=
        other._$data.containsKey('remaining_piecesEQ')) {
      return false;
    }
    if (l$remaining_piecesEQ != lOther$remaining_piecesEQ) {
      return false;
    }
    final l$remaining_piecesNOTIN = remaining_piecesNOTIN;
    final lOther$remaining_piecesNOTIN = other.remaining_piecesNOTIN;
    if (_$data.containsKey('remaining_piecesNOTIN') !=
        other._$data.containsKey('remaining_piecesNOTIN')) {
      return false;
    }
    if (l$remaining_piecesNOTIN != null &&
        lOther$remaining_piecesNOTIN != null) {
      if (l$remaining_piecesNOTIN.length !=
          lOther$remaining_piecesNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$remaining_piecesNOTIN.length; i++) {
        final l$remaining_piecesNOTIN$entry = l$remaining_piecesNOTIN[i];
        final lOther$remaining_piecesNOTIN$entry =
            lOther$remaining_piecesNOTIN[i];
        if (l$remaining_piecesNOTIN$entry !=
            lOther$remaining_piecesNOTIN$entry) {
          return false;
        }
      }
    } else if (l$remaining_piecesNOTIN != lOther$remaining_piecesNOTIN) {
      return false;
    }
    final l$remaining_piecesIN = remaining_piecesIN;
    final lOther$remaining_piecesIN = other.remaining_piecesIN;
    if (_$data.containsKey('remaining_piecesIN') !=
        other._$data.containsKey('remaining_piecesIN')) {
      return false;
    }
    if (l$remaining_piecesIN != null && lOther$remaining_piecesIN != null) {
      if (l$remaining_piecesIN.length != lOther$remaining_piecesIN.length) {
        return false;
      }
      for (int i = 0; i < l$remaining_piecesIN.length; i++) {
        final l$remaining_piecesIN$entry = l$remaining_piecesIN[i];
        final lOther$remaining_piecesIN$entry = lOther$remaining_piecesIN[i];
        if (l$remaining_piecesIN$entry != lOther$remaining_piecesIN$entry) {
          return false;
        }
      }
    } else if (l$remaining_piecesIN != lOther$remaining_piecesIN) {
      return false;
    }
    final l$remaining_piecesNOTLIKE = remaining_piecesNOTLIKE;
    final lOther$remaining_piecesNOTLIKE = other.remaining_piecesNOTLIKE;
    if (_$data.containsKey('remaining_piecesNOTLIKE') !=
        other._$data.containsKey('remaining_piecesNOTLIKE')) {
      return false;
    }
    if (l$remaining_piecesNOTLIKE != lOther$remaining_piecesNOTLIKE) {
      return false;
    }
    final l$remaining_piecesLIKE = remaining_piecesLIKE;
    final lOther$remaining_piecesLIKE = other.remaining_piecesLIKE;
    if (_$data.containsKey('remaining_piecesLIKE') !=
        other._$data.containsKey('remaining_piecesLIKE')) {
      return false;
    }
    if (l$remaining_piecesLIKE != lOther$remaining_piecesLIKE) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$player = player;
    final l$playerGT = playerGT;
    final l$playerGTE = playerGTE;
    final l$playerLT = playerLT;
    final l$playerLTE = playerLTE;
    final l$playerNEQ = playerNEQ;
    final l$playerEQ = playerEQ;
    final l$playerNOTIN = playerNOTIN;
    final l$playerIN = playerIN;
    final l$playerNOTLIKE = playerNOTLIKE;
    final l$playerLIKE = playerLIKE;
    final l$remaining_pieces = remaining_pieces;
    final l$remaining_piecesGT = remaining_piecesGT;
    final l$remaining_piecesGTE = remaining_piecesGTE;
    final l$remaining_piecesLT = remaining_piecesLT;
    final l$remaining_piecesLTE = remaining_piecesLTE;
    final l$remaining_piecesNEQ = remaining_piecesNEQ;
    final l$remaining_piecesEQ = remaining_piecesEQ;
    final l$remaining_piecesNOTIN = remaining_piecesNOTIN;
    final l$remaining_piecesIN = remaining_piecesIN;
    final l$remaining_piecesNOTLIKE = remaining_piecesNOTLIKE;
    final l$remaining_piecesLIKE = remaining_piecesLIKE;
    return Object.hashAll([
      _$data.containsKey('player') ? l$player : const {},
      _$data.containsKey('playerGT') ? l$playerGT : const {},
      _$data.containsKey('playerGTE') ? l$playerGTE : const {},
      _$data.containsKey('playerLT') ? l$playerLT : const {},
      _$data.containsKey('playerLTE') ? l$playerLTE : const {},
      _$data.containsKey('playerNEQ') ? l$playerNEQ : const {},
      _$data.containsKey('playerEQ') ? l$playerEQ : const {},
      _$data.containsKey('playerNOTIN')
          ? l$playerNOTIN == null
              ? null
              : Object.hashAll(l$playerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('playerIN')
          ? l$playerIN == null
              ? null
              : Object.hashAll(l$playerIN.map((v) => v))
          : const {},
      _$data.containsKey('playerNOTLIKE') ? l$playerNOTLIKE : const {},
      _$data.containsKey('playerLIKE') ? l$playerLIKE : const {},
      _$data.containsKey('remaining_pieces') ? l$remaining_pieces : const {},
      _$data.containsKey('remaining_piecesGT')
          ? l$remaining_piecesGT
          : const {},
      _$data.containsKey('remaining_piecesGTE')
          ? l$remaining_piecesGTE
          : const {},
      _$data.containsKey('remaining_piecesLT')
          ? l$remaining_piecesLT
          : const {},
      _$data.containsKey('remaining_piecesLTE')
          ? l$remaining_piecesLTE
          : const {},
      _$data.containsKey('remaining_piecesNEQ')
          ? l$remaining_piecesNEQ
          : const {},
      _$data.containsKey('remaining_piecesEQ')
          ? l$remaining_piecesEQ
          : const {},
      _$data.containsKey('remaining_piecesNOTIN')
          ? l$remaining_piecesNOTIN == null
              ? null
              : Object.hashAll(l$remaining_piecesNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('remaining_piecesIN')
          ? l$remaining_piecesIN == null
              ? null
              : Object.hashAll(l$remaining_piecesIN.map((v) => v))
          : const {},
      _$data.containsKey('remaining_piecesNOTLIKE')
          ? l$remaining_piecesNOTLIKE
          : const {},
      _$data.containsKey('remaining_piecesLIKE')
          ? l$remaining_piecesLIKE
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_PlayerWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_PlayerWhereInput(
    Input$checkers_marq_PlayerWhereInput instance,
    TRes Function(Input$checkers_marq_PlayerWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_PlayerWhereInput;

  factory CopyWith$Input$checkers_marq_PlayerWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_PlayerWhereInput;

  TRes call({
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? remaining_pieces,
    String? remaining_piecesGT,
    String? remaining_piecesGTE,
    String? remaining_piecesLT,
    String? remaining_piecesLTE,
    String? remaining_piecesNEQ,
    String? remaining_piecesEQ,
    List<String?>? remaining_piecesNOTIN,
    List<String?>? remaining_piecesIN,
    String? remaining_piecesNOTLIKE,
    String? remaining_piecesLIKE,
  });
}

class _CopyWithImpl$Input$checkers_marq_PlayerWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_PlayerWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_PlayerWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_PlayerWhereInput _instance;

  final TRes Function(Input$checkers_marq_PlayerWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? player = _undefined,
    Object? playerGT = _undefined,
    Object? playerGTE = _undefined,
    Object? playerLT = _undefined,
    Object? playerLTE = _undefined,
    Object? playerNEQ = _undefined,
    Object? playerEQ = _undefined,
    Object? playerNOTIN = _undefined,
    Object? playerIN = _undefined,
    Object? playerNOTLIKE = _undefined,
    Object? playerLIKE = _undefined,
    Object? remaining_pieces = _undefined,
    Object? remaining_piecesGT = _undefined,
    Object? remaining_piecesGTE = _undefined,
    Object? remaining_piecesLT = _undefined,
    Object? remaining_piecesLTE = _undefined,
    Object? remaining_piecesNEQ = _undefined,
    Object? remaining_piecesEQ = _undefined,
    Object? remaining_piecesNOTIN = _undefined,
    Object? remaining_piecesIN = _undefined,
    Object? remaining_piecesNOTLIKE = _undefined,
    Object? remaining_piecesLIKE = _undefined,
  }) =>
      _then(Input$checkers_marq_PlayerWhereInput._({
        ..._instance._$data,
        if (player != _undefined) 'player': (player as String?),
        if (playerGT != _undefined) 'playerGT': (playerGT as String?),
        if (playerGTE != _undefined) 'playerGTE': (playerGTE as String?),
        if (playerLT != _undefined) 'playerLT': (playerLT as String?),
        if (playerLTE != _undefined) 'playerLTE': (playerLTE as String?),
        if (playerNEQ != _undefined) 'playerNEQ': (playerNEQ as String?),
        if (playerEQ != _undefined) 'playerEQ': (playerEQ as String?),
        if (playerNOTIN != _undefined)
          'playerNOTIN': (playerNOTIN as List<String?>?),
        if (playerIN != _undefined) 'playerIN': (playerIN as List<String?>?),
        if (playerNOTLIKE != _undefined)
          'playerNOTLIKE': (playerNOTLIKE as String?),
        if (playerLIKE != _undefined) 'playerLIKE': (playerLIKE as String?),
        if (remaining_pieces != _undefined)
          'remaining_pieces': (remaining_pieces as String?),
        if (remaining_piecesGT != _undefined)
          'remaining_piecesGT': (remaining_piecesGT as String?),
        if (remaining_piecesGTE != _undefined)
          'remaining_piecesGTE': (remaining_piecesGTE as String?),
        if (remaining_piecesLT != _undefined)
          'remaining_piecesLT': (remaining_piecesLT as String?),
        if (remaining_piecesLTE != _undefined)
          'remaining_piecesLTE': (remaining_piecesLTE as String?),
        if (remaining_piecesNEQ != _undefined)
          'remaining_piecesNEQ': (remaining_piecesNEQ as String?),
        if (remaining_piecesEQ != _undefined)
          'remaining_piecesEQ': (remaining_piecesEQ as String?),
        if (remaining_piecesNOTIN != _undefined)
          'remaining_piecesNOTIN': (remaining_piecesNOTIN as List<String?>?),
        if (remaining_piecesIN != _undefined)
          'remaining_piecesIN': (remaining_piecesIN as List<String?>?),
        if (remaining_piecesNOTLIKE != _undefined)
          'remaining_piecesNOTLIKE': (remaining_piecesNOTLIKE as String?),
        if (remaining_piecesLIKE != _undefined)
          'remaining_piecesLIKE': (remaining_piecesLIKE as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_PlayerWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_PlayerWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_PlayerWhereInput(this._res);

  TRes _res;

  call({
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? remaining_pieces,
    String? remaining_piecesGT,
    String? remaining_piecesGTE,
    String? remaining_piecesLT,
    String? remaining_piecesLTE,
    String? remaining_piecesNEQ,
    String? remaining_piecesEQ,
    List<String?>? remaining_piecesNOTIN,
    List<String?>? remaining_piecesIN,
    String? remaining_piecesNOTLIKE,
    String? remaining_piecesLIKE,
  }) =>
      _res;
}

class Input$checkers_marq_SessionOrder {
  factory Input$checkers_marq_SessionOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_SessionOrderField field,
  }) =>
      Input$checkers_marq_SessionOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_SessionOrder._(this._$data);

  factory Input$checkers_marq_SessionOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_SessionOrderField((l$field as String));
    return Input$checkers_marq_SessionOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_SessionOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_SessionOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_SessionOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_SessionOrder<Input$checkers_marq_SessionOrder>
      get copyWith => CopyWith$Input$checkers_marq_SessionOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_SessionOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_SessionOrder<TRes> {
  factory CopyWith$Input$checkers_marq_SessionOrder(
    Input$checkers_marq_SessionOrder instance,
    TRes Function(Input$checkers_marq_SessionOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_SessionOrder;

  factory CopyWith$Input$checkers_marq_SessionOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_SessionOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_SessionOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_SessionOrder<TRes>
    implements CopyWith$Input$checkers_marq_SessionOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_SessionOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_SessionOrder _instance;

  final TRes Function(Input$checkers_marq_SessionOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_SessionOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_SessionOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_SessionOrder<TRes>
    implements CopyWith$Input$checkers_marq_SessionOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_SessionOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_SessionOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_SessionWhereInput {
  factory Input$checkers_marq_SessionWhereInput({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player_1,
    String? player_1GT,
    String? player_1GTE,
    String? player_1LT,
    String? player_1LTE,
    String? player_1NEQ,
    String? player_1EQ,
    List<String?>? player_1NOTIN,
    List<String?>? player_1IN,
    String? player_1NOTLIKE,
    String? player_1LIKE,
    String? player_2,
    String? player_2GT,
    String? player_2GTE,
    String? player_2LT,
    String? player_2LTE,
    String? player_2NEQ,
    String? player_2EQ,
    List<String?>? player_2NOTIN,
    List<String?>? player_2IN,
    String? player_2NOTLIKE,
    String? player_2LIKE,
    String? turn,
    String? turnGT,
    String? turnGTE,
    String? turnLT,
    String? turnLTE,
    String? turnNEQ,
    String? turnEQ,
    List<String?>? turnNOTIN,
    List<String?>? turnIN,
    String? turnNOTLIKE,
    String? turnLIKE,
    String? winner,
    String? winnerGT,
    String? winnerGTE,
    String? winnerLT,
    String? winnerLTE,
    String? winnerNEQ,
    String? winnerEQ,
    List<String?>? winnerNOTIN,
    List<String?>? winnerIN,
    String? winnerNOTLIKE,
    String? winnerLIKE,
    String? state,
    String? stateGT,
    String? stateGTE,
    String? stateLT,
    String? stateLTE,
    String? stateNEQ,
    String? stateEQ,
    List<String?>? stateNOTIN,
    List<String?>? stateIN,
    String? stateNOTLIKE,
    String? stateLIKE,
  }) =>
      Input$checkers_marq_SessionWhereInput._({
        if (session_id != null) r'session_id': session_id,
        if (session_idGT != null) r'session_idGT': session_idGT,
        if (session_idGTE != null) r'session_idGTE': session_idGTE,
        if (session_idLT != null) r'session_idLT': session_idLT,
        if (session_idLTE != null) r'session_idLTE': session_idLTE,
        if (session_idNEQ != null) r'session_idNEQ': session_idNEQ,
        if (session_idEQ != null) r'session_idEQ': session_idEQ,
        if (session_idNOTIN != null) r'session_idNOTIN': session_idNOTIN,
        if (session_idIN != null) r'session_idIN': session_idIN,
        if (session_idNOTLIKE != null) r'session_idNOTLIKE': session_idNOTLIKE,
        if (session_idLIKE != null) r'session_idLIKE': session_idLIKE,
        if (player_1 != null) r'player_1': player_1,
        if (player_1GT != null) r'player_1GT': player_1GT,
        if (player_1GTE != null) r'player_1GTE': player_1GTE,
        if (player_1LT != null) r'player_1LT': player_1LT,
        if (player_1LTE != null) r'player_1LTE': player_1LTE,
        if (player_1NEQ != null) r'player_1NEQ': player_1NEQ,
        if (player_1EQ != null) r'player_1EQ': player_1EQ,
        if (player_1NOTIN != null) r'player_1NOTIN': player_1NOTIN,
        if (player_1IN != null) r'player_1IN': player_1IN,
        if (player_1NOTLIKE != null) r'player_1NOTLIKE': player_1NOTLIKE,
        if (player_1LIKE != null) r'player_1LIKE': player_1LIKE,
        if (player_2 != null) r'player_2': player_2,
        if (player_2GT != null) r'player_2GT': player_2GT,
        if (player_2GTE != null) r'player_2GTE': player_2GTE,
        if (player_2LT != null) r'player_2LT': player_2LT,
        if (player_2LTE != null) r'player_2LTE': player_2LTE,
        if (player_2NEQ != null) r'player_2NEQ': player_2NEQ,
        if (player_2EQ != null) r'player_2EQ': player_2EQ,
        if (player_2NOTIN != null) r'player_2NOTIN': player_2NOTIN,
        if (player_2IN != null) r'player_2IN': player_2IN,
        if (player_2NOTLIKE != null) r'player_2NOTLIKE': player_2NOTLIKE,
        if (player_2LIKE != null) r'player_2LIKE': player_2LIKE,
        if (turn != null) r'turn': turn,
        if (turnGT != null) r'turnGT': turnGT,
        if (turnGTE != null) r'turnGTE': turnGTE,
        if (turnLT != null) r'turnLT': turnLT,
        if (turnLTE != null) r'turnLTE': turnLTE,
        if (turnNEQ != null) r'turnNEQ': turnNEQ,
        if (turnEQ != null) r'turnEQ': turnEQ,
        if (turnNOTIN != null) r'turnNOTIN': turnNOTIN,
        if (turnIN != null) r'turnIN': turnIN,
        if (turnNOTLIKE != null) r'turnNOTLIKE': turnNOTLIKE,
        if (turnLIKE != null) r'turnLIKE': turnLIKE,
        if (winner != null) r'winner': winner,
        if (winnerGT != null) r'winnerGT': winnerGT,
        if (winnerGTE != null) r'winnerGTE': winnerGTE,
        if (winnerLT != null) r'winnerLT': winnerLT,
        if (winnerLTE != null) r'winnerLTE': winnerLTE,
        if (winnerNEQ != null) r'winnerNEQ': winnerNEQ,
        if (winnerEQ != null) r'winnerEQ': winnerEQ,
        if (winnerNOTIN != null) r'winnerNOTIN': winnerNOTIN,
        if (winnerIN != null) r'winnerIN': winnerIN,
        if (winnerNOTLIKE != null) r'winnerNOTLIKE': winnerNOTLIKE,
        if (winnerLIKE != null) r'winnerLIKE': winnerLIKE,
        if (state != null) r'state': state,
        if (stateGT != null) r'stateGT': stateGT,
        if (stateGTE != null) r'stateGTE': stateGTE,
        if (stateLT != null) r'stateLT': stateLT,
        if (stateLTE != null) r'stateLTE': stateLTE,
        if (stateNEQ != null) r'stateNEQ': stateNEQ,
        if (stateEQ != null) r'stateEQ': stateEQ,
        if (stateNOTIN != null) r'stateNOTIN': stateNOTIN,
        if (stateIN != null) r'stateIN': stateIN,
        if (stateNOTLIKE != null) r'stateNOTLIKE': stateNOTLIKE,
        if (stateLIKE != null) r'stateLIKE': stateLIKE,
      });

  Input$checkers_marq_SessionWhereInput._(this._$data);

  factory Input$checkers_marq_SessionWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('session_id')) {
      final l$session_id = data['session_id'];
      result$data['session_id'] = (l$session_id as String?);
    }
    if (data.containsKey('session_idGT')) {
      final l$session_idGT = data['session_idGT'];
      result$data['session_idGT'] = (l$session_idGT as String?);
    }
    if (data.containsKey('session_idGTE')) {
      final l$session_idGTE = data['session_idGTE'];
      result$data['session_idGTE'] = (l$session_idGTE as String?);
    }
    if (data.containsKey('session_idLT')) {
      final l$session_idLT = data['session_idLT'];
      result$data['session_idLT'] = (l$session_idLT as String?);
    }
    if (data.containsKey('session_idLTE')) {
      final l$session_idLTE = data['session_idLTE'];
      result$data['session_idLTE'] = (l$session_idLTE as String?);
    }
    if (data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = data['session_idNEQ'];
      result$data['session_idNEQ'] = (l$session_idNEQ as String?);
    }
    if (data.containsKey('session_idEQ')) {
      final l$session_idEQ = data['session_idEQ'];
      result$data['session_idEQ'] = (l$session_idEQ as String?);
    }
    if (data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = data['session_idNOTIN'];
      result$data['session_idNOTIN'] = (l$session_idNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idIN')) {
      final l$session_idIN = data['session_idIN'];
      result$data['session_idIN'] = (l$session_idIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = data['session_idNOTLIKE'];
      result$data['session_idNOTLIKE'] = (l$session_idNOTLIKE as String?);
    }
    if (data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = data['session_idLIKE'];
      result$data['session_idLIKE'] = (l$session_idLIKE as String?);
    }
    if (data.containsKey('player_1')) {
      final l$player_1 = data['player_1'];
      result$data['player_1'] = (l$player_1 as String?);
    }
    if (data.containsKey('player_1GT')) {
      final l$player_1GT = data['player_1GT'];
      result$data['player_1GT'] = (l$player_1GT as String?);
    }
    if (data.containsKey('player_1GTE')) {
      final l$player_1GTE = data['player_1GTE'];
      result$data['player_1GTE'] = (l$player_1GTE as String?);
    }
    if (data.containsKey('player_1LT')) {
      final l$player_1LT = data['player_1LT'];
      result$data['player_1LT'] = (l$player_1LT as String?);
    }
    if (data.containsKey('player_1LTE')) {
      final l$player_1LTE = data['player_1LTE'];
      result$data['player_1LTE'] = (l$player_1LTE as String?);
    }
    if (data.containsKey('player_1NEQ')) {
      final l$player_1NEQ = data['player_1NEQ'];
      result$data['player_1NEQ'] = (l$player_1NEQ as String?);
    }
    if (data.containsKey('player_1EQ')) {
      final l$player_1EQ = data['player_1EQ'];
      result$data['player_1EQ'] = (l$player_1EQ as String?);
    }
    if (data.containsKey('player_1NOTIN')) {
      final l$player_1NOTIN = data['player_1NOTIN'];
      result$data['player_1NOTIN'] = (l$player_1NOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('player_1IN')) {
      final l$player_1IN = data['player_1IN'];
      result$data['player_1IN'] =
          (l$player_1IN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('player_1NOTLIKE')) {
      final l$player_1NOTLIKE = data['player_1NOTLIKE'];
      result$data['player_1NOTLIKE'] = (l$player_1NOTLIKE as String?);
    }
    if (data.containsKey('player_1LIKE')) {
      final l$player_1LIKE = data['player_1LIKE'];
      result$data['player_1LIKE'] = (l$player_1LIKE as String?);
    }
    if (data.containsKey('player_2')) {
      final l$player_2 = data['player_2'];
      result$data['player_2'] = (l$player_2 as String?);
    }
    if (data.containsKey('player_2GT')) {
      final l$player_2GT = data['player_2GT'];
      result$data['player_2GT'] = (l$player_2GT as String?);
    }
    if (data.containsKey('player_2GTE')) {
      final l$player_2GTE = data['player_2GTE'];
      result$data['player_2GTE'] = (l$player_2GTE as String?);
    }
    if (data.containsKey('player_2LT')) {
      final l$player_2LT = data['player_2LT'];
      result$data['player_2LT'] = (l$player_2LT as String?);
    }
    if (data.containsKey('player_2LTE')) {
      final l$player_2LTE = data['player_2LTE'];
      result$data['player_2LTE'] = (l$player_2LTE as String?);
    }
    if (data.containsKey('player_2NEQ')) {
      final l$player_2NEQ = data['player_2NEQ'];
      result$data['player_2NEQ'] = (l$player_2NEQ as String?);
    }
    if (data.containsKey('player_2EQ')) {
      final l$player_2EQ = data['player_2EQ'];
      result$data['player_2EQ'] = (l$player_2EQ as String?);
    }
    if (data.containsKey('player_2NOTIN')) {
      final l$player_2NOTIN = data['player_2NOTIN'];
      result$data['player_2NOTIN'] = (l$player_2NOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('player_2IN')) {
      final l$player_2IN = data['player_2IN'];
      result$data['player_2IN'] =
          (l$player_2IN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('player_2NOTLIKE')) {
      final l$player_2NOTLIKE = data['player_2NOTLIKE'];
      result$data['player_2NOTLIKE'] = (l$player_2NOTLIKE as String?);
    }
    if (data.containsKey('player_2LIKE')) {
      final l$player_2LIKE = data['player_2LIKE'];
      result$data['player_2LIKE'] = (l$player_2LIKE as String?);
    }
    if (data.containsKey('turn')) {
      final l$turn = data['turn'];
      result$data['turn'] = (l$turn as String?);
    }
    if (data.containsKey('turnGT')) {
      final l$turnGT = data['turnGT'];
      result$data['turnGT'] = (l$turnGT as String?);
    }
    if (data.containsKey('turnGTE')) {
      final l$turnGTE = data['turnGTE'];
      result$data['turnGTE'] = (l$turnGTE as String?);
    }
    if (data.containsKey('turnLT')) {
      final l$turnLT = data['turnLT'];
      result$data['turnLT'] = (l$turnLT as String?);
    }
    if (data.containsKey('turnLTE')) {
      final l$turnLTE = data['turnLTE'];
      result$data['turnLTE'] = (l$turnLTE as String?);
    }
    if (data.containsKey('turnNEQ')) {
      final l$turnNEQ = data['turnNEQ'];
      result$data['turnNEQ'] = (l$turnNEQ as String?);
    }
    if (data.containsKey('turnEQ')) {
      final l$turnEQ = data['turnEQ'];
      result$data['turnEQ'] = (l$turnEQ as String?);
    }
    if (data.containsKey('turnNOTIN')) {
      final l$turnNOTIN = data['turnNOTIN'];
      result$data['turnNOTIN'] =
          (l$turnNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('turnIN')) {
      final l$turnIN = data['turnIN'];
      result$data['turnIN'] =
          (l$turnIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('turnNOTLIKE')) {
      final l$turnNOTLIKE = data['turnNOTLIKE'];
      result$data['turnNOTLIKE'] = (l$turnNOTLIKE as String?);
    }
    if (data.containsKey('turnLIKE')) {
      final l$turnLIKE = data['turnLIKE'];
      result$data['turnLIKE'] = (l$turnLIKE as String?);
    }
    if (data.containsKey('winner')) {
      final l$winner = data['winner'];
      result$data['winner'] = (l$winner as String?);
    }
    if (data.containsKey('winnerGT')) {
      final l$winnerGT = data['winnerGT'];
      result$data['winnerGT'] = (l$winnerGT as String?);
    }
    if (data.containsKey('winnerGTE')) {
      final l$winnerGTE = data['winnerGTE'];
      result$data['winnerGTE'] = (l$winnerGTE as String?);
    }
    if (data.containsKey('winnerLT')) {
      final l$winnerLT = data['winnerLT'];
      result$data['winnerLT'] = (l$winnerLT as String?);
    }
    if (data.containsKey('winnerLTE')) {
      final l$winnerLTE = data['winnerLTE'];
      result$data['winnerLTE'] = (l$winnerLTE as String?);
    }
    if (data.containsKey('winnerNEQ')) {
      final l$winnerNEQ = data['winnerNEQ'];
      result$data['winnerNEQ'] = (l$winnerNEQ as String?);
    }
    if (data.containsKey('winnerEQ')) {
      final l$winnerEQ = data['winnerEQ'];
      result$data['winnerEQ'] = (l$winnerEQ as String?);
    }
    if (data.containsKey('winnerNOTIN')) {
      final l$winnerNOTIN = data['winnerNOTIN'];
      result$data['winnerNOTIN'] = (l$winnerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('winnerIN')) {
      final l$winnerIN = data['winnerIN'];
      result$data['winnerIN'] =
          (l$winnerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('winnerNOTLIKE')) {
      final l$winnerNOTLIKE = data['winnerNOTLIKE'];
      result$data['winnerNOTLIKE'] = (l$winnerNOTLIKE as String?);
    }
    if (data.containsKey('winnerLIKE')) {
      final l$winnerLIKE = data['winnerLIKE'];
      result$data['winnerLIKE'] = (l$winnerLIKE as String?);
    }
    if (data.containsKey('state')) {
      final l$state = data['state'];
      result$data['state'] = (l$state as String?);
    }
    if (data.containsKey('stateGT')) {
      final l$stateGT = data['stateGT'];
      result$data['stateGT'] = (l$stateGT as String?);
    }
    if (data.containsKey('stateGTE')) {
      final l$stateGTE = data['stateGTE'];
      result$data['stateGTE'] = (l$stateGTE as String?);
    }
    if (data.containsKey('stateLT')) {
      final l$stateLT = data['stateLT'];
      result$data['stateLT'] = (l$stateLT as String?);
    }
    if (data.containsKey('stateLTE')) {
      final l$stateLTE = data['stateLTE'];
      result$data['stateLTE'] = (l$stateLTE as String?);
    }
    if (data.containsKey('stateNEQ')) {
      final l$stateNEQ = data['stateNEQ'];
      result$data['stateNEQ'] = (l$stateNEQ as String?);
    }
    if (data.containsKey('stateEQ')) {
      final l$stateEQ = data['stateEQ'];
      result$data['stateEQ'] = (l$stateEQ as String?);
    }
    if (data.containsKey('stateNOTIN')) {
      final l$stateNOTIN = data['stateNOTIN'];
      result$data['stateNOTIN'] =
          (l$stateNOTIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('stateIN')) {
      final l$stateIN = data['stateIN'];
      result$data['stateIN'] =
          (l$stateIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('stateNOTLIKE')) {
      final l$stateNOTLIKE = data['stateNOTLIKE'];
      result$data['stateNOTLIKE'] = (l$stateNOTLIKE as String?);
    }
    if (data.containsKey('stateLIKE')) {
      final l$stateLIKE = data['stateLIKE'];
      result$data['stateLIKE'] = (l$stateLIKE as String?);
    }
    return Input$checkers_marq_SessionWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get session_id => (_$data['session_id'] as String?);

  String? get session_idGT => (_$data['session_idGT'] as String?);

  String? get session_idGTE => (_$data['session_idGTE'] as String?);

  String? get session_idLT => (_$data['session_idLT'] as String?);

  String? get session_idLTE => (_$data['session_idLTE'] as String?);

  String? get session_idNEQ => (_$data['session_idNEQ'] as String?);

  String? get session_idEQ => (_$data['session_idEQ'] as String?);

  List<String?>? get session_idNOTIN =>
      (_$data['session_idNOTIN'] as List<String?>?);

  List<String?>? get session_idIN => (_$data['session_idIN'] as List<String?>?);

  String? get session_idNOTLIKE => (_$data['session_idNOTLIKE'] as String?);

  String? get session_idLIKE => (_$data['session_idLIKE'] as String?);

  String? get player_1 => (_$data['player_1'] as String?);

  String? get player_1GT => (_$data['player_1GT'] as String?);

  String? get player_1GTE => (_$data['player_1GTE'] as String?);

  String? get player_1LT => (_$data['player_1LT'] as String?);

  String? get player_1LTE => (_$data['player_1LTE'] as String?);

  String? get player_1NEQ => (_$data['player_1NEQ'] as String?);

  String? get player_1EQ => (_$data['player_1EQ'] as String?);

  List<String?>? get player_1NOTIN =>
      (_$data['player_1NOTIN'] as List<String?>?);

  List<String?>? get player_1IN => (_$data['player_1IN'] as List<String?>?);

  String? get player_1NOTLIKE => (_$data['player_1NOTLIKE'] as String?);

  String? get player_1LIKE => (_$data['player_1LIKE'] as String?);

  String? get player_2 => (_$data['player_2'] as String?);

  String? get player_2GT => (_$data['player_2GT'] as String?);

  String? get player_2GTE => (_$data['player_2GTE'] as String?);

  String? get player_2LT => (_$data['player_2LT'] as String?);

  String? get player_2LTE => (_$data['player_2LTE'] as String?);

  String? get player_2NEQ => (_$data['player_2NEQ'] as String?);

  String? get player_2EQ => (_$data['player_2EQ'] as String?);

  List<String?>? get player_2NOTIN =>
      (_$data['player_2NOTIN'] as List<String?>?);

  List<String?>? get player_2IN => (_$data['player_2IN'] as List<String?>?);

  String? get player_2NOTLIKE => (_$data['player_2NOTLIKE'] as String?);

  String? get player_2LIKE => (_$data['player_2LIKE'] as String?);

  String? get turn => (_$data['turn'] as String?);

  String? get turnGT => (_$data['turnGT'] as String?);

  String? get turnGTE => (_$data['turnGTE'] as String?);

  String? get turnLT => (_$data['turnLT'] as String?);

  String? get turnLTE => (_$data['turnLTE'] as String?);

  String? get turnNEQ => (_$data['turnNEQ'] as String?);

  String? get turnEQ => (_$data['turnEQ'] as String?);

  List<String?>? get turnNOTIN => (_$data['turnNOTIN'] as List<String?>?);

  List<String?>? get turnIN => (_$data['turnIN'] as List<String?>?);

  String? get turnNOTLIKE => (_$data['turnNOTLIKE'] as String?);

  String? get turnLIKE => (_$data['turnLIKE'] as String?);

  String? get winner => (_$data['winner'] as String?);

  String? get winnerGT => (_$data['winnerGT'] as String?);

  String? get winnerGTE => (_$data['winnerGTE'] as String?);

  String? get winnerLT => (_$data['winnerLT'] as String?);

  String? get winnerLTE => (_$data['winnerLTE'] as String?);

  String? get winnerNEQ => (_$data['winnerNEQ'] as String?);

  String? get winnerEQ => (_$data['winnerEQ'] as String?);

  List<String?>? get winnerNOTIN => (_$data['winnerNOTIN'] as List<String?>?);

  List<String?>? get winnerIN => (_$data['winnerIN'] as List<String?>?);

  String? get winnerNOTLIKE => (_$data['winnerNOTLIKE'] as String?);

  String? get winnerLIKE => (_$data['winnerLIKE'] as String?);

  String? get state => (_$data['state'] as String?);

  String? get stateGT => (_$data['stateGT'] as String?);

  String? get stateGTE => (_$data['stateGTE'] as String?);

  String? get stateLT => (_$data['stateLT'] as String?);

  String? get stateLTE => (_$data['stateLTE'] as String?);

  String? get stateNEQ => (_$data['stateNEQ'] as String?);

  String? get stateEQ => (_$data['stateEQ'] as String?);

  List<String?>? get stateNOTIN => (_$data['stateNOTIN'] as List<String?>?);

  List<String?>? get stateIN => (_$data['stateIN'] as List<String?>?);

  String? get stateNOTLIKE => (_$data['stateNOTLIKE'] as String?);

  String? get stateLIKE => (_$data['stateLIKE'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('session_id')) {
      final l$session_id = session_id;
      result$data['session_id'] = l$session_id;
    }
    if (_$data.containsKey('session_idGT')) {
      final l$session_idGT = session_idGT;
      result$data['session_idGT'] = l$session_idGT;
    }
    if (_$data.containsKey('session_idGTE')) {
      final l$session_idGTE = session_idGTE;
      result$data['session_idGTE'] = l$session_idGTE;
    }
    if (_$data.containsKey('session_idLT')) {
      final l$session_idLT = session_idLT;
      result$data['session_idLT'] = l$session_idLT;
    }
    if (_$data.containsKey('session_idLTE')) {
      final l$session_idLTE = session_idLTE;
      result$data['session_idLTE'] = l$session_idLTE;
    }
    if (_$data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = session_idNEQ;
      result$data['session_idNEQ'] = l$session_idNEQ;
    }
    if (_$data.containsKey('session_idEQ')) {
      final l$session_idEQ = session_idEQ;
      result$data['session_idEQ'] = l$session_idEQ;
    }
    if (_$data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = session_idNOTIN;
      result$data['session_idNOTIN'] =
          l$session_idNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idIN')) {
      final l$session_idIN = session_idIN;
      result$data['session_idIN'] = l$session_idIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = session_idNOTLIKE;
      result$data['session_idNOTLIKE'] = l$session_idNOTLIKE;
    }
    if (_$data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = session_idLIKE;
      result$data['session_idLIKE'] = l$session_idLIKE;
    }
    if (_$data.containsKey('player_1')) {
      final l$player_1 = player_1;
      result$data['player_1'] = l$player_1;
    }
    if (_$data.containsKey('player_1GT')) {
      final l$player_1GT = player_1GT;
      result$data['player_1GT'] = l$player_1GT;
    }
    if (_$data.containsKey('player_1GTE')) {
      final l$player_1GTE = player_1GTE;
      result$data['player_1GTE'] = l$player_1GTE;
    }
    if (_$data.containsKey('player_1LT')) {
      final l$player_1LT = player_1LT;
      result$data['player_1LT'] = l$player_1LT;
    }
    if (_$data.containsKey('player_1LTE')) {
      final l$player_1LTE = player_1LTE;
      result$data['player_1LTE'] = l$player_1LTE;
    }
    if (_$data.containsKey('player_1NEQ')) {
      final l$player_1NEQ = player_1NEQ;
      result$data['player_1NEQ'] = l$player_1NEQ;
    }
    if (_$data.containsKey('player_1EQ')) {
      final l$player_1EQ = player_1EQ;
      result$data['player_1EQ'] = l$player_1EQ;
    }
    if (_$data.containsKey('player_1NOTIN')) {
      final l$player_1NOTIN = player_1NOTIN;
      result$data['player_1NOTIN'] = l$player_1NOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('player_1IN')) {
      final l$player_1IN = player_1IN;
      result$data['player_1IN'] = l$player_1IN?.map((e) => e).toList();
    }
    if (_$data.containsKey('player_1NOTLIKE')) {
      final l$player_1NOTLIKE = player_1NOTLIKE;
      result$data['player_1NOTLIKE'] = l$player_1NOTLIKE;
    }
    if (_$data.containsKey('player_1LIKE')) {
      final l$player_1LIKE = player_1LIKE;
      result$data['player_1LIKE'] = l$player_1LIKE;
    }
    if (_$data.containsKey('player_2')) {
      final l$player_2 = player_2;
      result$data['player_2'] = l$player_2;
    }
    if (_$data.containsKey('player_2GT')) {
      final l$player_2GT = player_2GT;
      result$data['player_2GT'] = l$player_2GT;
    }
    if (_$data.containsKey('player_2GTE')) {
      final l$player_2GTE = player_2GTE;
      result$data['player_2GTE'] = l$player_2GTE;
    }
    if (_$data.containsKey('player_2LT')) {
      final l$player_2LT = player_2LT;
      result$data['player_2LT'] = l$player_2LT;
    }
    if (_$data.containsKey('player_2LTE')) {
      final l$player_2LTE = player_2LTE;
      result$data['player_2LTE'] = l$player_2LTE;
    }
    if (_$data.containsKey('player_2NEQ')) {
      final l$player_2NEQ = player_2NEQ;
      result$data['player_2NEQ'] = l$player_2NEQ;
    }
    if (_$data.containsKey('player_2EQ')) {
      final l$player_2EQ = player_2EQ;
      result$data['player_2EQ'] = l$player_2EQ;
    }
    if (_$data.containsKey('player_2NOTIN')) {
      final l$player_2NOTIN = player_2NOTIN;
      result$data['player_2NOTIN'] = l$player_2NOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('player_2IN')) {
      final l$player_2IN = player_2IN;
      result$data['player_2IN'] = l$player_2IN?.map((e) => e).toList();
    }
    if (_$data.containsKey('player_2NOTLIKE')) {
      final l$player_2NOTLIKE = player_2NOTLIKE;
      result$data['player_2NOTLIKE'] = l$player_2NOTLIKE;
    }
    if (_$data.containsKey('player_2LIKE')) {
      final l$player_2LIKE = player_2LIKE;
      result$data['player_2LIKE'] = l$player_2LIKE;
    }
    if (_$data.containsKey('turn')) {
      final l$turn = turn;
      result$data['turn'] = l$turn;
    }
    if (_$data.containsKey('turnGT')) {
      final l$turnGT = turnGT;
      result$data['turnGT'] = l$turnGT;
    }
    if (_$data.containsKey('turnGTE')) {
      final l$turnGTE = turnGTE;
      result$data['turnGTE'] = l$turnGTE;
    }
    if (_$data.containsKey('turnLT')) {
      final l$turnLT = turnLT;
      result$data['turnLT'] = l$turnLT;
    }
    if (_$data.containsKey('turnLTE')) {
      final l$turnLTE = turnLTE;
      result$data['turnLTE'] = l$turnLTE;
    }
    if (_$data.containsKey('turnNEQ')) {
      final l$turnNEQ = turnNEQ;
      result$data['turnNEQ'] = l$turnNEQ;
    }
    if (_$data.containsKey('turnEQ')) {
      final l$turnEQ = turnEQ;
      result$data['turnEQ'] = l$turnEQ;
    }
    if (_$data.containsKey('turnNOTIN')) {
      final l$turnNOTIN = turnNOTIN;
      result$data['turnNOTIN'] = l$turnNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('turnIN')) {
      final l$turnIN = turnIN;
      result$data['turnIN'] = l$turnIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('turnNOTLIKE')) {
      final l$turnNOTLIKE = turnNOTLIKE;
      result$data['turnNOTLIKE'] = l$turnNOTLIKE;
    }
    if (_$data.containsKey('turnLIKE')) {
      final l$turnLIKE = turnLIKE;
      result$data['turnLIKE'] = l$turnLIKE;
    }
    if (_$data.containsKey('winner')) {
      final l$winner = winner;
      result$data['winner'] = l$winner;
    }
    if (_$data.containsKey('winnerGT')) {
      final l$winnerGT = winnerGT;
      result$data['winnerGT'] = l$winnerGT;
    }
    if (_$data.containsKey('winnerGTE')) {
      final l$winnerGTE = winnerGTE;
      result$data['winnerGTE'] = l$winnerGTE;
    }
    if (_$data.containsKey('winnerLT')) {
      final l$winnerLT = winnerLT;
      result$data['winnerLT'] = l$winnerLT;
    }
    if (_$data.containsKey('winnerLTE')) {
      final l$winnerLTE = winnerLTE;
      result$data['winnerLTE'] = l$winnerLTE;
    }
    if (_$data.containsKey('winnerNEQ')) {
      final l$winnerNEQ = winnerNEQ;
      result$data['winnerNEQ'] = l$winnerNEQ;
    }
    if (_$data.containsKey('winnerEQ')) {
      final l$winnerEQ = winnerEQ;
      result$data['winnerEQ'] = l$winnerEQ;
    }
    if (_$data.containsKey('winnerNOTIN')) {
      final l$winnerNOTIN = winnerNOTIN;
      result$data['winnerNOTIN'] = l$winnerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('winnerIN')) {
      final l$winnerIN = winnerIN;
      result$data['winnerIN'] = l$winnerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('winnerNOTLIKE')) {
      final l$winnerNOTLIKE = winnerNOTLIKE;
      result$data['winnerNOTLIKE'] = l$winnerNOTLIKE;
    }
    if (_$data.containsKey('winnerLIKE')) {
      final l$winnerLIKE = winnerLIKE;
      result$data['winnerLIKE'] = l$winnerLIKE;
    }
    if (_$data.containsKey('state')) {
      final l$state = state;
      result$data['state'] = l$state;
    }
    if (_$data.containsKey('stateGT')) {
      final l$stateGT = stateGT;
      result$data['stateGT'] = l$stateGT;
    }
    if (_$data.containsKey('stateGTE')) {
      final l$stateGTE = stateGTE;
      result$data['stateGTE'] = l$stateGTE;
    }
    if (_$data.containsKey('stateLT')) {
      final l$stateLT = stateLT;
      result$data['stateLT'] = l$stateLT;
    }
    if (_$data.containsKey('stateLTE')) {
      final l$stateLTE = stateLTE;
      result$data['stateLTE'] = l$stateLTE;
    }
    if (_$data.containsKey('stateNEQ')) {
      final l$stateNEQ = stateNEQ;
      result$data['stateNEQ'] = l$stateNEQ;
    }
    if (_$data.containsKey('stateEQ')) {
      final l$stateEQ = stateEQ;
      result$data['stateEQ'] = l$stateEQ;
    }
    if (_$data.containsKey('stateNOTIN')) {
      final l$stateNOTIN = stateNOTIN;
      result$data['stateNOTIN'] = l$stateNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('stateIN')) {
      final l$stateIN = stateIN;
      result$data['stateIN'] = l$stateIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('stateNOTLIKE')) {
      final l$stateNOTLIKE = stateNOTLIKE;
      result$data['stateNOTLIKE'] = l$stateNOTLIKE;
    }
    if (_$data.containsKey('stateLIKE')) {
      final l$stateLIKE = stateLIKE;
      result$data['stateLIKE'] = l$stateLIKE;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_SessionWhereInput<
          Input$checkers_marq_SessionWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_SessionWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_SessionWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (_$data.containsKey('session_id') !=
        other._$data.containsKey('session_id')) {
      return false;
    }
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$session_idGT = session_idGT;
    final lOther$session_idGT = other.session_idGT;
    if (_$data.containsKey('session_idGT') !=
        other._$data.containsKey('session_idGT')) {
      return false;
    }
    if (l$session_idGT != lOther$session_idGT) {
      return false;
    }
    final l$session_idGTE = session_idGTE;
    final lOther$session_idGTE = other.session_idGTE;
    if (_$data.containsKey('session_idGTE') !=
        other._$data.containsKey('session_idGTE')) {
      return false;
    }
    if (l$session_idGTE != lOther$session_idGTE) {
      return false;
    }
    final l$session_idLT = session_idLT;
    final lOther$session_idLT = other.session_idLT;
    if (_$data.containsKey('session_idLT') !=
        other._$data.containsKey('session_idLT')) {
      return false;
    }
    if (l$session_idLT != lOther$session_idLT) {
      return false;
    }
    final l$session_idLTE = session_idLTE;
    final lOther$session_idLTE = other.session_idLTE;
    if (_$data.containsKey('session_idLTE') !=
        other._$data.containsKey('session_idLTE')) {
      return false;
    }
    if (l$session_idLTE != lOther$session_idLTE) {
      return false;
    }
    final l$session_idNEQ = session_idNEQ;
    final lOther$session_idNEQ = other.session_idNEQ;
    if (_$data.containsKey('session_idNEQ') !=
        other._$data.containsKey('session_idNEQ')) {
      return false;
    }
    if (l$session_idNEQ != lOther$session_idNEQ) {
      return false;
    }
    final l$session_idEQ = session_idEQ;
    final lOther$session_idEQ = other.session_idEQ;
    if (_$data.containsKey('session_idEQ') !=
        other._$data.containsKey('session_idEQ')) {
      return false;
    }
    if (l$session_idEQ != lOther$session_idEQ) {
      return false;
    }
    final l$session_idNOTIN = session_idNOTIN;
    final lOther$session_idNOTIN = other.session_idNOTIN;
    if (_$data.containsKey('session_idNOTIN') !=
        other._$data.containsKey('session_idNOTIN')) {
      return false;
    }
    if (l$session_idNOTIN != null && lOther$session_idNOTIN != null) {
      if (l$session_idNOTIN.length != lOther$session_idNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idNOTIN.length; i++) {
        final l$session_idNOTIN$entry = l$session_idNOTIN[i];
        final lOther$session_idNOTIN$entry = lOther$session_idNOTIN[i];
        if (l$session_idNOTIN$entry != lOther$session_idNOTIN$entry) {
          return false;
        }
      }
    } else if (l$session_idNOTIN != lOther$session_idNOTIN) {
      return false;
    }
    final l$session_idIN = session_idIN;
    final lOther$session_idIN = other.session_idIN;
    if (_$data.containsKey('session_idIN') !=
        other._$data.containsKey('session_idIN')) {
      return false;
    }
    if (l$session_idIN != null && lOther$session_idIN != null) {
      if (l$session_idIN.length != lOther$session_idIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idIN.length; i++) {
        final l$session_idIN$entry = l$session_idIN[i];
        final lOther$session_idIN$entry = lOther$session_idIN[i];
        if (l$session_idIN$entry != lOther$session_idIN$entry) {
          return false;
        }
      }
    } else if (l$session_idIN != lOther$session_idIN) {
      return false;
    }
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final lOther$session_idNOTLIKE = other.session_idNOTLIKE;
    if (_$data.containsKey('session_idNOTLIKE') !=
        other._$data.containsKey('session_idNOTLIKE')) {
      return false;
    }
    if (l$session_idNOTLIKE != lOther$session_idNOTLIKE) {
      return false;
    }
    final l$session_idLIKE = session_idLIKE;
    final lOther$session_idLIKE = other.session_idLIKE;
    if (_$data.containsKey('session_idLIKE') !=
        other._$data.containsKey('session_idLIKE')) {
      return false;
    }
    if (l$session_idLIKE != lOther$session_idLIKE) {
      return false;
    }
    final l$player_1 = player_1;
    final lOther$player_1 = other.player_1;
    if (_$data.containsKey('player_1') !=
        other._$data.containsKey('player_1')) {
      return false;
    }
    if (l$player_1 != lOther$player_1) {
      return false;
    }
    final l$player_1GT = player_1GT;
    final lOther$player_1GT = other.player_1GT;
    if (_$data.containsKey('player_1GT') !=
        other._$data.containsKey('player_1GT')) {
      return false;
    }
    if (l$player_1GT != lOther$player_1GT) {
      return false;
    }
    final l$player_1GTE = player_1GTE;
    final lOther$player_1GTE = other.player_1GTE;
    if (_$data.containsKey('player_1GTE') !=
        other._$data.containsKey('player_1GTE')) {
      return false;
    }
    if (l$player_1GTE != lOther$player_1GTE) {
      return false;
    }
    final l$player_1LT = player_1LT;
    final lOther$player_1LT = other.player_1LT;
    if (_$data.containsKey('player_1LT') !=
        other._$data.containsKey('player_1LT')) {
      return false;
    }
    if (l$player_1LT != lOther$player_1LT) {
      return false;
    }
    final l$player_1LTE = player_1LTE;
    final lOther$player_1LTE = other.player_1LTE;
    if (_$data.containsKey('player_1LTE') !=
        other._$data.containsKey('player_1LTE')) {
      return false;
    }
    if (l$player_1LTE != lOther$player_1LTE) {
      return false;
    }
    final l$player_1NEQ = player_1NEQ;
    final lOther$player_1NEQ = other.player_1NEQ;
    if (_$data.containsKey('player_1NEQ') !=
        other._$data.containsKey('player_1NEQ')) {
      return false;
    }
    if (l$player_1NEQ != lOther$player_1NEQ) {
      return false;
    }
    final l$player_1EQ = player_1EQ;
    final lOther$player_1EQ = other.player_1EQ;
    if (_$data.containsKey('player_1EQ') !=
        other._$data.containsKey('player_1EQ')) {
      return false;
    }
    if (l$player_1EQ != lOther$player_1EQ) {
      return false;
    }
    final l$player_1NOTIN = player_1NOTIN;
    final lOther$player_1NOTIN = other.player_1NOTIN;
    if (_$data.containsKey('player_1NOTIN') !=
        other._$data.containsKey('player_1NOTIN')) {
      return false;
    }
    if (l$player_1NOTIN != null && lOther$player_1NOTIN != null) {
      if (l$player_1NOTIN.length != lOther$player_1NOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$player_1NOTIN.length; i++) {
        final l$player_1NOTIN$entry = l$player_1NOTIN[i];
        final lOther$player_1NOTIN$entry = lOther$player_1NOTIN[i];
        if (l$player_1NOTIN$entry != lOther$player_1NOTIN$entry) {
          return false;
        }
      }
    } else if (l$player_1NOTIN != lOther$player_1NOTIN) {
      return false;
    }
    final l$player_1IN = player_1IN;
    final lOther$player_1IN = other.player_1IN;
    if (_$data.containsKey('player_1IN') !=
        other._$data.containsKey('player_1IN')) {
      return false;
    }
    if (l$player_1IN != null && lOther$player_1IN != null) {
      if (l$player_1IN.length != lOther$player_1IN.length) {
        return false;
      }
      for (int i = 0; i < l$player_1IN.length; i++) {
        final l$player_1IN$entry = l$player_1IN[i];
        final lOther$player_1IN$entry = lOther$player_1IN[i];
        if (l$player_1IN$entry != lOther$player_1IN$entry) {
          return false;
        }
      }
    } else if (l$player_1IN != lOther$player_1IN) {
      return false;
    }
    final l$player_1NOTLIKE = player_1NOTLIKE;
    final lOther$player_1NOTLIKE = other.player_1NOTLIKE;
    if (_$data.containsKey('player_1NOTLIKE') !=
        other._$data.containsKey('player_1NOTLIKE')) {
      return false;
    }
    if (l$player_1NOTLIKE != lOther$player_1NOTLIKE) {
      return false;
    }
    final l$player_1LIKE = player_1LIKE;
    final lOther$player_1LIKE = other.player_1LIKE;
    if (_$data.containsKey('player_1LIKE') !=
        other._$data.containsKey('player_1LIKE')) {
      return false;
    }
    if (l$player_1LIKE != lOther$player_1LIKE) {
      return false;
    }
    final l$player_2 = player_2;
    final lOther$player_2 = other.player_2;
    if (_$data.containsKey('player_2') !=
        other._$data.containsKey('player_2')) {
      return false;
    }
    if (l$player_2 != lOther$player_2) {
      return false;
    }
    final l$player_2GT = player_2GT;
    final lOther$player_2GT = other.player_2GT;
    if (_$data.containsKey('player_2GT') !=
        other._$data.containsKey('player_2GT')) {
      return false;
    }
    if (l$player_2GT != lOther$player_2GT) {
      return false;
    }
    final l$player_2GTE = player_2GTE;
    final lOther$player_2GTE = other.player_2GTE;
    if (_$data.containsKey('player_2GTE') !=
        other._$data.containsKey('player_2GTE')) {
      return false;
    }
    if (l$player_2GTE != lOther$player_2GTE) {
      return false;
    }
    final l$player_2LT = player_2LT;
    final lOther$player_2LT = other.player_2LT;
    if (_$data.containsKey('player_2LT') !=
        other._$data.containsKey('player_2LT')) {
      return false;
    }
    if (l$player_2LT != lOther$player_2LT) {
      return false;
    }
    final l$player_2LTE = player_2LTE;
    final lOther$player_2LTE = other.player_2LTE;
    if (_$data.containsKey('player_2LTE') !=
        other._$data.containsKey('player_2LTE')) {
      return false;
    }
    if (l$player_2LTE != lOther$player_2LTE) {
      return false;
    }
    final l$player_2NEQ = player_2NEQ;
    final lOther$player_2NEQ = other.player_2NEQ;
    if (_$data.containsKey('player_2NEQ') !=
        other._$data.containsKey('player_2NEQ')) {
      return false;
    }
    if (l$player_2NEQ != lOther$player_2NEQ) {
      return false;
    }
    final l$player_2EQ = player_2EQ;
    final lOther$player_2EQ = other.player_2EQ;
    if (_$data.containsKey('player_2EQ') !=
        other._$data.containsKey('player_2EQ')) {
      return false;
    }
    if (l$player_2EQ != lOther$player_2EQ) {
      return false;
    }
    final l$player_2NOTIN = player_2NOTIN;
    final lOther$player_2NOTIN = other.player_2NOTIN;
    if (_$data.containsKey('player_2NOTIN') !=
        other._$data.containsKey('player_2NOTIN')) {
      return false;
    }
    if (l$player_2NOTIN != null && lOther$player_2NOTIN != null) {
      if (l$player_2NOTIN.length != lOther$player_2NOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$player_2NOTIN.length; i++) {
        final l$player_2NOTIN$entry = l$player_2NOTIN[i];
        final lOther$player_2NOTIN$entry = lOther$player_2NOTIN[i];
        if (l$player_2NOTIN$entry != lOther$player_2NOTIN$entry) {
          return false;
        }
      }
    } else if (l$player_2NOTIN != lOther$player_2NOTIN) {
      return false;
    }
    final l$player_2IN = player_2IN;
    final lOther$player_2IN = other.player_2IN;
    if (_$data.containsKey('player_2IN') !=
        other._$data.containsKey('player_2IN')) {
      return false;
    }
    if (l$player_2IN != null && lOther$player_2IN != null) {
      if (l$player_2IN.length != lOther$player_2IN.length) {
        return false;
      }
      for (int i = 0; i < l$player_2IN.length; i++) {
        final l$player_2IN$entry = l$player_2IN[i];
        final lOther$player_2IN$entry = lOther$player_2IN[i];
        if (l$player_2IN$entry != lOther$player_2IN$entry) {
          return false;
        }
      }
    } else if (l$player_2IN != lOther$player_2IN) {
      return false;
    }
    final l$player_2NOTLIKE = player_2NOTLIKE;
    final lOther$player_2NOTLIKE = other.player_2NOTLIKE;
    if (_$data.containsKey('player_2NOTLIKE') !=
        other._$data.containsKey('player_2NOTLIKE')) {
      return false;
    }
    if (l$player_2NOTLIKE != lOther$player_2NOTLIKE) {
      return false;
    }
    final l$player_2LIKE = player_2LIKE;
    final lOther$player_2LIKE = other.player_2LIKE;
    if (_$data.containsKey('player_2LIKE') !=
        other._$data.containsKey('player_2LIKE')) {
      return false;
    }
    if (l$player_2LIKE != lOther$player_2LIKE) {
      return false;
    }
    final l$turn = turn;
    final lOther$turn = other.turn;
    if (_$data.containsKey('turn') != other._$data.containsKey('turn')) {
      return false;
    }
    if (l$turn != lOther$turn) {
      return false;
    }
    final l$turnGT = turnGT;
    final lOther$turnGT = other.turnGT;
    if (_$data.containsKey('turnGT') != other._$data.containsKey('turnGT')) {
      return false;
    }
    if (l$turnGT != lOther$turnGT) {
      return false;
    }
    final l$turnGTE = turnGTE;
    final lOther$turnGTE = other.turnGTE;
    if (_$data.containsKey('turnGTE') != other._$data.containsKey('turnGTE')) {
      return false;
    }
    if (l$turnGTE != lOther$turnGTE) {
      return false;
    }
    final l$turnLT = turnLT;
    final lOther$turnLT = other.turnLT;
    if (_$data.containsKey('turnLT') != other._$data.containsKey('turnLT')) {
      return false;
    }
    if (l$turnLT != lOther$turnLT) {
      return false;
    }
    final l$turnLTE = turnLTE;
    final lOther$turnLTE = other.turnLTE;
    if (_$data.containsKey('turnLTE') != other._$data.containsKey('turnLTE')) {
      return false;
    }
    if (l$turnLTE != lOther$turnLTE) {
      return false;
    }
    final l$turnNEQ = turnNEQ;
    final lOther$turnNEQ = other.turnNEQ;
    if (_$data.containsKey('turnNEQ') != other._$data.containsKey('turnNEQ')) {
      return false;
    }
    if (l$turnNEQ != lOther$turnNEQ) {
      return false;
    }
    final l$turnEQ = turnEQ;
    final lOther$turnEQ = other.turnEQ;
    if (_$data.containsKey('turnEQ') != other._$data.containsKey('turnEQ')) {
      return false;
    }
    if (l$turnEQ != lOther$turnEQ) {
      return false;
    }
    final l$turnNOTIN = turnNOTIN;
    final lOther$turnNOTIN = other.turnNOTIN;
    if (_$data.containsKey('turnNOTIN') !=
        other._$data.containsKey('turnNOTIN')) {
      return false;
    }
    if (l$turnNOTIN != null && lOther$turnNOTIN != null) {
      if (l$turnNOTIN.length != lOther$turnNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$turnNOTIN.length; i++) {
        final l$turnNOTIN$entry = l$turnNOTIN[i];
        final lOther$turnNOTIN$entry = lOther$turnNOTIN[i];
        if (l$turnNOTIN$entry != lOther$turnNOTIN$entry) {
          return false;
        }
      }
    } else if (l$turnNOTIN != lOther$turnNOTIN) {
      return false;
    }
    final l$turnIN = turnIN;
    final lOther$turnIN = other.turnIN;
    if (_$data.containsKey('turnIN') != other._$data.containsKey('turnIN')) {
      return false;
    }
    if (l$turnIN != null && lOther$turnIN != null) {
      if (l$turnIN.length != lOther$turnIN.length) {
        return false;
      }
      for (int i = 0; i < l$turnIN.length; i++) {
        final l$turnIN$entry = l$turnIN[i];
        final lOther$turnIN$entry = lOther$turnIN[i];
        if (l$turnIN$entry != lOther$turnIN$entry) {
          return false;
        }
      }
    } else if (l$turnIN != lOther$turnIN) {
      return false;
    }
    final l$turnNOTLIKE = turnNOTLIKE;
    final lOther$turnNOTLIKE = other.turnNOTLIKE;
    if (_$data.containsKey('turnNOTLIKE') !=
        other._$data.containsKey('turnNOTLIKE')) {
      return false;
    }
    if (l$turnNOTLIKE != lOther$turnNOTLIKE) {
      return false;
    }
    final l$turnLIKE = turnLIKE;
    final lOther$turnLIKE = other.turnLIKE;
    if (_$data.containsKey('turnLIKE') !=
        other._$data.containsKey('turnLIKE')) {
      return false;
    }
    if (l$turnLIKE != lOther$turnLIKE) {
      return false;
    }
    final l$winner = winner;
    final lOther$winner = other.winner;
    if (_$data.containsKey('winner') != other._$data.containsKey('winner')) {
      return false;
    }
    if (l$winner != lOther$winner) {
      return false;
    }
    final l$winnerGT = winnerGT;
    final lOther$winnerGT = other.winnerGT;
    if (_$data.containsKey('winnerGT') !=
        other._$data.containsKey('winnerGT')) {
      return false;
    }
    if (l$winnerGT != lOther$winnerGT) {
      return false;
    }
    final l$winnerGTE = winnerGTE;
    final lOther$winnerGTE = other.winnerGTE;
    if (_$data.containsKey('winnerGTE') !=
        other._$data.containsKey('winnerGTE')) {
      return false;
    }
    if (l$winnerGTE != lOther$winnerGTE) {
      return false;
    }
    final l$winnerLT = winnerLT;
    final lOther$winnerLT = other.winnerLT;
    if (_$data.containsKey('winnerLT') !=
        other._$data.containsKey('winnerLT')) {
      return false;
    }
    if (l$winnerLT != lOther$winnerLT) {
      return false;
    }
    final l$winnerLTE = winnerLTE;
    final lOther$winnerLTE = other.winnerLTE;
    if (_$data.containsKey('winnerLTE') !=
        other._$data.containsKey('winnerLTE')) {
      return false;
    }
    if (l$winnerLTE != lOther$winnerLTE) {
      return false;
    }
    final l$winnerNEQ = winnerNEQ;
    final lOther$winnerNEQ = other.winnerNEQ;
    if (_$data.containsKey('winnerNEQ') !=
        other._$data.containsKey('winnerNEQ')) {
      return false;
    }
    if (l$winnerNEQ != lOther$winnerNEQ) {
      return false;
    }
    final l$winnerEQ = winnerEQ;
    final lOther$winnerEQ = other.winnerEQ;
    if (_$data.containsKey('winnerEQ') !=
        other._$data.containsKey('winnerEQ')) {
      return false;
    }
    if (l$winnerEQ != lOther$winnerEQ) {
      return false;
    }
    final l$winnerNOTIN = winnerNOTIN;
    final lOther$winnerNOTIN = other.winnerNOTIN;
    if (_$data.containsKey('winnerNOTIN') !=
        other._$data.containsKey('winnerNOTIN')) {
      return false;
    }
    if (l$winnerNOTIN != null && lOther$winnerNOTIN != null) {
      if (l$winnerNOTIN.length != lOther$winnerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$winnerNOTIN.length; i++) {
        final l$winnerNOTIN$entry = l$winnerNOTIN[i];
        final lOther$winnerNOTIN$entry = lOther$winnerNOTIN[i];
        if (l$winnerNOTIN$entry != lOther$winnerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$winnerNOTIN != lOther$winnerNOTIN) {
      return false;
    }
    final l$winnerIN = winnerIN;
    final lOther$winnerIN = other.winnerIN;
    if (_$data.containsKey('winnerIN') !=
        other._$data.containsKey('winnerIN')) {
      return false;
    }
    if (l$winnerIN != null && lOther$winnerIN != null) {
      if (l$winnerIN.length != lOther$winnerIN.length) {
        return false;
      }
      for (int i = 0; i < l$winnerIN.length; i++) {
        final l$winnerIN$entry = l$winnerIN[i];
        final lOther$winnerIN$entry = lOther$winnerIN[i];
        if (l$winnerIN$entry != lOther$winnerIN$entry) {
          return false;
        }
      }
    } else if (l$winnerIN != lOther$winnerIN) {
      return false;
    }
    final l$winnerNOTLIKE = winnerNOTLIKE;
    final lOther$winnerNOTLIKE = other.winnerNOTLIKE;
    if (_$data.containsKey('winnerNOTLIKE') !=
        other._$data.containsKey('winnerNOTLIKE')) {
      return false;
    }
    if (l$winnerNOTLIKE != lOther$winnerNOTLIKE) {
      return false;
    }
    final l$winnerLIKE = winnerLIKE;
    final lOther$winnerLIKE = other.winnerLIKE;
    if (_$data.containsKey('winnerLIKE') !=
        other._$data.containsKey('winnerLIKE')) {
      return false;
    }
    if (l$winnerLIKE != lOther$winnerLIKE) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (_$data.containsKey('state') != other._$data.containsKey('state')) {
      return false;
    }
    if (l$state != lOther$state) {
      return false;
    }
    final l$stateGT = stateGT;
    final lOther$stateGT = other.stateGT;
    if (_$data.containsKey('stateGT') != other._$data.containsKey('stateGT')) {
      return false;
    }
    if (l$stateGT != lOther$stateGT) {
      return false;
    }
    final l$stateGTE = stateGTE;
    final lOther$stateGTE = other.stateGTE;
    if (_$data.containsKey('stateGTE') !=
        other._$data.containsKey('stateGTE')) {
      return false;
    }
    if (l$stateGTE != lOther$stateGTE) {
      return false;
    }
    final l$stateLT = stateLT;
    final lOther$stateLT = other.stateLT;
    if (_$data.containsKey('stateLT') != other._$data.containsKey('stateLT')) {
      return false;
    }
    if (l$stateLT != lOther$stateLT) {
      return false;
    }
    final l$stateLTE = stateLTE;
    final lOther$stateLTE = other.stateLTE;
    if (_$data.containsKey('stateLTE') !=
        other._$data.containsKey('stateLTE')) {
      return false;
    }
    if (l$stateLTE != lOther$stateLTE) {
      return false;
    }
    final l$stateNEQ = stateNEQ;
    final lOther$stateNEQ = other.stateNEQ;
    if (_$data.containsKey('stateNEQ') !=
        other._$data.containsKey('stateNEQ')) {
      return false;
    }
    if (l$stateNEQ != lOther$stateNEQ) {
      return false;
    }
    final l$stateEQ = stateEQ;
    final lOther$stateEQ = other.stateEQ;
    if (_$data.containsKey('stateEQ') != other._$data.containsKey('stateEQ')) {
      return false;
    }
    if (l$stateEQ != lOther$stateEQ) {
      return false;
    }
    final l$stateNOTIN = stateNOTIN;
    final lOther$stateNOTIN = other.stateNOTIN;
    if (_$data.containsKey('stateNOTIN') !=
        other._$data.containsKey('stateNOTIN')) {
      return false;
    }
    if (l$stateNOTIN != null && lOther$stateNOTIN != null) {
      if (l$stateNOTIN.length != lOther$stateNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$stateNOTIN.length; i++) {
        final l$stateNOTIN$entry = l$stateNOTIN[i];
        final lOther$stateNOTIN$entry = lOther$stateNOTIN[i];
        if (l$stateNOTIN$entry != lOther$stateNOTIN$entry) {
          return false;
        }
      }
    } else if (l$stateNOTIN != lOther$stateNOTIN) {
      return false;
    }
    final l$stateIN = stateIN;
    final lOther$stateIN = other.stateIN;
    if (_$data.containsKey('stateIN') != other._$data.containsKey('stateIN')) {
      return false;
    }
    if (l$stateIN != null && lOther$stateIN != null) {
      if (l$stateIN.length != lOther$stateIN.length) {
        return false;
      }
      for (int i = 0; i < l$stateIN.length; i++) {
        final l$stateIN$entry = l$stateIN[i];
        final lOther$stateIN$entry = lOther$stateIN[i];
        if (l$stateIN$entry != lOther$stateIN$entry) {
          return false;
        }
      }
    } else if (l$stateIN != lOther$stateIN) {
      return false;
    }
    final l$stateNOTLIKE = stateNOTLIKE;
    final lOther$stateNOTLIKE = other.stateNOTLIKE;
    if (_$data.containsKey('stateNOTLIKE') !=
        other._$data.containsKey('stateNOTLIKE')) {
      return false;
    }
    if (l$stateNOTLIKE != lOther$stateNOTLIKE) {
      return false;
    }
    final l$stateLIKE = stateLIKE;
    final lOther$stateLIKE = other.stateLIKE;
    if (_$data.containsKey('stateLIKE') !=
        other._$data.containsKey('stateLIKE')) {
      return false;
    }
    if (l$stateLIKE != lOther$stateLIKE) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$session_idGT = session_idGT;
    final l$session_idGTE = session_idGTE;
    final l$session_idLT = session_idLT;
    final l$session_idLTE = session_idLTE;
    final l$session_idNEQ = session_idNEQ;
    final l$session_idEQ = session_idEQ;
    final l$session_idNOTIN = session_idNOTIN;
    final l$session_idIN = session_idIN;
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final l$session_idLIKE = session_idLIKE;
    final l$player_1 = player_1;
    final l$player_1GT = player_1GT;
    final l$player_1GTE = player_1GTE;
    final l$player_1LT = player_1LT;
    final l$player_1LTE = player_1LTE;
    final l$player_1NEQ = player_1NEQ;
    final l$player_1EQ = player_1EQ;
    final l$player_1NOTIN = player_1NOTIN;
    final l$player_1IN = player_1IN;
    final l$player_1NOTLIKE = player_1NOTLIKE;
    final l$player_1LIKE = player_1LIKE;
    final l$player_2 = player_2;
    final l$player_2GT = player_2GT;
    final l$player_2GTE = player_2GTE;
    final l$player_2LT = player_2LT;
    final l$player_2LTE = player_2LTE;
    final l$player_2NEQ = player_2NEQ;
    final l$player_2EQ = player_2EQ;
    final l$player_2NOTIN = player_2NOTIN;
    final l$player_2IN = player_2IN;
    final l$player_2NOTLIKE = player_2NOTLIKE;
    final l$player_2LIKE = player_2LIKE;
    final l$turn = turn;
    final l$turnGT = turnGT;
    final l$turnGTE = turnGTE;
    final l$turnLT = turnLT;
    final l$turnLTE = turnLTE;
    final l$turnNEQ = turnNEQ;
    final l$turnEQ = turnEQ;
    final l$turnNOTIN = turnNOTIN;
    final l$turnIN = turnIN;
    final l$turnNOTLIKE = turnNOTLIKE;
    final l$turnLIKE = turnLIKE;
    final l$winner = winner;
    final l$winnerGT = winnerGT;
    final l$winnerGTE = winnerGTE;
    final l$winnerLT = winnerLT;
    final l$winnerLTE = winnerLTE;
    final l$winnerNEQ = winnerNEQ;
    final l$winnerEQ = winnerEQ;
    final l$winnerNOTIN = winnerNOTIN;
    final l$winnerIN = winnerIN;
    final l$winnerNOTLIKE = winnerNOTLIKE;
    final l$winnerLIKE = winnerLIKE;
    final l$state = state;
    final l$stateGT = stateGT;
    final l$stateGTE = stateGTE;
    final l$stateLT = stateLT;
    final l$stateLTE = stateLTE;
    final l$stateNEQ = stateNEQ;
    final l$stateEQ = stateEQ;
    final l$stateNOTIN = stateNOTIN;
    final l$stateIN = stateIN;
    final l$stateNOTLIKE = stateNOTLIKE;
    final l$stateLIKE = stateLIKE;
    return Object.hashAll([
      _$data.containsKey('session_id') ? l$session_id : const {},
      _$data.containsKey('session_idGT') ? l$session_idGT : const {},
      _$data.containsKey('session_idGTE') ? l$session_idGTE : const {},
      _$data.containsKey('session_idLT') ? l$session_idLT : const {},
      _$data.containsKey('session_idLTE') ? l$session_idLTE : const {},
      _$data.containsKey('session_idNEQ') ? l$session_idNEQ : const {},
      _$data.containsKey('session_idEQ') ? l$session_idEQ : const {},
      _$data.containsKey('session_idNOTIN')
          ? l$session_idNOTIN == null
              ? null
              : Object.hashAll(l$session_idNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idIN')
          ? l$session_idIN == null
              ? null
              : Object.hashAll(l$session_idIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idNOTLIKE') ? l$session_idNOTLIKE : const {},
      _$data.containsKey('session_idLIKE') ? l$session_idLIKE : const {},
      _$data.containsKey('player_1') ? l$player_1 : const {},
      _$data.containsKey('player_1GT') ? l$player_1GT : const {},
      _$data.containsKey('player_1GTE') ? l$player_1GTE : const {},
      _$data.containsKey('player_1LT') ? l$player_1LT : const {},
      _$data.containsKey('player_1LTE') ? l$player_1LTE : const {},
      _$data.containsKey('player_1NEQ') ? l$player_1NEQ : const {},
      _$data.containsKey('player_1EQ') ? l$player_1EQ : const {},
      _$data.containsKey('player_1NOTIN')
          ? l$player_1NOTIN == null
              ? null
              : Object.hashAll(l$player_1NOTIN.map((v) => v))
          : const {},
      _$data.containsKey('player_1IN')
          ? l$player_1IN == null
              ? null
              : Object.hashAll(l$player_1IN.map((v) => v))
          : const {},
      _$data.containsKey('player_1NOTLIKE') ? l$player_1NOTLIKE : const {},
      _$data.containsKey('player_1LIKE') ? l$player_1LIKE : const {},
      _$data.containsKey('player_2') ? l$player_2 : const {},
      _$data.containsKey('player_2GT') ? l$player_2GT : const {},
      _$data.containsKey('player_2GTE') ? l$player_2GTE : const {},
      _$data.containsKey('player_2LT') ? l$player_2LT : const {},
      _$data.containsKey('player_2LTE') ? l$player_2LTE : const {},
      _$data.containsKey('player_2NEQ') ? l$player_2NEQ : const {},
      _$data.containsKey('player_2EQ') ? l$player_2EQ : const {},
      _$data.containsKey('player_2NOTIN')
          ? l$player_2NOTIN == null
              ? null
              : Object.hashAll(l$player_2NOTIN.map((v) => v))
          : const {},
      _$data.containsKey('player_2IN')
          ? l$player_2IN == null
              ? null
              : Object.hashAll(l$player_2IN.map((v) => v))
          : const {},
      _$data.containsKey('player_2NOTLIKE') ? l$player_2NOTLIKE : const {},
      _$data.containsKey('player_2LIKE') ? l$player_2LIKE : const {},
      _$data.containsKey('turn') ? l$turn : const {},
      _$data.containsKey('turnGT') ? l$turnGT : const {},
      _$data.containsKey('turnGTE') ? l$turnGTE : const {},
      _$data.containsKey('turnLT') ? l$turnLT : const {},
      _$data.containsKey('turnLTE') ? l$turnLTE : const {},
      _$data.containsKey('turnNEQ') ? l$turnNEQ : const {},
      _$data.containsKey('turnEQ') ? l$turnEQ : const {},
      _$data.containsKey('turnNOTIN')
          ? l$turnNOTIN == null
              ? null
              : Object.hashAll(l$turnNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('turnIN')
          ? l$turnIN == null
              ? null
              : Object.hashAll(l$turnIN.map((v) => v))
          : const {},
      _$data.containsKey('turnNOTLIKE') ? l$turnNOTLIKE : const {},
      _$data.containsKey('turnLIKE') ? l$turnLIKE : const {},
      _$data.containsKey('winner') ? l$winner : const {},
      _$data.containsKey('winnerGT') ? l$winnerGT : const {},
      _$data.containsKey('winnerGTE') ? l$winnerGTE : const {},
      _$data.containsKey('winnerLT') ? l$winnerLT : const {},
      _$data.containsKey('winnerLTE') ? l$winnerLTE : const {},
      _$data.containsKey('winnerNEQ') ? l$winnerNEQ : const {},
      _$data.containsKey('winnerEQ') ? l$winnerEQ : const {},
      _$data.containsKey('winnerNOTIN')
          ? l$winnerNOTIN == null
              ? null
              : Object.hashAll(l$winnerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('winnerIN')
          ? l$winnerIN == null
              ? null
              : Object.hashAll(l$winnerIN.map((v) => v))
          : const {},
      _$data.containsKey('winnerNOTLIKE') ? l$winnerNOTLIKE : const {},
      _$data.containsKey('winnerLIKE') ? l$winnerLIKE : const {},
      _$data.containsKey('state') ? l$state : const {},
      _$data.containsKey('stateGT') ? l$stateGT : const {},
      _$data.containsKey('stateGTE') ? l$stateGTE : const {},
      _$data.containsKey('stateLT') ? l$stateLT : const {},
      _$data.containsKey('stateLTE') ? l$stateLTE : const {},
      _$data.containsKey('stateNEQ') ? l$stateNEQ : const {},
      _$data.containsKey('stateEQ') ? l$stateEQ : const {},
      _$data.containsKey('stateNOTIN')
          ? l$stateNOTIN == null
              ? null
              : Object.hashAll(l$stateNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('stateIN')
          ? l$stateIN == null
              ? null
              : Object.hashAll(l$stateIN.map((v) => v))
          : const {},
      _$data.containsKey('stateNOTLIKE') ? l$stateNOTLIKE : const {},
      _$data.containsKey('stateLIKE') ? l$stateLIKE : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_SessionWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_SessionWhereInput(
    Input$checkers_marq_SessionWhereInput instance,
    TRes Function(Input$checkers_marq_SessionWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_SessionWhereInput;

  factory CopyWith$Input$checkers_marq_SessionWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_SessionWhereInput;

  TRes call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player_1,
    String? player_1GT,
    String? player_1GTE,
    String? player_1LT,
    String? player_1LTE,
    String? player_1NEQ,
    String? player_1EQ,
    List<String?>? player_1NOTIN,
    List<String?>? player_1IN,
    String? player_1NOTLIKE,
    String? player_1LIKE,
    String? player_2,
    String? player_2GT,
    String? player_2GTE,
    String? player_2LT,
    String? player_2LTE,
    String? player_2NEQ,
    String? player_2EQ,
    List<String?>? player_2NOTIN,
    List<String?>? player_2IN,
    String? player_2NOTLIKE,
    String? player_2LIKE,
    String? turn,
    String? turnGT,
    String? turnGTE,
    String? turnLT,
    String? turnLTE,
    String? turnNEQ,
    String? turnEQ,
    List<String?>? turnNOTIN,
    List<String?>? turnIN,
    String? turnNOTLIKE,
    String? turnLIKE,
    String? winner,
    String? winnerGT,
    String? winnerGTE,
    String? winnerLT,
    String? winnerLTE,
    String? winnerNEQ,
    String? winnerEQ,
    List<String?>? winnerNOTIN,
    List<String?>? winnerIN,
    String? winnerNOTLIKE,
    String? winnerLIKE,
    String? state,
    String? stateGT,
    String? stateGTE,
    String? stateLT,
    String? stateLTE,
    String? stateNEQ,
    String? stateEQ,
    List<String?>? stateNOTIN,
    List<String?>? stateIN,
    String? stateNOTLIKE,
    String? stateLIKE,
  });
}

class _CopyWithImpl$Input$checkers_marq_SessionWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_SessionWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_SessionWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_SessionWhereInput _instance;

  final TRes Function(Input$checkers_marq_SessionWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? session_id = _undefined,
    Object? session_idGT = _undefined,
    Object? session_idGTE = _undefined,
    Object? session_idLT = _undefined,
    Object? session_idLTE = _undefined,
    Object? session_idNEQ = _undefined,
    Object? session_idEQ = _undefined,
    Object? session_idNOTIN = _undefined,
    Object? session_idIN = _undefined,
    Object? session_idNOTLIKE = _undefined,
    Object? session_idLIKE = _undefined,
    Object? player_1 = _undefined,
    Object? player_1GT = _undefined,
    Object? player_1GTE = _undefined,
    Object? player_1LT = _undefined,
    Object? player_1LTE = _undefined,
    Object? player_1NEQ = _undefined,
    Object? player_1EQ = _undefined,
    Object? player_1NOTIN = _undefined,
    Object? player_1IN = _undefined,
    Object? player_1NOTLIKE = _undefined,
    Object? player_1LIKE = _undefined,
    Object? player_2 = _undefined,
    Object? player_2GT = _undefined,
    Object? player_2GTE = _undefined,
    Object? player_2LT = _undefined,
    Object? player_2LTE = _undefined,
    Object? player_2NEQ = _undefined,
    Object? player_2EQ = _undefined,
    Object? player_2NOTIN = _undefined,
    Object? player_2IN = _undefined,
    Object? player_2NOTLIKE = _undefined,
    Object? player_2LIKE = _undefined,
    Object? turn = _undefined,
    Object? turnGT = _undefined,
    Object? turnGTE = _undefined,
    Object? turnLT = _undefined,
    Object? turnLTE = _undefined,
    Object? turnNEQ = _undefined,
    Object? turnEQ = _undefined,
    Object? turnNOTIN = _undefined,
    Object? turnIN = _undefined,
    Object? turnNOTLIKE = _undefined,
    Object? turnLIKE = _undefined,
    Object? winner = _undefined,
    Object? winnerGT = _undefined,
    Object? winnerGTE = _undefined,
    Object? winnerLT = _undefined,
    Object? winnerLTE = _undefined,
    Object? winnerNEQ = _undefined,
    Object? winnerEQ = _undefined,
    Object? winnerNOTIN = _undefined,
    Object? winnerIN = _undefined,
    Object? winnerNOTLIKE = _undefined,
    Object? winnerLIKE = _undefined,
    Object? state = _undefined,
    Object? stateGT = _undefined,
    Object? stateGTE = _undefined,
    Object? stateLT = _undefined,
    Object? stateLTE = _undefined,
    Object? stateNEQ = _undefined,
    Object? stateEQ = _undefined,
    Object? stateNOTIN = _undefined,
    Object? stateIN = _undefined,
    Object? stateNOTLIKE = _undefined,
    Object? stateLIKE = _undefined,
  }) =>
      _then(Input$checkers_marq_SessionWhereInput._({
        ..._instance._$data,
        if (session_id != _undefined) 'session_id': (session_id as String?),
        if (session_idGT != _undefined)
          'session_idGT': (session_idGT as String?),
        if (session_idGTE != _undefined)
          'session_idGTE': (session_idGTE as String?),
        if (session_idLT != _undefined)
          'session_idLT': (session_idLT as String?),
        if (session_idLTE != _undefined)
          'session_idLTE': (session_idLTE as String?),
        if (session_idNEQ != _undefined)
          'session_idNEQ': (session_idNEQ as String?),
        if (session_idEQ != _undefined)
          'session_idEQ': (session_idEQ as String?),
        if (session_idNOTIN != _undefined)
          'session_idNOTIN': (session_idNOTIN as List<String?>?),
        if (session_idIN != _undefined)
          'session_idIN': (session_idIN as List<String?>?),
        if (session_idNOTLIKE != _undefined)
          'session_idNOTLIKE': (session_idNOTLIKE as String?),
        if (session_idLIKE != _undefined)
          'session_idLIKE': (session_idLIKE as String?),
        if (player_1 != _undefined) 'player_1': (player_1 as String?),
        if (player_1GT != _undefined) 'player_1GT': (player_1GT as String?),
        if (player_1GTE != _undefined) 'player_1GTE': (player_1GTE as String?),
        if (player_1LT != _undefined) 'player_1LT': (player_1LT as String?),
        if (player_1LTE != _undefined) 'player_1LTE': (player_1LTE as String?),
        if (player_1NEQ != _undefined) 'player_1NEQ': (player_1NEQ as String?),
        if (player_1EQ != _undefined) 'player_1EQ': (player_1EQ as String?),
        if (player_1NOTIN != _undefined)
          'player_1NOTIN': (player_1NOTIN as List<String?>?),
        if (player_1IN != _undefined)
          'player_1IN': (player_1IN as List<String?>?),
        if (player_1NOTLIKE != _undefined)
          'player_1NOTLIKE': (player_1NOTLIKE as String?),
        if (player_1LIKE != _undefined)
          'player_1LIKE': (player_1LIKE as String?),
        if (player_2 != _undefined) 'player_2': (player_2 as String?),
        if (player_2GT != _undefined) 'player_2GT': (player_2GT as String?),
        if (player_2GTE != _undefined) 'player_2GTE': (player_2GTE as String?),
        if (player_2LT != _undefined) 'player_2LT': (player_2LT as String?),
        if (player_2LTE != _undefined) 'player_2LTE': (player_2LTE as String?),
        if (player_2NEQ != _undefined) 'player_2NEQ': (player_2NEQ as String?),
        if (player_2EQ != _undefined) 'player_2EQ': (player_2EQ as String?),
        if (player_2NOTIN != _undefined)
          'player_2NOTIN': (player_2NOTIN as List<String?>?),
        if (player_2IN != _undefined)
          'player_2IN': (player_2IN as List<String?>?),
        if (player_2NOTLIKE != _undefined)
          'player_2NOTLIKE': (player_2NOTLIKE as String?),
        if (player_2LIKE != _undefined)
          'player_2LIKE': (player_2LIKE as String?),
        if (turn != _undefined) 'turn': (turn as String?),
        if (turnGT != _undefined) 'turnGT': (turnGT as String?),
        if (turnGTE != _undefined) 'turnGTE': (turnGTE as String?),
        if (turnLT != _undefined) 'turnLT': (turnLT as String?),
        if (turnLTE != _undefined) 'turnLTE': (turnLTE as String?),
        if (turnNEQ != _undefined) 'turnNEQ': (turnNEQ as String?),
        if (turnEQ != _undefined) 'turnEQ': (turnEQ as String?),
        if (turnNOTIN != _undefined) 'turnNOTIN': (turnNOTIN as List<String?>?),
        if (turnIN != _undefined) 'turnIN': (turnIN as List<String?>?),
        if (turnNOTLIKE != _undefined) 'turnNOTLIKE': (turnNOTLIKE as String?),
        if (turnLIKE != _undefined) 'turnLIKE': (turnLIKE as String?),
        if (winner != _undefined) 'winner': (winner as String?),
        if (winnerGT != _undefined) 'winnerGT': (winnerGT as String?),
        if (winnerGTE != _undefined) 'winnerGTE': (winnerGTE as String?),
        if (winnerLT != _undefined) 'winnerLT': (winnerLT as String?),
        if (winnerLTE != _undefined) 'winnerLTE': (winnerLTE as String?),
        if (winnerNEQ != _undefined) 'winnerNEQ': (winnerNEQ as String?),
        if (winnerEQ != _undefined) 'winnerEQ': (winnerEQ as String?),
        if (winnerNOTIN != _undefined)
          'winnerNOTIN': (winnerNOTIN as List<String?>?),
        if (winnerIN != _undefined) 'winnerIN': (winnerIN as List<String?>?),
        if (winnerNOTLIKE != _undefined)
          'winnerNOTLIKE': (winnerNOTLIKE as String?),
        if (winnerLIKE != _undefined) 'winnerLIKE': (winnerLIKE as String?),
        if (state != _undefined) 'state': (state as String?),
        if (stateGT != _undefined) 'stateGT': (stateGT as String?),
        if (stateGTE != _undefined) 'stateGTE': (stateGTE as String?),
        if (stateLT != _undefined) 'stateLT': (stateLT as String?),
        if (stateLTE != _undefined) 'stateLTE': (stateLTE as String?),
        if (stateNEQ != _undefined) 'stateNEQ': (stateNEQ as String?),
        if (stateEQ != _undefined) 'stateEQ': (stateEQ as String?),
        if (stateNOTIN != _undefined)
          'stateNOTIN': (stateNOTIN as List<String?>?),
        if (stateIN != _undefined) 'stateIN': (stateIN as List<String?>?),
        if (stateNOTLIKE != _undefined)
          'stateNOTLIKE': (stateNOTLIKE as String?),
        if (stateLIKE != _undefined) 'stateLIKE': (stateLIKE as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_SessionWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_SessionWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_SessionWhereInput(this._res);

  TRes _res;

  call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player_1,
    String? player_1GT,
    String? player_1GTE,
    String? player_1LT,
    String? player_1LTE,
    String? player_1NEQ,
    String? player_1EQ,
    List<String?>? player_1NOTIN,
    List<String?>? player_1IN,
    String? player_1NOTLIKE,
    String? player_1LIKE,
    String? player_2,
    String? player_2GT,
    String? player_2GTE,
    String? player_2LT,
    String? player_2LTE,
    String? player_2NEQ,
    String? player_2EQ,
    List<String?>? player_2NOTIN,
    List<String?>? player_2IN,
    String? player_2NOTLIKE,
    String? player_2LIKE,
    String? turn,
    String? turnGT,
    String? turnGTE,
    String? turnLT,
    String? turnLTE,
    String? turnNEQ,
    String? turnEQ,
    List<String?>? turnNOTIN,
    List<String?>? turnIN,
    String? turnNOTLIKE,
    String? turnLIKE,
    String? winner,
    String? winnerGT,
    String? winnerGTE,
    String? winnerLT,
    String? winnerLTE,
    String? winnerNEQ,
    String? winnerEQ,
    List<String?>? winnerNOTIN,
    List<String?>? winnerIN,
    String? winnerNOTLIKE,
    String? winnerLIKE,
    String? state,
    String? stateGT,
    String? stateGTE,
    String? stateLT,
    String? stateLTE,
    String? stateNEQ,
    String? stateEQ,
    List<String?>? stateNOTIN,
    List<String?>? stateIN,
    String? stateNOTLIKE,
    String? stateLIKE,
  }) =>
      _res;
}

class Input$checkers_marq_WinnerOrder {
  factory Input$checkers_marq_WinnerOrder({
    required Enum$OrderDirection direction,
    required Enum$checkers_marq_WinnerOrderField field,
  }) =>
      Input$checkers_marq_WinnerOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$checkers_marq_WinnerOrder._(this._$data);

  factory Input$checkers_marq_WinnerOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$checkers_marq_WinnerOrderField((l$field as String));
    return Input$checkers_marq_WinnerOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$checkers_marq_WinnerOrderField get field =>
      (_$data['field'] as Enum$checkers_marq_WinnerOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$checkers_marq_WinnerOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$checkers_marq_WinnerOrder<Input$checkers_marq_WinnerOrder>
      get copyWith => CopyWith$Input$checkers_marq_WinnerOrder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_WinnerOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_WinnerOrder<TRes> {
  factory CopyWith$Input$checkers_marq_WinnerOrder(
    Input$checkers_marq_WinnerOrder instance,
    TRes Function(Input$checkers_marq_WinnerOrder) then,
  ) = _CopyWithImpl$Input$checkers_marq_WinnerOrder;

  factory CopyWith$Input$checkers_marq_WinnerOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_WinnerOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_WinnerOrderField? field,
  });
}

class _CopyWithImpl$Input$checkers_marq_WinnerOrder<TRes>
    implements CopyWith$Input$checkers_marq_WinnerOrder<TRes> {
  _CopyWithImpl$Input$checkers_marq_WinnerOrder(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_WinnerOrder _instance;

  final TRes Function(Input$checkers_marq_WinnerOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$checkers_marq_WinnerOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$checkers_marq_WinnerOrderField),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_WinnerOrder<TRes>
    implements CopyWith$Input$checkers_marq_WinnerOrder<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_WinnerOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$checkers_marq_WinnerOrderField? field,
  }) =>
      _res;
}

class Input$checkers_marq_WinnerWhereInput {
  factory Input$checkers_marq_WinnerWhereInput({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? position,
  }) =>
      Input$checkers_marq_WinnerWhereInput._({
        if (session_id != null) r'session_id': session_id,
        if (session_idGT != null) r'session_idGT': session_idGT,
        if (session_idGTE != null) r'session_idGTE': session_idGTE,
        if (session_idLT != null) r'session_idLT': session_idLT,
        if (session_idLTE != null) r'session_idLTE': session_idLTE,
        if (session_idNEQ != null) r'session_idNEQ': session_idNEQ,
        if (session_idEQ != null) r'session_idEQ': session_idEQ,
        if (session_idNOTIN != null) r'session_idNOTIN': session_idNOTIN,
        if (session_idIN != null) r'session_idIN': session_idIN,
        if (session_idNOTLIKE != null) r'session_idNOTLIKE': session_idNOTLIKE,
        if (session_idLIKE != null) r'session_idLIKE': session_idLIKE,
        if (player != null) r'player': player,
        if (playerGT != null) r'playerGT': playerGT,
        if (playerGTE != null) r'playerGTE': playerGTE,
        if (playerLT != null) r'playerLT': playerLT,
        if (playerLTE != null) r'playerLTE': playerLTE,
        if (playerNEQ != null) r'playerNEQ': playerNEQ,
        if (playerEQ != null) r'playerEQ': playerEQ,
        if (playerNOTIN != null) r'playerNOTIN': playerNOTIN,
        if (playerIN != null) r'playerIN': playerIN,
        if (playerNOTLIKE != null) r'playerNOTLIKE': playerNOTLIKE,
        if (playerLIKE != null) r'playerLIKE': playerLIKE,
        if (position != null) r'position': position,
      });

  Input$checkers_marq_WinnerWhereInput._(this._$data);

  factory Input$checkers_marq_WinnerWhereInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('session_id')) {
      final l$session_id = data['session_id'];
      result$data['session_id'] = (l$session_id as String?);
    }
    if (data.containsKey('session_idGT')) {
      final l$session_idGT = data['session_idGT'];
      result$data['session_idGT'] = (l$session_idGT as String?);
    }
    if (data.containsKey('session_idGTE')) {
      final l$session_idGTE = data['session_idGTE'];
      result$data['session_idGTE'] = (l$session_idGTE as String?);
    }
    if (data.containsKey('session_idLT')) {
      final l$session_idLT = data['session_idLT'];
      result$data['session_idLT'] = (l$session_idLT as String?);
    }
    if (data.containsKey('session_idLTE')) {
      final l$session_idLTE = data['session_idLTE'];
      result$data['session_idLTE'] = (l$session_idLTE as String?);
    }
    if (data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = data['session_idNEQ'];
      result$data['session_idNEQ'] = (l$session_idNEQ as String?);
    }
    if (data.containsKey('session_idEQ')) {
      final l$session_idEQ = data['session_idEQ'];
      result$data['session_idEQ'] = (l$session_idEQ as String?);
    }
    if (data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = data['session_idNOTIN'];
      result$data['session_idNOTIN'] = (l$session_idNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idIN')) {
      final l$session_idIN = data['session_idIN'];
      result$data['session_idIN'] = (l$session_idIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = data['session_idNOTLIKE'];
      result$data['session_idNOTLIKE'] = (l$session_idNOTLIKE as String?);
    }
    if (data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = data['session_idLIKE'];
      result$data['session_idLIKE'] = (l$session_idLIKE as String?);
    }
    if (data.containsKey('player')) {
      final l$player = data['player'];
      result$data['player'] = (l$player as String?);
    }
    if (data.containsKey('playerGT')) {
      final l$playerGT = data['playerGT'];
      result$data['playerGT'] = (l$playerGT as String?);
    }
    if (data.containsKey('playerGTE')) {
      final l$playerGTE = data['playerGTE'];
      result$data['playerGTE'] = (l$playerGTE as String?);
    }
    if (data.containsKey('playerLT')) {
      final l$playerLT = data['playerLT'];
      result$data['playerLT'] = (l$playerLT as String?);
    }
    if (data.containsKey('playerLTE')) {
      final l$playerLTE = data['playerLTE'];
      result$data['playerLTE'] = (l$playerLTE as String?);
    }
    if (data.containsKey('playerNEQ')) {
      final l$playerNEQ = data['playerNEQ'];
      result$data['playerNEQ'] = (l$playerNEQ as String?);
    }
    if (data.containsKey('playerEQ')) {
      final l$playerEQ = data['playerEQ'];
      result$data['playerEQ'] = (l$playerEQ as String?);
    }
    if (data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = data['playerNOTIN'];
      result$data['playerNOTIN'] = (l$playerNOTIN as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('playerIN')) {
      final l$playerIN = data['playerIN'];
      result$data['playerIN'] =
          (l$playerIN as List<dynamic>?)?.map((e) => (e as String?)).toList();
    }
    if (data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = data['playerNOTLIKE'];
      result$data['playerNOTLIKE'] = (l$playerNOTLIKE as String?);
    }
    if (data.containsKey('playerLIKE')) {
      final l$playerLIKE = data['playerLIKE'];
      result$data['playerLIKE'] = (l$playerLIKE as String?);
    }
    if (data.containsKey('position')) {
      final l$position = data['position'];
      result$data['position'] = (l$position as String?);
    }
    return Input$checkers_marq_WinnerWhereInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get session_id => (_$data['session_id'] as String?);

  String? get session_idGT => (_$data['session_idGT'] as String?);

  String? get session_idGTE => (_$data['session_idGTE'] as String?);

  String? get session_idLT => (_$data['session_idLT'] as String?);

  String? get session_idLTE => (_$data['session_idLTE'] as String?);

  String? get session_idNEQ => (_$data['session_idNEQ'] as String?);

  String? get session_idEQ => (_$data['session_idEQ'] as String?);

  List<String?>? get session_idNOTIN =>
      (_$data['session_idNOTIN'] as List<String?>?);

  List<String?>? get session_idIN => (_$data['session_idIN'] as List<String?>?);

  String? get session_idNOTLIKE => (_$data['session_idNOTLIKE'] as String?);

  String? get session_idLIKE => (_$data['session_idLIKE'] as String?);

  String? get player => (_$data['player'] as String?);

  String? get playerGT => (_$data['playerGT'] as String?);

  String? get playerGTE => (_$data['playerGTE'] as String?);

  String? get playerLT => (_$data['playerLT'] as String?);

  String? get playerLTE => (_$data['playerLTE'] as String?);

  String? get playerNEQ => (_$data['playerNEQ'] as String?);

  String? get playerEQ => (_$data['playerEQ'] as String?);

  List<String?>? get playerNOTIN => (_$data['playerNOTIN'] as List<String?>?);

  List<String?>? get playerIN => (_$data['playerIN'] as List<String?>?);

  String? get playerNOTLIKE => (_$data['playerNOTLIKE'] as String?);

  String? get playerLIKE => (_$data['playerLIKE'] as String?);

  String? get position => (_$data['position'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('session_id')) {
      final l$session_id = session_id;
      result$data['session_id'] = l$session_id;
    }
    if (_$data.containsKey('session_idGT')) {
      final l$session_idGT = session_idGT;
      result$data['session_idGT'] = l$session_idGT;
    }
    if (_$data.containsKey('session_idGTE')) {
      final l$session_idGTE = session_idGTE;
      result$data['session_idGTE'] = l$session_idGTE;
    }
    if (_$data.containsKey('session_idLT')) {
      final l$session_idLT = session_idLT;
      result$data['session_idLT'] = l$session_idLT;
    }
    if (_$data.containsKey('session_idLTE')) {
      final l$session_idLTE = session_idLTE;
      result$data['session_idLTE'] = l$session_idLTE;
    }
    if (_$data.containsKey('session_idNEQ')) {
      final l$session_idNEQ = session_idNEQ;
      result$data['session_idNEQ'] = l$session_idNEQ;
    }
    if (_$data.containsKey('session_idEQ')) {
      final l$session_idEQ = session_idEQ;
      result$data['session_idEQ'] = l$session_idEQ;
    }
    if (_$data.containsKey('session_idNOTIN')) {
      final l$session_idNOTIN = session_idNOTIN;
      result$data['session_idNOTIN'] =
          l$session_idNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idIN')) {
      final l$session_idIN = session_idIN;
      result$data['session_idIN'] = l$session_idIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('session_idNOTLIKE')) {
      final l$session_idNOTLIKE = session_idNOTLIKE;
      result$data['session_idNOTLIKE'] = l$session_idNOTLIKE;
    }
    if (_$data.containsKey('session_idLIKE')) {
      final l$session_idLIKE = session_idLIKE;
      result$data['session_idLIKE'] = l$session_idLIKE;
    }
    if (_$data.containsKey('player')) {
      final l$player = player;
      result$data['player'] = l$player;
    }
    if (_$data.containsKey('playerGT')) {
      final l$playerGT = playerGT;
      result$data['playerGT'] = l$playerGT;
    }
    if (_$data.containsKey('playerGTE')) {
      final l$playerGTE = playerGTE;
      result$data['playerGTE'] = l$playerGTE;
    }
    if (_$data.containsKey('playerLT')) {
      final l$playerLT = playerLT;
      result$data['playerLT'] = l$playerLT;
    }
    if (_$data.containsKey('playerLTE')) {
      final l$playerLTE = playerLTE;
      result$data['playerLTE'] = l$playerLTE;
    }
    if (_$data.containsKey('playerNEQ')) {
      final l$playerNEQ = playerNEQ;
      result$data['playerNEQ'] = l$playerNEQ;
    }
    if (_$data.containsKey('playerEQ')) {
      final l$playerEQ = playerEQ;
      result$data['playerEQ'] = l$playerEQ;
    }
    if (_$data.containsKey('playerNOTIN')) {
      final l$playerNOTIN = playerNOTIN;
      result$data['playerNOTIN'] = l$playerNOTIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerIN')) {
      final l$playerIN = playerIN;
      result$data['playerIN'] = l$playerIN?.map((e) => e).toList();
    }
    if (_$data.containsKey('playerNOTLIKE')) {
      final l$playerNOTLIKE = playerNOTLIKE;
      result$data['playerNOTLIKE'] = l$playerNOTLIKE;
    }
    if (_$data.containsKey('playerLIKE')) {
      final l$playerLIKE = playerLIKE;
      result$data['playerLIKE'] = l$playerLIKE;
    }
    if (_$data.containsKey('position')) {
      final l$position = position;
      result$data['position'] = l$position;
    }
    return result$data;
  }

  CopyWith$Input$checkers_marq_WinnerWhereInput<
          Input$checkers_marq_WinnerWhereInput>
      get copyWith => CopyWith$Input$checkers_marq_WinnerWhereInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$checkers_marq_WinnerWhereInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (_$data.containsKey('session_id') !=
        other._$data.containsKey('session_id')) {
      return false;
    }
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$session_idGT = session_idGT;
    final lOther$session_idGT = other.session_idGT;
    if (_$data.containsKey('session_idGT') !=
        other._$data.containsKey('session_idGT')) {
      return false;
    }
    if (l$session_idGT != lOther$session_idGT) {
      return false;
    }
    final l$session_idGTE = session_idGTE;
    final lOther$session_idGTE = other.session_idGTE;
    if (_$data.containsKey('session_idGTE') !=
        other._$data.containsKey('session_idGTE')) {
      return false;
    }
    if (l$session_idGTE != lOther$session_idGTE) {
      return false;
    }
    final l$session_idLT = session_idLT;
    final lOther$session_idLT = other.session_idLT;
    if (_$data.containsKey('session_idLT') !=
        other._$data.containsKey('session_idLT')) {
      return false;
    }
    if (l$session_idLT != lOther$session_idLT) {
      return false;
    }
    final l$session_idLTE = session_idLTE;
    final lOther$session_idLTE = other.session_idLTE;
    if (_$data.containsKey('session_idLTE') !=
        other._$data.containsKey('session_idLTE')) {
      return false;
    }
    if (l$session_idLTE != lOther$session_idLTE) {
      return false;
    }
    final l$session_idNEQ = session_idNEQ;
    final lOther$session_idNEQ = other.session_idNEQ;
    if (_$data.containsKey('session_idNEQ') !=
        other._$data.containsKey('session_idNEQ')) {
      return false;
    }
    if (l$session_idNEQ != lOther$session_idNEQ) {
      return false;
    }
    final l$session_idEQ = session_idEQ;
    final lOther$session_idEQ = other.session_idEQ;
    if (_$data.containsKey('session_idEQ') !=
        other._$data.containsKey('session_idEQ')) {
      return false;
    }
    if (l$session_idEQ != lOther$session_idEQ) {
      return false;
    }
    final l$session_idNOTIN = session_idNOTIN;
    final lOther$session_idNOTIN = other.session_idNOTIN;
    if (_$data.containsKey('session_idNOTIN') !=
        other._$data.containsKey('session_idNOTIN')) {
      return false;
    }
    if (l$session_idNOTIN != null && lOther$session_idNOTIN != null) {
      if (l$session_idNOTIN.length != lOther$session_idNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idNOTIN.length; i++) {
        final l$session_idNOTIN$entry = l$session_idNOTIN[i];
        final lOther$session_idNOTIN$entry = lOther$session_idNOTIN[i];
        if (l$session_idNOTIN$entry != lOther$session_idNOTIN$entry) {
          return false;
        }
      }
    } else if (l$session_idNOTIN != lOther$session_idNOTIN) {
      return false;
    }
    final l$session_idIN = session_idIN;
    final lOther$session_idIN = other.session_idIN;
    if (_$data.containsKey('session_idIN') !=
        other._$data.containsKey('session_idIN')) {
      return false;
    }
    if (l$session_idIN != null && lOther$session_idIN != null) {
      if (l$session_idIN.length != lOther$session_idIN.length) {
        return false;
      }
      for (int i = 0; i < l$session_idIN.length; i++) {
        final l$session_idIN$entry = l$session_idIN[i];
        final lOther$session_idIN$entry = lOther$session_idIN[i];
        if (l$session_idIN$entry != lOther$session_idIN$entry) {
          return false;
        }
      }
    } else if (l$session_idIN != lOther$session_idIN) {
      return false;
    }
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final lOther$session_idNOTLIKE = other.session_idNOTLIKE;
    if (_$data.containsKey('session_idNOTLIKE') !=
        other._$data.containsKey('session_idNOTLIKE')) {
      return false;
    }
    if (l$session_idNOTLIKE != lOther$session_idNOTLIKE) {
      return false;
    }
    final l$session_idLIKE = session_idLIKE;
    final lOther$session_idLIKE = other.session_idLIKE;
    if (_$data.containsKey('session_idLIKE') !=
        other._$data.containsKey('session_idLIKE')) {
      return false;
    }
    if (l$session_idLIKE != lOther$session_idLIKE) {
      return false;
    }
    final l$player = player;
    final lOther$player = other.player;
    if (_$data.containsKey('player') != other._$data.containsKey('player')) {
      return false;
    }
    if (l$player != lOther$player) {
      return false;
    }
    final l$playerGT = playerGT;
    final lOther$playerGT = other.playerGT;
    if (_$data.containsKey('playerGT') !=
        other._$data.containsKey('playerGT')) {
      return false;
    }
    if (l$playerGT != lOther$playerGT) {
      return false;
    }
    final l$playerGTE = playerGTE;
    final lOther$playerGTE = other.playerGTE;
    if (_$data.containsKey('playerGTE') !=
        other._$data.containsKey('playerGTE')) {
      return false;
    }
    if (l$playerGTE != lOther$playerGTE) {
      return false;
    }
    final l$playerLT = playerLT;
    final lOther$playerLT = other.playerLT;
    if (_$data.containsKey('playerLT') !=
        other._$data.containsKey('playerLT')) {
      return false;
    }
    if (l$playerLT != lOther$playerLT) {
      return false;
    }
    final l$playerLTE = playerLTE;
    final lOther$playerLTE = other.playerLTE;
    if (_$data.containsKey('playerLTE') !=
        other._$data.containsKey('playerLTE')) {
      return false;
    }
    if (l$playerLTE != lOther$playerLTE) {
      return false;
    }
    final l$playerNEQ = playerNEQ;
    final lOther$playerNEQ = other.playerNEQ;
    if (_$data.containsKey('playerNEQ') !=
        other._$data.containsKey('playerNEQ')) {
      return false;
    }
    if (l$playerNEQ != lOther$playerNEQ) {
      return false;
    }
    final l$playerEQ = playerEQ;
    final lOther$playerEQ = other.playerEQ;
    if (_$data.containsKey('playerEQ') !=
        other._$data.containsKey('playerEQ')) {
      return false;
    }
    if (l$playerEQ != lOther$playerEQ) {
      return false;
    }
    final l$playerNOTIN = playerNOTIN;
    final lOther$playerNOTIN = other.playerNOTIN;
    if (_$data.containsKey('playerNOTIN') !=
        other._$data.containsKey('playerNOTIN')) {
      return false;
    }
    if (l$playerNOTIN != null && lOther$playerNOTIN != null) {
      if (l$playerNOTIN.length != lOther$playerNOTIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerNOTIN.length; i++) {
        final l$playerNOTIN$entry = l$playerNOTIN[i];
        final lOther$playerNOTIN$entry = lOther$playerNOTIN[i];
        if (l$playerNOTIN$entry != lOther$playerNOTIN$entry) {
          return false;
        }
      }
    } else if (l$playerNOTIN != lOther$playerNOTIN) {
      return false;
    }
    final l$playerIN = playerIN;
    final lOther$playerIN = other.playerIN;
    if (_$data.containsKey('playerIN') !=
        other._$data.containsKey('playerIN')) {
      return false;
    }
    if (l$playerIN != null && lOther$playerIN != null) {
      if (l$playerIN.length != lOther$playerIN.length) {
        return false;
      }
      for (int i = 0; i < l$playerIN.length; i++) {
        final l$playerIN$entry = l$playerIN[i];
        final lOther$playerIN$entry = lOther$playerIN[i];
        if (l$playerIN$entry != lOther$playerIN$entry) {
          return false;
        }
      }
    } else if (l$playerIN != lOther$playerIN) {
      return false;
    }
    final l$playerNOTLIKE = playerNOTLIKE;
    final lOther$playerNOTLIKE = other.playerNOTLIKE;
    if (_$data.containsKey('playerNOTLIKE') !=
        other._$data.containsKey('playerNOTLIKE')) {
      return false;
    }
    if (l$playerNOTLIKE != lOther$playerNOTLIKE) {
      return false;
    }
    final l$playerLIKE = playerLIKE;
    final lOther$playerLIKE = other.playerLIKE;
    if (_$data.containsKey('playerLIKE') !=
        other._$data.containsKey('playerLIKE')) {
      return false;
    }
    if (l$playerLIKE != lOther$playerLIKE) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (_$data.containsKey('position') !=
        other._$data.containsKey('position')) {
      return false;
    }
    if (l$position != lOther$position) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$session_idGT = session_idGT;
    final l$session_idGTE = session_idGTE;
    final l$session_idLT = session_idLT;
    final l$session_idLTE = session_idLTE;
    final l$session_idNEQ = session_idNEQ;
    final l$session_idEQ = session_idEQ;
    final l$session_idNOTIN = session_idNOTIN;
    final l$session_idIN = session_idIN;
    final l$session_idNOTLIKE = session_idNOTLIKE;
    final l$session_idLIKE = session_idLIKE;
    final l$player = player;
    final l$playerGT = playerGT;
    final l$playerGTE = playerGTE;
    final l$playerLT = playerLT;
    final l$playerLTE = playerLTE;
    final l$playerNEQ = playerNEQ;
    final l$playerEQ = playerEQ;
    final l$playerNOTIN = playerNOTIN;
    final l$playerIN = playerIN;
    final l$playerNOTLIKE = playerNOTLIKE;
    final l$playerLIKE = playerLIKE;
    final l$position = position;
    return Object.hashAll([
      _$data.containsKey('session_id') ? l$session_id : const {},
      _$data.containsKey('session_idGT') ? l$session_idGT : const {},
      _$data.containsKey('session_idGTE') ? l$session_idGTE : const {},
      _$data.containsKey('session_idLT') ? l$session_idLT : const {},
      _$data.containsKey('session_idLTE') ? l$session_idLTE : const {},
      _$data.containsKey('session_idNEQ') ? l$session_idNEQ : const {},
      _$data.containsKey('session_idEQ') ? l$session_idEQ : const {},
      _$data.containsKey('session_idNOTIN')
          ? l$session_idNOTIN == null
              ? null
              : Object.hashAll(l$session_idNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idIN')
          ? l$session_idIN == null
              ? null
              : Object.hashAll(l$session_idIN.map((v) => v))
          : const {},
      _$data.containsKey('session_idNOTLIKE') ? l$session_idNOTLIKE : const {},
      _$data.containsKey('session_idLIKE') ? l$session_idLIKE : const {},
      _$data.containsKey('player') ? l$player : const {},
      _$data.containsKey('playerGT') ? l$playerGT : const {},
      _$data.containsKey('playerGTE') ? l$playerGTE : const {},
      _$data.containsKey('playerLT') ? l$playerLT : const {},
      _$data.containsKey('playerLTE') ? l$playerLTE : const {},
      _$data.containsKey('playerNEQ') ? l$playerNEQ : const {},
      _$data.containsKey('playerEQ') ? l$playerEQ : const {},
      _$data.containsKey('playerNOTIN')
          ? l$playerNOTIN == null
              ? null
              : Object.hashAll(l$playerNOTIN.map((v) => v))
          : const {},
      _$data.containsKey('playerIN')
          ? l$playerIN == null
              ? null
              : Object.hashAll(l$playerIN.map((v) => v))
          : const {},
      _$data.containsKey('playerNOTLIKE') ? l$playerNOTLIKE : const {},
      _$data.containsKey('playerLIKE') ? l$playerLIKE : const {},
      _$data.containsKey('position') ? l$position : const {},
    ]);
  }
}

abstract class CopyWith$Input$checkers_marq_WinnerWhereInput<TRes> {
  factory CopyWith$Input$checkers_marq_WinnerWhereInput(
    Input$checkers_marq_WinnerWhereInput instance,
    TRes Function(Input$checkers_marq_WinnerWhereInput) then,
  ) = _CopyWithImpl$Input$checkers_marq_WinnerWhereInput;

  factory CopyWith$Input$checkers_marq_WinnerWhereInput.stub(TRes res) =
      _CopyWithStubImpl$Input$checkers_marq_WinnerWhereInput;

  TRes call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? position,
  });
}

class _CopyWithImpl$Input$checkers_marq_WinnerWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_WinnerWhereInput<TRes> {
  _CopyWithImpl$Input$checkers_marq_WinnerWhereInput(
    this._instance,
    this._then,
  );

  final Input$checkers_marq_WinnerWhereInput _instance;

  final TRes Function(Input$checkers_marq_WinnerWhereInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? session_id = _undefined,
    Object? session_idGT = _undefined,
    Object? session_idGTE = _undefined,
    Object? session_idLT = _undefined,
    Object? session_idLTE = _undefined,
    Object? session_idNEQ = _undefined,
    Object? session_idEQ = _undefined,
    Object? session_idNOTIN = _undefined,
    Object? session_idIN = _undefined,
    Object? session_idNOTLIKE = _undefined,
    Object? session_idLIKE = _undefined,
    Object? player = _undefined,
    Object? playerGT = _undefined,
    Object? playerGTE = _undefined,
    Object? playerLT = _undefined,
    Object? playerLTE = _undefined,
    Object? playerNEQ = _undefined,
    Object? playerEQ = _undefined,
    Object? playerNOTIN = _undefined,
    Object? playerIN = _undefined,
    Object? playerNOTLIKE = _undefined,
    Object? playerLIKE = _undefined,
    Object? position = _undefined,
  }) =>
      _then(Input$checkers_marq_WinnerWhereInput._({
        ..._instance._$data,
        if (session_id != _undefined) 'session_id': (session_id as String?),
        if (session_idGT != _undefined)
          'session_idGT': (session_idGT as String?),
        if (session_idGTE != _undefined)
          'session_idGTE': (session_idGTE as String?),
        if (session_idLT != _undefined)
          'session_idLT': (session_idLT as String?),
        if (session_idLTE != _undefined)
          'session_idLTE': (session_idLTE as String?),
        if (session_idNEQ != _undefined)
          'session_idNEQ': (session_idNEQ as String?),
        if (session_idEQ != _undefined)
          'session_idEQ': (session_idEQ as String?),
        if (session_idNOTIN != _undefined)
          'session_idNOTIN': (session_idNOTIN as List<String?>?),
        if (session_idIN != _undefined)
          'session_idIN': (session_idIN as List<String?>?),
        if (session_idNOTLIKE != _undefined)
          'session_idNOTLIKE': (session_idNOTLIKE as String?),
        if (session_idLIKE != _undefined)
          'session_idLIKE': (session_idLIKE as String?),
        if (player != _undefined) 'player': (player as String?),
        if (playerGT != _undefined) 'playerGT': (playerGT as String?),
        if (playerGTE != _undefined) 'playerGTE': (playerGTE as String?),
        if (playerLT != _undefined) 'playerLT': (playerLT as String?),
        if (playerLTE != _undefined) 'playerLTE': (playerLTE as String?),
        if (playerNEQ != _undefined) 'playerNEQ': (playerNEQ as String?),
        if (playerEQ != _undefined) 'playerEQ': (playerEQ as String?),
        if (playerNOTIN != _undefined)
          'playerNOTIN': (playerNOTIN as List<String?>?),
        if (playerIN != _undefined) 'playerIN': (playerIN as List<String?>?),
        if (playerNOTLIKE != _undefined)
          'playerNOTLIKE': (playerNOTLIKE as String?),
        if (playerLIKE != _undefined) 'playerLIKE': (playerLIKE as String?),
        if (position != _undefined) 'position': (position as String?),
      }));
}

class _CopyWithStubImpl$Input$checkers_marq_WinnerWhereInput<TRes>
    implements CopyWith$Input$checkers_marq_WinnerWhereInput<TRes> {
  _CopyWithStubImpl$Input$checkers_marq_WinnerWhereInput(this._res);

  TRes _res;

  call({
    String? session_id,
    String? session_idGT,
    String? session_idGTE,
    String? session_idLT,
    String? session_idLTE,
    String? session_idNEQ,
    String? session_idEQ,
    List<String?>? session_idNOTIN,
    List<String?>? session_idIN,
    String? session_idNOTLIKE,
    String? session_idLIKE,
    String? player,
    String? playerGT,
    String? playerGTE,
    String? playerLT,
    String? playerLTE,
    String? playerNEQ,
    String? playerEQ,
    List<String?>? playerNOTIN,
    List<String?>? playerIN,
    String? playerNOTLIKE,
    String? playerLIKE,
    String? position,
  }) =>
      _res;
}

class Input$World__ModelOrder {
  factory Input$World__ModelOrder({
    required Enum$OrderDirection direction,
    required Enum$World__ModelOrderField field,
  }) =>
      Input$World__ModelOrder._({
        r'direction': direction,
        r'field': field,
      });

  Input$World__ModelOrder._(this._$data);

  factory Input$World__ModelOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$direction = data['direction'];
    result$data['direction'] =
        fromJson$Enum$OrderDirection((l$direction as String));
    final l$field = data['field'];
    result$data['field'] =
        fromJson$Enum$World__ModelOrderField((l$field as String));
    return Input$World__ModelOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OrderDirection get direction =>
      (_$data['direction'] as Enum$OrderDirection);

  Enum$World__ModelOrderField get field =>
      (_$data['field'] as Enum$World__ModelOrderField);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderDirection(l$direction);
    final l$field = field;
    result$data['field'] = toJson$Enum$World__ModelOrderField(l$field);
    return result$data;
  }

  CopyWith$Input$World__ModelOrder<Input$World__ModelOrder> get copyWith =>
      CopyWith$Input$World__ModelOrder(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$World__ModelOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$direction = direction;
    final l$field = field;
    return Object.hashAll([
      l$direction,
      l$field,
    ]);
  }
}

abstract class CopyWith$Input$World__ModelOrder<TRes> {
  factory CopyWith$Input$World__ModelOrder(
    Input$World__ModelOrder instance,
    TRes Function(Input$World__ModelOrder) then,
  ) = _CopyWithImpl$Input$World__ModelOrder;

  factory CopyWith$Input$World__ModelOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$World__ModelOrder;

  TRes call({
    Enum$OrderDirection? direction,
    Enum$World__ModelOrderField? field,
  });
}

class _CopyWithImpl$Input$World__ModelOrder<TRes>
    implements CopyWith$Input$World__ModelOrder<TRes> {
  _CopyWithImpl$Input$World__ModelOrder(
    this._instance,
    this._then,
  );

  final Input$World__ModelOrder _instance;

  final TRes Function(Input$World__ModelOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? direction = _undefined,
    Object? field = _undefined,
  }) =>
      _then(Input$World__ModelOrder._({
        ..._instance._$data,
        if (direction != _undefined && direction != null)
          'direction': (direction as Enum$OrderDirection),
        if (field != _undefined && field != null)
          'field': (field as Enum$World__ModelOrderField),
      }));
}

class _CopyWithStubImpl$Input$World__ModelOrder<TRes>
    implements CopyWith$Input$World__ModelOrder<TRes> {
  _CopyWithStubImpl$Input$World__ModelOrder(this._res);

  TRes _res;

  call({
    Enum$OrderDirection? direction,
    Enum$World__ModelOrderField? field,
  }) =>
      _res;
}

enum Enum$checkers_marq_CounterOrderField {
  GLOBAL_KEY,
  VALUE,
  $unknown;

  factory Enum$checkers_marq_CounterOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_CounterOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_CounterOrderField(this);
}

String toJson$Enum$checkers_marq_CounterOrderField(
    Enum$checkers_marq_CounterOrderField e) {
  switch (e) {
    case Enum$checkers_marq_CounterOrderField.GLOBAL_KEY:
      return r'GLOBAL_KEY';
    case Enum$checkers_marq_CounterOrderField.VALUE:
      return r'VALUE';
    case Enum$checkers_marq_CounterOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_CounterOrderField
    fromJson$Enum$checkers_marq_CounterOrderField(String value) {
  switch (value) {
    case r'GLOBAL_KEY':
      return Enum$checkers_marq_CounterOrderField.GLOBAL_KEY;
    case r'VALUE':
      return Enum$checkers_marq_CounterOrderField.VALUE;
    default:
      return Enum$checkers_marq_CounterOrderField.$unknown;
  }
}

enum Enum$checkers_marq_KilledOrderField {
  SESSION_ID,
  PLAYER,
  ROW,
  COL,
  $unknown;

  factory Enum$checkers_marq_KilledOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_KilledOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_KilledOrderField(this);
}

String toJson$Enum$checkers_marq_KilledOrderField(
    Enum$checkers_marq_KilledOrderField e) {
  switch (e) {
    case Enum$checkers_marq_KilledOrderField.SESSION_ID:
      return r'SESSION_ID';
    case Enum$checkers_marq_KilledOrderField.PLAYER:
      return r'PLAYER';
    case Enum$checkers_marq_KilledOrderField.ROW:
      return r'ROW';
    case Enum$checkers_marq_KilledOrderField.COL:
      return r'COL';
    case Enum$checkers_marq_KilledOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_KilledOrderField
    fromJson$Enum$checkers_marq_KilledOrderField(String value) {
  switch (value) {
    case r'SESSION_ID':
      return Enum$checkers_marq_KilledOrderField.SESSION_ID;
    case r'PLAYER':
      return Enum$checkers_marq_KilledOrderField.PLAYER;
    case r'ROW':
      return Enum$checkers_marq_KilledOrderField.ROW;
    case r'COL':
      return Enum$checkers_marq_KilledOrderField.COL;
    default:
      return Enum$checkers_marq_KilledOrderField.$unknown;
  }
}

enum Enum$checkers_marq_KingOrderField {
  SESSION_ID,
  PLAYER,
  ROW,
  COL,
  $unknown;

  factory Enum$checkers_marq_KingOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_KingOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_KingOrderField(this);
}

String toJson$Enum$checkers_marq_KingOrderField(
    Enum$checkers_marq_KingOrderField e) {
  switch (e) {
    case Enum$checkers_marq_KingOrderField.SESSION_ID:
      return r'SESSION_ID';
    case Enum$checkers_marq_KingOrderField.PLAYER:
      return r'PLAYER';
    case Enum$checkers_marq_KingOrderField.ROW:
      return r'ROW';
    case Enum$checkers_marq_KingOrderField.COL:
      return r'COL';
    case Enum$checkers_marq_KingOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_KingOrderField fromJson$Enum$checkers_marq_KingOrderField(
    String value) {
  switch (value) {
    case r'SESSION_ID':
      return Enum$checkers_marq_KingOrderField.SESSION_ID;
    case r'PLAYER':
      return Enum$checkers_marq_KingOrderField.PLAYER;
    case r'ROW':
      return Enum$checkers_marq_KingOrderField.ROW;
    case r'COL':
      return Enum$checkers_marq_KingOrderField.COL;
    default:
      return Enum$checkers_marq_KingOrderField.$unknown;
  }
}

enum Enum$checkers_marq_MovedOrderField {
  SESSION_ID,
  PLAYER,
  ROW,
  COL,
  $unknown;

  factory Enum$checkers_marq_MovedOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_MovedOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_MovedOrderField(this);
}

String toJson$Enum$checkers_marq_MovedOrderField(
    Enum$checkers_marq_MovedOrderField e) {
  switch (e) {
    case Enum$checkers_marq_MovedOrderField.SESSION_ID:
      return r'SESSION_ID';
    case Enum$checkers_marq_MovedOrderField.PLAYER:
      return r'PLAYER';
    case Enum$checkers_marq_MovedOrderField.ROW:
      return r'ROW';
    case Enum$checkers_marq_MovedOrderField.COL:
      return r'COL';
    case Enum$checkers_marq_MovedOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_MovedOrderField fromJson$Enum$checkers_marq_MovedOrderField(
    String value) {
  switch (value) {
    case r'SESSION_ID':
      return Enum$checkers_marq_MovedOrderField.SESSION_ID;
    case r'PLAYER':
      return Enum$checkers_marq_MovedOrderField.PLAYER;
    case r'ROW':
      return Enum$checkers_marq_MovedOrderField.ROW;
    case r'COL':
      return Enum$checkers_marq_MovedOrderField.COL;
    default:
      return Enum$checkers_marq_MovedOrderField.$unknown;
  }
}

enum Enum$checkers_marq_PieceOrderField {
  SESSION_ID,
  ROW,
  COL,
  PLAYER,
  POSITION,
  IS_KING,
  IS_ALIVE,
  $unknown;

  factory Enum$checkers_marq_PieceOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_PieceOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_PieceOrderField(this);
}

String toJson$Enum$checkers_marq_PieceOrderField(
    Enum$checkers_marq_PieceOrderField e) {
  switch (e) {
    case Enum$checkers_marq_PieceOrderField.SESSION_ID:
      return r'SESSION_ID';
    case Enum$checkers_marq_PieceOrderField.ROW:
      return r'ROW';
    case Enum$checkers_marq_PieceOrderField.COL:
      return r'COL';
    case Enum$checkers_marq_PieceOrderField.PLAYER:
      return r'PLAYER';
    case Enum$checkers_marq_PieceOrderField.POSITION:
      return r'POSITION';
    case Enum$checkers_marq_PieceOrderField.IS_KING:
      return r'IS_KING';
    case Enum$checkers_marq_PieceOrderField.IS_ALIVE:
      return r'IS_ALIVE';
    case Enum$checkers_marq_PieceOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_PieceOrderField fromJson$Enum$checkers_marq_PieceOrderField(
    String value) {
  switch (value) {
    case r'SESSION_ID':
      return Enum$checkers_marq_PieceOrderField.SESSION_ID;
    case r'ROW':
      return Enum$checkers_marq_PieceOrderField.ROW;
    case r'COL':
      return Enum$checkers_marq_PieceOrderField.COL;
    case r'PLAYER':
      return Enum$checkers_marq_PieceOrderField.PLAYER;
    case r'POSITION':
      return Enum$checkers_marq_PieceOrderField.POSITION;
    case r'IS_KING':
      return Enum$checkers_marq_PieceOrderField.IS_KING;
    case r'IS_ALIVE':
      return Enum$checkers_marq_PieceOrderField.IS_ALIVE;
    default:
      return Enum$checkers_marq_PieceOrderField.$unknown;
  }
}

enum Enum$checkers_marq_PlayerOrderField {
  PLAYER,
  REMAINING_PIECES,
  $unknown;

  factory Enum$checkers_marq_PlayerOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_PlayerOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_PlayerOrderField(this);
}

String toJson$Enum$checkers_marq_PlayerOrderField(
    Enum$checkers_marq_PlayerOrderField e) {
  switch (e) {
    case Enum$checkers_marq_PlayerOrderField.PLAYER:
      return r'PLAYER';
    case Enum$checkers_marq_PlayerOrderField.REMAINING_PIECES:
      return r'REMAINING_PIECES';
    case Enum$checkers_marq_PlayerOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_PlayerOrderField
    fromJson$Enum$checkers_marq_PlayerOrderField(String value) {
  switch (value) {
    case r'PLAYER':
      return Enum$checkers_marq_PlayerOrderField.PLAYER;
    case r'REMAINING_PIECES':
      return Enum$checkers_marq_PlayerOrderField.REMAINING_PIECES;
    default:
      return Enum$checkers_marq_PlayerOrderField.$unknown;
  }
}

enum Enum$checkers_marq_SessionOrderField {
  SESSION_ID,
  PLAYER_1,
  PLAYER_2,
  TURN,
  WINNER,
  STATE,
  $unknown;

  factory Enum$checkers_marq_SessionOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_SessionOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_SessionOrderField(this);
}

String toJson$Enum$checkers_marq_SessionOrderField(
    Enum$checkers_marq_SessionOrderField e) {
  switch (e) {
    case Enum$checkers_marq_SessionOrderField.SESSION_ID:
      return r'SESSION_ID';
    case Enum$checkers_marq_SessionOrderField.PLAYER_1:
      return r'PLAYER_1';
    case Enum$checkers_marq_SessionOrderField.PLAYER_2:
      return r'PLAYER_2';
    case Enum$checkers_marq_SessionOrderField.TURN:
      return r'TURN';
    case Enum$checkers_marq_SessionOrderField.WINNER:
      return r'WINNER';
    case Enum$checkers_marq_SessionOrderField.STATE:
      return r'STATE';
    case Enum$checkers_marq_SessionOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_SessionOrderField
    fromJson$Enum$checkers_marq_SessionOrderField(String value) {
  switch (value) {
    case r'SESSION_ID':
      return Enum$checkers_marq_SessionOrderField.SESSION_ID;
    case r'PLAYER_1':
      return Enum$checkers_marq_SessionOrderField.PLAYER_1;
    case r'PLAYER_2':
      return Enum$checkers_marq_SessionOrderField.PLAYER_2;
    case r'TURN':
      return Enum$checkers_marq_SessionOrderField.TURN;
    case r'WINNER':
      return Enum$checkers_marq_SessionOrderField.WINNER;
    case r'STATE':
      return Enum$checkers_marq_SessionOrderField.STATE;
    default:
      return Enum$checkers_marq_SessionOrderField.$unknown;
  }
}

enum Enum$checkers_marq_WinnerOrderField {
  SESSION_ID,
  PLAYER,
  POSITION,
  $unknown;

  factory Enum$checkers_marq_WinnerOrderField.fromJson(String value) =>
      fromJson$Enum$checkers_marq_WinnerOrderField(value);

  String toJson() => toJson$Enum$checkers_marq_WinnerOrderField(this);
}

String toJson$Enum$checkers_marq_WinnerOrderField(
    Enum$checkers_marq_WinnerOrderField e) {
  switch (e) {
    case Enum$checkers_marq_WinnerOrderField.SESSION_ID:
      return r'SESSION_ID';
    case Enum$checkers_marq_WinnerOrderField.PLAYER:
      return r'PLAYER';
    case Enum$checkers_marq_WinnerOrderField.POSITION:
      return r'POSITION';
    case Enum$checkers_marq_WinnerOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$checkers_marq_WinnerOrderField
    fromJson$Enum$checkers_marq_WinnerOrderField(String value) {
  switch (value) {
    case r'SESSION_ID':
      return Enum$checkers_marq_WinnerOrderField.SESSION_ID;
    case r'PLAYER':
      return Enum$checkers_marq_WinnerOrderField.PLAYER;
    case r'POSITION':
      return Enum$checkers_marq_WinnerOrderField.POSITION;
    default:
      return Enum$checkers_marq_WinnerOrderField.$unknown;
  }
}

enum Enum$OrderDirection {
  ASC,
  DESC,
  $unknown;

  factory Enum$OrderDirection.fromJson(String value) =>
      fromJson$Enum$OrderDirection(value);

  String toJson() => toJson$Enum$OrderDirection(this);
}

String toJson$Enum$OrderDirection(Enum$OrderDirection e) {
  switch (e) {
    case Enum$OrderDirection.ASC:
      return r'ASC';
    case Enum$OrderDirection.DESC:
      return r'DESC';
    case Enum$OrderDirection.$unknown:
      return r'$unknown';
  }
}

Enum$OrderDirection fromJson$Enum$OrderDirection(String value) {
  switch (value) {
    case r'ASC':
      return Enum$OrderDirection.ASC;
    case r'DESC':
      return Enum$OrderDirection.DESC;
    default:
      return Enum$OrderDirection.$unknown;
  }
}

enum Enum$World__ModelOrderField {
  NAME,
  CLASS_HASH,
  $unknown;

  factory Enum$World__ModelOrderField.fromJson(String value) =>
      fromJson$Enum$World__ModelOrderField(value);

  String toJson() => toJson$Enum$World__ModelOrderField(this);
}

String toJson$Enum$World__ModelOrderField(Enum$World__ModelOrderField e) {
  switch (e) {
    case Enum$World__ModelOrderField.NAME:
      return r'NAME';
    case Enum$World__ModelOrderField.CLASS_HASH:
      return r'CLASS_HASH';
    case Enum$World__ModelOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$World__ModelOrderField fromJson$Enum$World__ModelOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$World__ModelOrderField.NAME;
    case r'CLASS_HASH':
      return Enum$World__ModelOrderField.CLASS_HASH;
    default:
      return Enum$World__ModelOrderField.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'ERC__Token': {
    'ERC20__Token',
    'ERC721__Token',
  },
  'ModelUnion': {
    'checkers_marq_Winner',
    'checkers_marq_Counter',
    'checkers_marq_Player',
    'checkers_marq_Moved',
    'checkers_marq_Killed',
    'checkers_marq_Session',
    'checkers_marq_Piece',
    'checkers_marq_King',
  },
};

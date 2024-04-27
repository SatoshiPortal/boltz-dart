// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get hex => throw _privateConstructorUsedError;
  int? get eta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call({String id, String hex, int? eta});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
    Object? eta = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      eta: freezed == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String hex, int? eta});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
    Object? eta = freezed,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      eta: freezed == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl({required this.id, required this.hex, this.eta});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String hex;
  @override
  final int? eta;

  @override
  String toString() {
    return 'Transaction(id: $id, hex: $hex, eta: $eta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hex, hex) || other.hex == hex) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, hex, eta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String hex,
      final int? eta}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get hex;
  @override
  int? get eta;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapStatusResponse _$SwapStatusResponseFromJson(Map<String, dynamic> json) {
  return _SwapStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$SwapStatusResponse {
  SwapStatus get status => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SwapStatusResponseCopyWith<SwapStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapStatusResponseCopyWith<$Res> {
  factory $SwapStatusResponseCopyWith(
          SwapStatusResponse value, $Res Function(SwapStatusResponse) then) =
      _$SwapStatusResponseCopyWithImpl<$Res, SwapStatusResponse>;
  @useResult
  $Res call(
      {SwapStatus status,
      Transaction? transaction,
      String? failureReason,
      String? error});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$SwapStatusResponseCopyWithImpl<$Res, $Val extends SwapStatusResponse>
    implements $SwapStatusResponseCopyWith<$Res> {
  _$SwapStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transaction = freezed,
    Object? failureReason = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SwapStatusResponseImplCopyWith<$Res>
    implements $SwapStatusResponseCopyWith<$Res> {
  factory _$$SwapStatusResponseImplCopyWith(_$SwapStatusResponseImpl value,
          $Res Function(_$SwapStatusResponseImpl) then) =
      __$$SwapStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SwapStatus status,
      Transaction? transaction,
      String? failureReason,
      String? error});

  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$SwapStatusResponseImplCopyWithImpl<$Res>
    extends _$SwapStatusResponseCopyWithImpl<$Res, _$SwapStatusResponseImpl>
    implements _$$SwapStatusResponseImplCopyWith<$Res> {
  __$$SwapStatusResponseImplCopyWithImpl(_$SwapStatusResponseImpl _value,
      $Res Function(_$SwapStatusResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transaction = freezed,
    Object? failureReason = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SwapStatusResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapStatusResponseImpl implements _SwapStatusResponse {
  const _$SwapStatusResponseImpl(
      {required this.status, this.transaction, this.failureReason, this.error});

  factory _$SwapStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapStatusResponseImplFromJson(json);

  @override
  final SwapStatus status;
  @override
  final Transaction? transaction;
  @override
  final String? failureReason;
  @override
  final String? error;

  @override
  String toString() {
    return 'SwapStatusResponse(status: $status, transaction: $transaction, failureReason: $failureReason, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapStatusResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, transaction, failureReason, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapStatusResponseImplCopyWith<_$SwapStatusResponseImpl> get copyWith =>
      __$$SwapStatusResponseImplCopyWithImpl<_$SwapStatusResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _SwapStatusResponse implements SwapStatusResponse {
  const factory _SwapStatusResponse(
      {required final SwapStatus status,
      final Transaction? transaction,
      final String? failureReason,
      final String? error}) = _$SwapStatusResponseImpl;

  factory _SwapStatusResponse.fromJson(Map<String, dynamic> json) =
      _$SwapStatusResponseImpl.fromJson;

  @override
  SwapStatus get status;
  @override
  Transaction? get transaction;
  @override
  String? get failureReason;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$SwapStatusResponseImplCopyWith<_$SwapStatusResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapStreamStatus _$SwapStreamStatusFromJson(Map<String, dynamic> json) {
  return _SwapStreamStatus.fromJson(json);
}

/// @nodoc
mixin _$SwapStreamStatus {
  String get id => throw _privateConstructorUsedError;
  SwapStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SwapStreamStatusCopyWith<SwapStreamStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapStreamStatusCopyWith<$Res> {
  factory $SwapStreamStatusCopyWith(
          SwapStreamStatus value, $Res Function(SwapStreamStatus) then) =
      _$SwapStreamStatusCopyWithImpl<$Res, SwapStreamStatus>;
  @useResult
  $Res call({String id, SwapStatus status, String? error});
}

/// @nodoc
class _$SwapStreamStatusCopyWithImpl<$Res, $Val extends SwapStreamStatus>
    implements $SwapStreamStatusCopyWith<$Res> {
  _$SwapStreamStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwapStreamStatusImplCopyWith<$Res>
    implements $SwapStreamStatusCopyWith<$Res> {
  factory _$$SwapStreamStatusImplCopyWith(_$SwapStreamStatusImpl value,
          $Res Function(_$SwapStreamStatusImpl) then) =
      __$$SwapStreamStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, SwapStatus status, String? error});
}

/// @nodoc
class __$$SwapStreamStatusImplCopyWithImpl<$Res>
    extends _$SwapStreamStatusCopyWithImpl<$Res, _$SwapStreamStatusImpl>
    implements _$$SwapStreamStatusImplCopyWith<$Res> {
  __$$SwapStreamStatusImplCopyWithImpl(_$SwapStreamStatusImpl _value,
      $Res Function(_$SwapStreamStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$SwapStreamStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapStreamStatusImpl implements _SwapStreamStatus {
  const _$SwapStreamStatusImpl(
      {required this.id, required this.status, this.error});

  factory _$SwapStreamStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapStreamStatusImplFromJson(json);

  @override
  final String id;
  @override
  final SwapStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'SwapStreamStatus(id: $id, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapStreamStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapStreamStatusImplCopyWith<_$SwapStreamStatusImpl> get copyWith =>
      __$$SwapStreamStatusImplCopyWithImpl<_$SwapStreamStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapStreamStatusImplToJson(
      this,
    );
  }
}

abstract class _SwapStreamStatus implements SwapStreamStatus {
  const factory _SwapStreamStatus(
      {required final String id,
      required final SwapStatus status,
      final String? error}) = _$SwapStreamStatusImpl;

  factory _SwapStreamStatus.fromJson(Map<String, dynamic> json) =
      _$SwapStreamStatusImpl.fromJson;

  @override
  String get id;
  @override
  SwapStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$SwapStreamStatusImplCopyWith<_$SwapStreamStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transaction {
  String get id;
  String get hex;
  int? get eta;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<Transaction> get copyWith =>
      _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hex, hex) || other.hex == hex) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, hex, eta);

  @override
  String toString() {
    return 'Transaction(id: $id, hex: $hex, eta: $eta)';
  }
}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) _then) =
      _$TransactionCopyWithImpl;
  @useResult
  $Res call({String id, String hex, int? eta});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
    Object? eta = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hex: null == hex
          ? _self.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      eta: freezed == eta
          ? _self.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Transaction implements Transaction {
  const _Transaction({required this.id, required this.hex, this.eta});
  factory _Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @override
  final String id;
  @override
  final String hex;
  @override
  final int? eta;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hex, hex) || other.hex == hex) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, hex, eta);

  @override
  String toString() {
    return 'Transaction(id: $id, hex: $hex, eta: $eta)';
  }
}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) _then) =
      __$TransactionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String hex, int? eta});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? hex = null,
    Object? eta = freezed,
  }) {
    return _then(_Transaction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hex: null == hex
          ? _self.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      eta: freezed == eta
          ? _self.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$SwapStatusResponse {
  SwapStatus get status;
  Transaction? get transaction;
  String? get failureReason;
  String? get error;

  /// Create a copy of SwapStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwapStatusResponseCopyWith<SwapStatusResponse> get copyWith =>
      _$SwapStatusResponseCopyWithImpl<SwapStatusResponse>(
          this as SwapStatusResponse, _$identity);

  /// Serializes this SwapStatusResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwapStatusResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, transaction, failureReason, error);

  @override
  String toString() {
    return 'SwapStatusResponse(status: $status, transaction: $transaction, failureReason: $failureReason, error: $error)';
  }
}

/// @nodoc
abstract mixin class $SwapStatusResponseCopyWith<$Res> {
  factory $SwapStatusResponseCopyWith(
          SwapStatusResponse value, $Res Function(SwapStatusResponse) _then) =
      _$SwapStatusResponseCopyWithImpl;
  @useResult
  $Res call(
      {SwapStatus status,
      Transaction? transaction,
      String? failureReason,
      String? error});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$SwapStatusResponseCopyWithImpl<$Res>
    implements $SwapStatusResponseCopyWith<$Res> {
  _$SwapStatusResponseCopyWithImpl(this._self, this._then);

  final SwapStatusResponse _self;
  final $Res Function(SwapStatusResponse) _then;

  /// Create a copy of SwapStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transaction = freezed,
    Object? failureReason = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      transaction: freezed == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      failureReason: freezed == failureReason
          ? _self.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SwapStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_self.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_self.transaction!, (value) {
      return _then(_self.copyWith(transaction: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SwapStatusResponse implements SwapStatusResponse {
  const _SwapStatusResponse(
      {required this.status, this.transaction, this.failureReason, this.error});
  factory _SwapStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SwapStatusResponseFromJson(json);

  @override
  final SwapStatus status;
  @override
  final Transaction? transaction;
  @override
  final String? failureReason;
  @override
  final String? error;

  /// Create a copy of SwapStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SwapStatusResponseCopyWith<_SwapStatusResponse> get copyWith =>
      __$SwapStatusResponseCopyWithImpl<_SwapStatusResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SwapStatusResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwapStatusResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, transaction, failureReason, error);

  @override
  String toString() {
    return 'SwapStatusResponse(status: $status, transaction: $transaction, failureReason: $failureReason, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$SwapStatusResponseCopyWith<$Res>
    implements $SwapStatusResponseCopyWith<$Res> {
  factory _$SwapStatusResponseCopyWith(
          _SwapStatusResponse value, $Res Function(_SwapStatusResponse) _then) =
      __$SwapStatusResponseCopyWithImpl;
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
class __$SwapStatusResponseCopyWithImpl<$Res>
    implements _$SwapStatusResponseCopyWith<$Res> {
  __$SwapStatusResponseCopyWithImpl(this._self, this._then);

  final _SwapStatusResponse _self;
  final $Res Function(_SwapStatusResponse) _then;

  /// Create a copy of SwapStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? transaction = freezed,
    Object? failureReason = freezed,
    Object? error = freezed,
  }) {
    return _then(_SwapStatusResponse(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      transaction: freezed == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      failureReason: freezed == failureReason
          ? _self.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SwapStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_self.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_self.transaction!, (value) {
      return _then(_self.copyWith(transaction: value));
    });
  }
}

/// @nodoc
mixin _$SwapStreamStatus {
  String get id;
  SwapStatus get status;
  String? get error;

  /// Create a copy of SwapStreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwapStreamStatusCopyWith<SwapStreamStatus> get copyWith =>
      _$SwapStreamStatusCopyWithImpl<SwapStreamStatus>(
          this as SwapStreamStatus, _$identity);

  /// Serializes this SwapStreamStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwapStreamStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, error);

  @override
  String toString() {
    return 'SwapStreamStatus(id: $id, status: $status, error: $error)';
  }
}

/// @nodoc
abstract mixin class $SwapStreamStatusCopyWith<$Res> {
  factory $SwapStreamStatusCopyWith(
          SwapStreamStatus value, $Res Function(SwapStreamStatus) _then) =
      _$SwapStreamStatusCopyWithImpl;
  @useResult
  $Res call({String id, SwapStatus status, String? error});
}

/// @nodoc
class _$SwapStreamStatusCopyWithImpl<$Res>
    implements $SwapStreamStatusCopyWith<$Res> {
  _$SwapStreamStatusCopyWithImpl(this._self, this._then);

  final SwapStreamStatus _self;
  final $Res Function(SwapStreamStatus) _then;

  /// Create a copy of SwapStreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SwapStreamStatus implements SwapStreamStatus {
  const _SwapStreamStatus({required this.id, required this.status, this.error});
  factory _SwapStreamStatus.fromJson(Map<String, dynamic> json) =>
      _$SwapStreamStatusFromJson(json);

  @override
  final String id;
  @override
  final SwapStatus status;
  @override
  final String? error;

  /// Create a copy of SwapStreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SwapStreamStatusCopyWith<_SwapStreamStatus> get copyWith =>
      __$SwapStreamStatusCopyWithImpl<_SwapStreamStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SwapStreamStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwapStreamStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, error);

  @override
  String toString() {
    return 'SwapStreamStatus(id: $id, status: $status, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$SwapStreamStatusCopyWith<$Res>
    implements $SwapStreamStatusCopyWith<$Res> {
  factory _$SwapStreamStatusCopyWith(
          _SwapStreamStatus value, $Res Function(_SwapStreamStatus) _then) =
      __$SwapStreamStatusCopyWithImpl;
  @override
  @useResult
  $Res call({String id, SwapStatus status, String? error});
}

/// @nodoc
class __$SwapStreamStatusCopyWithImpl<$Res>
    implements _$SwapStreamStatusCopyWith<$Res> {
  __$SwapStreamStatusCopyWithImpl(this._self, this._then);

  final _SwapStreamStatus _self;
  final $Res Function(_SwapStreamStatus) _then;

  /// Create a copy of SwapStreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_SwapStreamStatus(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

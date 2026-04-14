// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Transaction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Transaction() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Transaction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transaction():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Transaction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transaction() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String hex, int? eta)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Transaction() when $default != null:
        return $default(_that.id, _that.hex, _that.eta);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String hex, int? eta) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transaction():
        return $default(_that.id, _that.hex, _that.eta);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String hex, int? eta)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transaction() when $default != null:
        return $default(_that.id, _that.hex, _that.eta);
      case _:
        return null;
    }
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

/// Adds pattern-matching-related methods to [SwapStatusResponse].
extension SwapStatusResponsePatterns on SwapStatusResponse {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SwapStatusResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SwapStatusResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SwapStatusResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStatusResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SwapStatusResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStatusResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SwapStatus status, Transaction? transaction,
            String? failureReason, String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SwapStatusResponse() when $default != null:
        return $default(
            _that.status, _that.transaction, _that.failureReason, _that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SwapStatus status, Transaction? transaction,
            String? failureReason, String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStatusResponse():
        return $default(
            _that.status, _that.transaction, _that.failureReason, _that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SwapStatus status, Transaction? transaction,
            String? failureReason, String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStatusResponse() when $default != null:
        return $default(
            _that.status, _that.transaction, _that.failureReason, _that.error);
      case _:
        return null;
    }
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
  Transaction? get transaction;

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
            (identical(other.error, error) || other.error == error) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, error, transaction);

  @override
  String toString() {
    return 'SwapStreamStatus(id: $id, status: $status, error: $error, transaction: $transaction)';
  }
}

/// @nodoc
abstract mixin class $SwapStreamStatusCopyWith<$Res> {
  factory $SwapStreamStatusCopyWith(
          SwapStreamStatus value, $Res Function(SwapStreamStatus) _then) =
      _$SwapStreamStatusCopyWithImpl;
  @useResult
  $Res call(
      {String id, SwapStatus status, String? error, Transaction? transaction});

  $TransactionCopyWith<$Res>? get transaction;
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
    Object? transaction = freezed,
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
      transaction: freezed == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
    ));
  }

  /// Create a copy of SwapStreamStatus
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

/// Adds pattern-matching-related methods to [SwapStreamStatus].
extension SwapStreamStatusPatterns on SwapStreamStatus {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SwapStreamStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SwapStreamStatus() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SwapStreamStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStreamStatus():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SwapStreamStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStreamStatus() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, SwapStatus status, String? error,
            Transaction? transaction)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SwapStreamStatus() when $default != null:
        return $default(_that.id, _that.status, _that.error, _that.transaction);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, SwapStatus status, String? error,
            Transaction? transaction)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStreamStatus():
        return $default(_that.id, _that.status, _that.error, _that.transaction);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, SwapStatus status, String? error,
            Transaction? transaction)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SwapStreamStatus() when $default != null:
        return $default(_that.id, _that.status, _that.error, _that.transaction);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SwapStreamStatus implements SwapStreamStatus {
  const _SwapStreamStatus(
      {required this.id, required this.status, this.error, this.transaction});
  factory _SwapStreamStatus.fromJson(Map<String, dynamic> json) =>
      _$SwapStreamStatusFromJson(json);

  @override
  final String id;
  @override
  final SwapStatus status;
  @override
  final String? error;
  @override
  final Transaction? transaction;

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
            (identical(other.error, error) || other.error == error) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, error, transaction);

  @override
  String toString() {
    return 'SwapStreamStatus(id: $id, status: $status, error: $error, transaction: $transaction)';
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
  $Res call(
      {String id, SwapStatus status, String? error, Transaction? transaction});

  @override
  $TransactionCopyWith<$Res>? get transaction;
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
    Object? transaction = freezed,
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
      transaction: freezed == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
    ));
  }

  /// Create a copy of SwapStreamStatus
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

// dart format on

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

SwapStatusResponse _$SwapStatusResponseFromJson(Map<String, dynamic> json) {
  return _SwapStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$SwapStatusResponse {
  String get id => throw _privateConstructorUsedError;
  SwapStatus get status => throw _privateConstructorUsedError;
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
      {String id, SwapStatus status, String? failureReason, String? error});
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
    Object? id = null,
    Object? status = null,
    Object? failureReason = freezed,
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
      {String id, SwapStatus status, String? failureReason, String? error});
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
    Object? id = null,
    Object? status = null,
    Object? failureReason = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SwapStatusResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SwapStatus,
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
      {required this.id, required this.status, this.failureReason, this.error});

  factory _$SwapStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapStatusResponseImplFromJson(json);

  @override
  final String id;
  @override
  final SwapStatus status;
  @override
  final String? failureReason;
  @override
  final String? error;

  @override
  String toString() {
    return 'SwapStatusResponse(id: $id, status: $status, failureReason: $failureReason, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapStatusResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, failureReason, error);

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
      {required final String id,
      required final SwapStatus status,
      final String? failureReason,
      final String? error}) = _$SwapStatusResponseImpl;

  factory _SwapStatusResponse.fromJson(Map<String, dynamic> json) =
      _$SwapStatusResponseImpl.fromJson;

  @override
  String get id;
  @override
  SwapStatus get status;
  @override
  String? get failureReason;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$SwapStatusResponseImplCopyWith<_$SwapStatusResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

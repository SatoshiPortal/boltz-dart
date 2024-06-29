// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Fees {
  String get boltzUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeesCopyWith<Fees> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeesCopyWith<$Res> {
  factory $FeesCopyWith(Fees value, $Res Function(Fees) then) =
      _$FeesCopyWithImpl<$Res, Fees>;
  @useResult
  $Res call({String boltzUrl});
}

/// @nodoc
class _$FeesCopyWithImpl<$Res, $Val extends Fees>
    implements $FeesCopyWith<$Res> {
  _$FeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boltzUrl = null,
  }) {
    return _then(_value.copyWith(
      boltzUrl: null == boltzUrl
          ? _value.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeesImplCopyWith<$Res> implements $FeesCopyWith<$Res> {
  factory _$$FeesImplCopyWith(
          _$FeesImpl value, $Res Function(_$FeesImpl) then) =
      __$$FeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String boltzUrl});
}

/// @nodoc
class __$$FeesImplCopyWithImpl<$Res>
    extends _$FeesCopyWithImpl<$Res, _$FeesImpl>
    implements _$$FeesImplCopyWith<$Res> {
  __$$FeesImplCopyWithImpl(_$FeesImpl _value, $Res Function(_$FeesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boltzUrl = null,
  }) {
    return _then(_$FeesImpl(
      boltzUrl: null == boltzUrl
          ? _value.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FeesImpl extends _Fees {
  const _$FeesImpl({required this.boltzUrl}) : super._();

  @override
  final String boltzUrl;

  @override
  String toString() {
    return 'Fees(boltzUrl: $boltzUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeesImpl &&
            (identical(other.boltzUrl, boltzUrl) ||
                other.boltzUrl == boltzUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, boltzUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeesImplCopyWith<_$FeesImpl> get copyWith =>
      __$$FeesImplCopyWithImpl<_$FeesImpl>(this, _$identity);
}

abstract class _Fees extends Fees {
  const factory _Fees({required final String boltzUrl}) = _$FeesImpl;
  const _Fees._() : super._();

  @override
  String get boltzUrl;
  @override
  @JsonKey(ignore: true)
  _$$FeesImplCopyWith<_$FeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorResponseEntity _$ErrorResponseEntityFromJson(Map<String, dynamic> json) {
  return _ErrorResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseEntity {
  String get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseEntityCopyWith<ErrorResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseEntityCopyWith<$Res> {
  factory $ErrorResponseEntityCopyWith(
          ErrorResponseEntity value, $Res Function(ErrorResponseEntity) then) =
      _$ErrorResponseEntityCopyWithImpl<$Res, ErrorResponseEntity>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$ErrorResponseEntityCopyWithImpl<$Res, $Val extends ErrorResponseEntity>
    implements $ErrorResponseEntityCopyWith<$Res> {
  _$ErrorResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorResponseEntityCopyWith<$Res>
    implements $ErrorResponseEntityCopyWith<$Res> {
  factory _$$_ErrorResponseEntityCopyWith(_$_ErrorResponseEntity value,
          $Res Function(_$_ErrorResponseEntity) then) =
      __$$_ErrorResponseEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$_ErrorResponseEntityCopyWithImpl<$Res>
    extends _$ErrorResponseEntityCopyWithImpl<$Res, _$_ErrorResponseEntity>
    implements _$$_ErrorResponseEntityCopyWith<$Res> {
  __$$_ErrorResponseEntityCopyWithImpl(_$_ErrorResponseEntity _value,
      $Res Function(_$_ErrorResponseEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$_ErrorResponseEntity(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorResponseEntity implements _ErrorResponseEntity {
  const _$_ErrorResponseEntity({required this.msg});

  factory _$_ErrorResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorResponseEntityFromJson(json);

  @override
  final String msg;

  @override
  String toString() {
    return 'ErrorResponseEntity(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorResponseEntity &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResponseEntityCopyWith<_$_ErrorResponseEntity> get copyWith =>
      __$$_ErrorResponseEntityCopyWithImpl<_$_ErrorResponseEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseEntityToJson(
      this,
    );
  }
}

abstract class _ErrorResponseEntity implements ErrorResponseEntity {
  const factory _ErrorResponseEntity({required final String msg}) =
      _$_ErrorResponseEntity;

  factory _ErrorResponseEntity.fromJson(Map<String, dynamic> json) =
      _$_ErrorResponseEntity.fromJson;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorResponseEntityCopyWith<_$_ErrorResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

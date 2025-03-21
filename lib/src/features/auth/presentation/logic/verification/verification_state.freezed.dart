// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationStateCopyWith<$Res> {
  factory $VerificationStateCopyWith(
          VerificationState value, $Res Function(VerificationState) then) =
      _$VerificationStateCopyWithImpl<$Res, VerificationState>;
}

/// @nodoc
class _$VerificationStateCopyWithImpl<$Res, $Val extends VerificationState>
    implements $VerificationStateCopyWith<$Res> {
  _$VerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VerificationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VerificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VerificationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VerificationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$VerificationSuccessImplCopyWith<$Res> {
  factory _$$VerificationSuccessImplCopyWith(_$VerificationSuccessImpl value,
          $Res Function(_$VerificationSuccessImpl) then) =
      __$$VerificationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginResponse response});
}

/// @nodoc
class __$$VerificationSuccessImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$VerificationSuccessImpl>
    implements _$$VerificationSuccessImplCopyWith<$Res> {
  __$$VerificationSuccessImplCopyWithImpl(_$VerificationSuccessImpl _value,
      $Res Function(_$VerificationSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$VerificationSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginResponse,
    ));
  }
}

/// @nodoc

class _$VerificationSuccessImpl implements _VerificationSuccess {
  const _$VerificationSuccessImpl(this.response);

  @override
  final LoginResponse response;

  @override
  String toString() {
    return 'VerificationState.verificationSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationSuccessImplCopyWith<_$VerificationSuccessImpl> get copyWith =>
      __$$VerificationSuccessImplCopyWithImpl<_$VerificationSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) {
    return verificationSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) {
    return verificationSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) {
    if (verificationSuccess != null) {
      return verificationSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) {
    return verificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) {
    return verificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) {
    if (verificationSuccess != null) {
      return verificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _VerificationSuccess implements VerificationState {
  const factory _VerificationSuccess(final LoginResponse response) =
      _$VerificationSuccessImpl;

  LoginResponse get response;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationSuccessImplCopyWith<_$VerificationSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationErrorImplCopyWith<$Res> {
  factory _$$VerificationErrorImplCopyWith(_$VerificationErrorImpl value,
          $Res Function(_$VerificationErrorImpl) then) =
      __$$VerificationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorModel error});
}

/// @nodoc
class __$$VerificationErrorImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$VerificationErrorImpl>
    implements _$$VerificationErrorImplCopyWith<$Res> {
  __$$VerificationErrorImplCopyWithImpl(_$VerificationErrorImpl _value,
      $Res Function(_$VerificationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$VerificationErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel,
    ));
  }
}

/// @nodoc

class _$VerificationErrorImpl implements _VerificationError {
  const _$VerificationErrorImpl(this.error);

  @override
  final ErrorModel error;

  @override
  String toString() {
    return 'VerificationState.verificationError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationErrorImplCopyWith<_$VerificationErrorImpl> get copyWith =>
      __$$VerificationErrorImplCopyWithImpl<_$VerificationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) {
    return verificationError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) {
    return verificationError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) {
    if (verificationError != null) {
      return verificationError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) {
    return verificationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) {
    return verificationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) {
    if (verificationError != null) {
      return verificationError(this);
    }
    return orElse();
  }
}

abstract class _VerificationError implements VerificationState {
  const factory _VerificationError(final ErrorModel error) =
      _$VerificationErrorImpl;

  ErrorModel get error;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationErrorImplCopyWith<_$VerificationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendCodeSuccessImplCopyWith<$Res> {
  factory _$$ResendCodeSuccessImplCopyWith(_$ResendCodeSuccessImpl value,
          $Res Function(_$ResendCodeSuccessImpl) then) =
      __$$ResendCodeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ResendCodeSuccessImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$ResendCodeSuccessImpl>
    implements _$$ResendCodeSuccessImplCopyWith<$Res> {
  __$$ResendCodeSuccessImplCopyWithImpl(_$ResendCodeSuccessImpl _value,
      $Res Function(_$ResendCodeSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ResendCodeSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResendCodeSuccessImpl implements _ResendCodeSuccess {
  const _$ResendCodeSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VerificationState.resendCodeSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendCodeSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendCodeSuccessImplCopyWith<_$ResendCodeSuccessImpl> get copyWith =>
      __$$ResendCodeSuccessImplCopyWithImpl<_$ResendCodeSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) {
    return resendCodeSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) {
    return resendCodeSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) {
    if (resendCodeSuccess != null) {
      return resendCodeSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) {
    return resendCodeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) {
    return resendCodeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) {
    if (resendCodeSuccess != null) {
      return resendCodeSuccess(this);
    }
    return orElse();
  }
}

abstract class _ResendCodeSuccess implements VerificationState {
  const factory _ResendCodeSuccess(final String message) =
      _$ResendCodeSuccessImpl;

  String get message;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendCodeSuccessImplCopyWith<_$ResendCodeSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendCodeErrorImplCopyWith<$Res> {
  factory _$$ResendCodeErrorImplCopyWith(_$ResendCodeErrorImpl value,
          $Res Function(_$ResendCodeErrorImpl) then) =
      __$$ResendCodeErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorModel error});
}

/// @nodoc
class __$$ResendCodeErrorImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$ResendCodeErrorImpl>
    implements _$$ResendCodeErrorImplCopyWith<$Res> {
  __$$ResendCodeErrorImplCopyWithImpl(
      _$ResendCodeErrorImpl _value, $Res Function(_$ResendCodeErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResendCodeErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel,
    ));
  }
}

/// @nodoc

class _$ResendCodeErrorImpl implements _ResendCodeError {
  const _$ResendCodeErrorImpl(this.error);

  @override
  final ErrorModel error;

  @override
  String toString() {
    return 'VerificationState.resendCodeError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendCodeErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendCodeErrorImplCopyWith<_$ResendCodeErrorImpl> get copyWith =>
      __$$ResendCodeErrorImplCopyWithImpl<_$ResendCodeErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) verificationSuccess,
    required TResult Function(ErrorModel error) verificationError,
    required TResult Function(String message) resendCodeSuccess,
    required TResult Function(ErrorModel error) resendCodeError,
  }) {
    return resendCodeError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginResponse response)? verificationSuccess,
    TResult? Function(ErrorModel error)? verificationError,
    TResult? Function(String message)? resendCodeSuccess,
    TResult? Function(ErrorModel error)? resendCodeError,
  }) {
    return resendCodeError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? verificationSuccess,
    TResult Function(ErrorModel error)? verificationError,
    TResult Function(String message)? resendCodeSuccess,
    TResult Function(ErrorModel error)? resendCodeError,
    required TResult orElse(),
  }) {
    if (resendCodeError != null) {
      return resendCodeError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationError value) verificationError,
    required TResult Function(_ResendCodeSuccess value) resendCodeSuccess,
    required TResult Function(_ResendCodeError value) resendCodeError,
  }) {
    return resendCodeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationError value)? verificationError,
    TResult? Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult? Function(_ResendCodeError value)? resendCodeError,
  }) {
    return resendCodeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationError value)? verificationError,
    TResult Function(_ResendCodeSuccess value)? resendCodeSuccess,
    TResult Function(_ResendCodeError value)? resendCodeError,
    required TResult orElse(),
  }) {
    if (resendCodeError != null) {
      return resendCodeError(this);
    }
    return orElse();
  }
}

abstract class _ResendCodeError implements VerificationState {
  const factory _ResendCodeError(final ErrorModel error) =
      _$ResendCodeErrorImpl;

  ErrorModel get error;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendCodeErrorImplCopyWith<_$ResendCodeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

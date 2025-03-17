// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressState
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
    extends _$AddressStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddressState.initial()';
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
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
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
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddressState {
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
    extends _$AddressStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AddressState.loading()';
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
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
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
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AddressState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AddressLoadedImplCopyWith<$Res> {
  factory _$$AddressLoadedImplCopyWith(
          _$AddressLoadedImpl value, $Res Function(_$AddressLoadedImpl) then) =
      __$$AddressLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressResponse response});
}

/// @nodoc
class __$$AddressLoadedImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressLoadedImpl>
    implements _$$AddressLoadedImplCopyWith<$Res> {
  __$$AddressLoadedImplCopyWithImpl(
      _$AddressLoadedImpl _value, $Res Function(_$AddressLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$AddressLoadedImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AddressResponse,
    ));
  }
}

/// @nodoc

class _$AddressLoadedImpl implements _AddressLoaded {
  const _$AddressLoadedImpl(this.response);

  @override
  final AddressResponse response;

  @override
  String toString() {
    return 'AddressState.addressLoaded(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressLoadedImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressLoadedImplCopyWith<_$AddressLoadedImpl> get copyWith =>
      __$$AddressLoadedImplCopyWithImpl<_$AddressLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) {
    return addressLoaded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) {
    return addressLoaded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (addressLoaded != null) {
      return addressLoaded(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) {
    return addressLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) {
    return addressLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (addressLoaded != null) {
      return addressLoaded(this);
    }
    return orElse();
  }
}

abstract class _AddressLoaded implements AddressState {
  const factory _AddressLoaded(final AddressResponse response) =
      _$AddressLoadedImpl;

  AddressResponse get response;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressLoadedImplCopyWith<_$AddressLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressStoredImplCopyWith<$Res> {
  factory _$$AddressStoredImplCopyWith(
          _$AddressStoredImpl value, $Res Function(_$AddressStoredImpl) then) =
      __$$AddressStoredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PublicResponse response});
}

/// @nodoc
class __$$AddressStoredImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStoredImpl>
    implements _$$AddressStoredImplCopyWith<$Res> {
  __$$AddressStoredImplCopyWithImpl(
      _$AddressStoredImpl _value, $Res Function(_$AddressStoredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$AddressStoredImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as PublicResponse,
    ));
  }
}

/// @nodoc

class _$AddressStoredImpl implements _AddressStored {
  const _$AddressStoredImpl(this.response);

  @override
  final PublicResponse response;

  @override
  String toString() {
    return 'AddressState.addressStored(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStoredImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStoredImplCopyWith<_$AddressStoredImpl> get copyWith =>
      __$$AddressStoredImplCopyWithImpl<_$AddressStoredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) {
    return addressStored(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) {
    return addressStored?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (addressStored != null) {
      return addressStored(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) {
    return addressStored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) {
    return addressStored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (addressStored != null) {
      return addressStored(this);
    }
    return orElse();
  }
}

abstract class _AddressStored implements AddressState {
  const factory _AddressStored(final PublicResponse response) =
      _$AddressStoredImpl;

  PublicResponse get response;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressStoredImplCopyWith<_$AddressStoredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressDeletedImplCopyWith<$Res> {
  factory _$$AddressDeletedImplCopyWith(_$AddressDeletedImpl value,
          $Res Function(_$AddressDeletedImpl) then) =
      __$$AddressDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PublicResponse response});
}

/// @nodoc
class __$$AddressDeletedImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressDeletedImpl>
    implements _$$AddressDeletedImplCopyWith<$Res> {
  __$$AddressDeletedImplCopyWithImpl(
      _$AddressDeletedImpl _value, $Res Function(_$AddressDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$AddressDeletedImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as PublicResponse,
    ));
  }
}

/// @nodoc

class _$AddressDeletedImpl implements _AddressDeleted {
  const _$AddressDeletedImpl(this.response);

  @override
  final PublicResponse response;

  @override
  String toString() {
    return 'AddressState.addressDeleted(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDeletedImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDeletedImplCopyWith<_$AddressDeletedImpl> get copyWith =>
      __$$AddressDeletedImplCopyWithImpl<_$AddressDeletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) {
    return addressDeleted(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) {
    return addressDeleted?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (addressDeleted != null) {
      return addressDeleted(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) {
    return addressDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) {
    return addressDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (addressDeleted != null) {
      return addressDeleted(this);
    }
    return orElse();
  }
}

abstract class _AddressDeleted implements AddressState {
  const factory _AddressDeleted(final PublicResponse response) =
      _$AddressDeletedImpl;

  PublicResponse get response;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressDeletedImplCopyWith<_$AddressDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorModel error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final ErrorModel error;

  @override
  String toString() {
    return 'AddressState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AddressResponse response) addressLoaded,
    required TResult Function(PublicResponse response) addressStored,
    required TResult Function(PublicResponse response) addressDeleted,
    required TResult Function(ErrorModel error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AddressResponse response)? addressLoaded,
    TResult? Function(PublicResponse response)? addressStored,
    TResult? Function(PublicResponse response)? addressDeleted,
    TResult? Function(ErrorModel error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AddressResponse response)? addressLoaded,
    TResult Function(PublicResponse response)? addressStored,
    TResult Function(PublicResponse response)? addressDeleted,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_AddressStored value) addressStored,
    required TResult Function(_AddressDeleted value) addressDeleted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_AddressStored value)? addressStored,
    TResult? Function(_AddressDeleted value)? addressDeleted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_AddressStored value)? addressStored,
    TResult Function(_AddressDeleted value)? addressDeleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AddressState {
  const factory _Error(final ErrorModel error) = _$ErrorImpl;

  ErrorModel get error;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

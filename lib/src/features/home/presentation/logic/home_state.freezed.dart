// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
// Banner state
  BannerState get bannerState =>
      throw _privateConstructorUsedError; // BestSeller state
  BestSellerState get bestSellerState =>
      throw _privateConstructorUsedError; // DailyOrder state
  DailyOrderState get dailyOrderState => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {BannerState bannerState,
      BestSellerState bestSellerState,
      DailyOrderState dailyOrderState});

  $BannerStateCopyWith<$Res> get bannerState;
  $BestSellerStateCopyWith<$Res> get bestSellerState;
  $DailyOrderStateCopyWith<$Res> get dailyOrderState;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerState = null,
    Object? bestSellerState = null,
    Object? dailyOrderState = null,
  }) {
    return _then(_value.copyWith(
      bannerState: null == bannerState
          ? _value.bannerState
          : bannerState // ignore: cast_nullable_to_non_nullable
              as BannerState,
      bestSellerState: null == bestSellerState
          ? _value.bestSellerState
          : bestSellerState // ignore: cast_nullable_to_non_nullable
              as BestSellerState,
      dailyOrderState: null == dailyOrderState
          ? _value.dailyOrderState
          : dailyOrderState // ignore: cast_nullable_to_non_nullable
              as DailyOrderState,
    ) as $Val);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BannerStateCopyWith<$Res> get bannerState {
    return $BannerStateCopyWith<$Res>(_value.bannerState, (value) {
      return _then(_value.copyWith(bannerState: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BestSellerStateCopyWith<$Res> get bestSellerState {
    return $BestSellerStateCopyWith<$Res>(_value.bestSellerState, (value) {
      return _then(_value.copyWith(bestSellerState: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyOrderStateCopyWith<$Res> get dailyOrderState {
    return $DailyOrderStateCopyWith<$Res>(_value.dailyOrderState, (value) {
      return _then(_value.copyWith(dailyOrderState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BannerState bannerState,
      BestSellerState bestSellerState,
      DailyOrderState dailyOrderState});

  @override
  $BannerStateCopyWith<$Res> get bannerState;
  @override
  $BestSellerStateCopyWith<$Res> get bestSellerState;
  @override
  $DailyOrderStateCopyWith<$Res> get dailyOrderState;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerState = null,
    Object? bestSellerState = null,
    Object? dailyOrderState = null,
  }) {
    return _then(_$HomeStateImpl(
      bannerState: null == bannerState
          ? _value.bannerState
          : bannerState // ignore: cast_nullable_to_non_nullable
              as BannerState,
      bestSellerState: null == bestSellerState
          ? _value.bestSellerState
          : bestSellerState // ignore: cast_nullable_to_non_nullable
              as BestSellerState,
      dailyOrderState: null == dailyOrderState
          ? _value.dailyOrderState
          : dailyOrderState // ignore: cast_nullable_to_non_nullable
              as DailyOrderState,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.bannerState = const BannerState(),
      this.bestSellerState = const BestSellerState(),
      this.dailyOrderState = const DailyOrderState()});

// Banner state
  @override
  @JsonKey()
  final BannerState bannerState;
// BestSeller state
  @override
  @JsonKey()
  final BestSellerState bestSellerState;
// DailyOrder state
  @override
  @JsonKey()
  final DailyOrderState dailyOrderState;

  @override
  String toString() {
    return 'HomeState(bannerState: $bannerState, bestSellerState: $bestSellerState, dailyOrderState: $dailyOrderState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.bannerState, bannerState) ||
                other.bannerState == bannerState) &&
            (identical(other.bestSellerState, bestSellerState) ||
                other.bestSellerState == bestSellerState) &&
            (identical(other.dailyOrderState, dailyOrderState) ||
                other.dailyOrderState == dailyOrderState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bannerState, bestSellerState, dailyOrderState);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final BannerState bannerState,
      final BestSellerState bestSellerState,
      final DailyOrderState dailyOrderState}) = _$HomeStateImpl;

// Banner state
  @override
  BannerState get bannerState; // BestSeller state
  @override
  BestSellerState get bestSellerState; // DailyOrder state
  @override
  DailyOrderState get dailyOrderState;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerState {
  bool get isLoading => throw _privateConstructorUsedError;
  BannerResponse? get data => throw _privateConstructorUsedError;
  ErrorModel? get error => throw _privateConstructorUsedError;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
  @useResult
  $Res call({bool isLoading, BannerResponse? data, ErrorModel? error});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BannerResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerStateImplCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$BannerStateImplCopyWith(
          _$BannerStateImpl value, $Res Function(_$BannerStateImpl) then) =
      __$$BannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, BannerResponse? data, ErrorModel? error});
}

/// @nodoc
class __$$BannerStateImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateImpl>
    implements _$$BannerStateImplCopyWith<$Res> {
  __$$BannerStateImplCopyWithImpl(
      _$BannerStateImpl _value, $Res Function(_$BannerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$BannerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BannerResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
    ));
  }
}

/// @nodoc

class _$BannerStateImpl implements _BannerState {
  const _$BannerStateImpl({this.isLoading = false, this.data, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BannerResponse? data;
  @override
  final ErrorModel? error;

  @override
  String toString() {
    return 'BannerState(isLoading: $isLoading, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, data, error);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      __$$BannerStateImplCopyWithImpl<_$BannerStateImpl>(this, _$identity);
}

abstract class _BannerState implements BannerState {
  const factory _BannerState(
      {final bool isLoading,
      final BannerResponse? data,
      final ErrorModel? error}) = _$BannerStateImpl;

  @override
  bool get isLoading;
  @override
  BannerResponse? get data;
  @override
  ErrorModel? get error;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BestSellerState {
  bool get isLoading => throw _privateConstructorUsedError;
  BestSellerResponse? get data => throw _privateConstructorUsedError;
  ErrorModel? get error => throw _privateConstructorUsedError;

  /// Create a copy of BestSellerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BestSellerStateCopyWith<BestSellerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestSellerStateCopyWith<$Res> {
  factory $BestSellerStateCopyWith(
          BestSellerState value, $Res Function(BestSellerState) then) =
      _$BestSellerStateCopyWithImpl<$Res, BestSellerState>;
  @useResult
  $Res call({bool isLoading, BestSellerResponse? data, ErrorModel? error});
}

/// @nodoc
class _$BestSellerStateCopyWithImpl<$Res, $Val extends BestSellerState>
    implements $BestSellerStateCopyWith<$Res> {
  _$BestSellerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BestSellerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BestSellerResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BestSellerStateImplCopyWith<$Res>
    implements $BestSellerStateCopyWith<$Res> {
  factory _$$BestSellerStateImplCopyWith(_$BestSellerStateImpl value,
          $Res Function(_$BestSellerStateImpl) then) =
      __$$BestSellerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, BestSellerResponse? data, ErrorModel? error});
}

/// @nodoc
class __$$BestSellerStateImplCopyWithImpl<$Res>
    extends _$BestSellerStateCopyWithImpl<$Res, _$BestSellerStateImpl>
    implements _$$BestSellerStateImplCopyWith<$Res> {
  __$$BestSellerStateImplCopyWithImpl(
      _$BestSellerStateImpl _value, $Res Function(_$BestSellerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BestSellerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$BestSellerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BestSellerResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
    ));
  }
}

/// @nodoc

class _$BestSellerStateImpl implements _BestSellerState {
  const _$BestSellerStateImpl({this.isLoading = false, this.data, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BestSellerResponse? data;
  @override
  final ErrorModel? error;

  @override
  String toString() {
    return 'BestSellerState(isLoading: $isLoading, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BestSellerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, data, error);

  /// Create a copy of BestSellerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BestSellerStateImplCopyWith<_$BestSellerStateImpl> get copyWith =>
      __$$BestSellerStateImplCopyWithImpl<_$BestSellerStateImpl>(
          this, _$identity);
}

abstract class _BestSellerState implements BestSellerState {
  const factory _BestSellerState(
      {final bool isLoading,
      final BestSellerResponse? data,
      final ErrorModel? error}) = _$BestSellerStateImpl;

  @override
  bool get isLoading;
  @override
  BestSellerResponse? get data;
  @override
  ErrorModel? get error;

  /// Create a copy of BestSellerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BestSellerStateImplCopyWith<_$BestSellerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyOrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  DailyOrderResponse? get data => throw _privateConstructorUsedError;
  ErrorModel? get error => throw _privateConstructorUsedError;

  /// Create a copy of DailyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyOrderStateCopyWith<DailyOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyOrderStateCopyWith<$Res> {
  factory $DailyOrderStateCopyWith(
          DailyOrderState value, $Res Function(DailyOrderState) then) =
      _$DailyOrderStateCopyWithImpl<$Res, DailyOrderState>;
  @useResult
  $Res call({bool isLoading, DailyOrderResponse? data, ErrorModel? error});
}

/// @nodoc
class _$DailyOrderStateCopyWithImpl<$Res, $Val extends DailyOrderState>
    implements $DailyOrderStateCopyWith<$Res> {
  _$DailyOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DailyOrderResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyOrderStateImplCopyWith<$Res>
    implements $DailyOrderStateCopyWith<$Res> {
  factory _$$DailyOrderStateImplCopyWith(_$DailyOrderStateImpl value,
          $Res Function(_$DailyOrderStateImpl) then) =
      __$$DailyOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, DailyOrderResponse? data, ErrorModel? error});
}

/// @nodoc
class __$$DailyOrderStateImplCopyWithImpl<$Res>
    extends _$DailyOrderStateCopyWithImpl<$Res, _$DailyOrderStateImpl>
    implements _$$DailyOrderStateImplCopyWith<$Res> {
  __$$DailyOrderStateImplCopyWithImpl(
      _$DailyOrderStateImpl _value, $Res Function(_$DailyOrderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$DailyOrderStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DailyOrderResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
    ));
  }
}

/// @nodoc

class _$DailyOrderStateImpl implements _DailyOrderState {
  const _$DailyOrderStateImpl({this.isLoading = false, this.data, this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DailyOrderResponse? data;
  @override
  final ErrorModel? error;

  @override
  String toString() {
    return 'DailyOrderState(isLoading: $isLoading, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyOrderStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, data, error);

  /// Create a copy of DailyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyOrderStateImplCopyWith<_$DailyOrderStateImpl> get copyWith =>
      __$$DailyOrderStateImplCopyWithImpl<_$DailyOrderStateImpl>(
          this, _$identity);
}

abstract class _DailyOrderState implements DailyOrderState {
  const factory _DailyOrderState(
      {final bool isLoading,
      final DailyOrderResponse? data,
      final ErrorModel? error}) = _$DailyOrderStateImpl;

  @override
  bool get isLoading;
  @override
  DailyOrderResponse? get data;
  @override
  ErrorModel? get error;

  /// Create a copy of DailyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyOrderStateImplCopyWith<_$DailyOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

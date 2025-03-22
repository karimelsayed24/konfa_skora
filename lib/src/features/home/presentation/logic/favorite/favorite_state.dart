import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.loaded(bool message) = _Loaded;
  const factory FavoriteState.error(String message) = _Error;
}
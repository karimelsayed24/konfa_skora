
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/user_profile_model.dart';

part 'profile_state.freezed.dart';


@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded({required UserProfileModel profile}) = ProfileLoaded;
  const factory ProfileState.error({required String message}) = ProfileError;
  const factory ProfileState.imageSelected({required String imagePath}) = ProfileImageSelected;
  const factory ProfileState.updateLoading() = ProfileUpdateLoading;
  const factory ProfileState.updateSuccess({required String message}) = ProfileUpdateSuccess;
  const factory ProfileState.updateError({required String message}) = ProfileUpdateError;

  const factory ProfileState.deleteLoading() = ProfileDeleteLoading;
  const factory ProfileState.deleteSuccess({required String message}) = ProfileDeleteSuccess;
  const factory ProfileState.deleteError({required String message}) = ProfileDeleteError;

  const factory ProfileState.logOutLoading() = ProfileLogOutLoading;
  const factory ProfileState.logOutSuccess({required String message}) = ProfileLogOutSuccess;
  const factory ProfileState.logOutError({required String message}) = ProfileLogOutError;

}
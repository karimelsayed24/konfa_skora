import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/user_profile_model.dart';
import '../../domain/usecase/delete_account_usecase.dart';
import '../../domain/usecase/get_profile_usecase.dart';
import '../../domain/usecase/logout_usecsae.dart';
import '../../domain/usecase/update_profile_usecase.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final LogoutUseCase logoutUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  final ImagePicker _imagePicker = ImagePicker();

  UserProfileModel? userProfile;
  String? selectedImagePath;

  ProfileCubit(
    this.getProfileUseCase,
    this.updateProfileUseCase,
    this.logoutUseCase,
    this.deleteAccountUseCase,
  ) : super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    final result = await getProfileUseCase();

    result.fold(
      (error) => emit(ProfileState.error(message: error.message)),
      (response) {
        userProfile = response.data;
        emit(ProfileState.loaded(profile: response.data));
      },
    );
  }

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String birthDate,
  }) async {
    emit(const ProfileState.updateLoading());

    final params = UpdateProfileParams(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      birthDate: birthDate,
      image: selectedImagePath,
    );

    final result = await updateProfileUseCase(params);

    result.fold(
      (error) => emit(ProfileState.updateError(message: error.message)),
      (response) {
        userProfile = response.data;
        emit(ProfileState.updateSuccess(message: response.msg));
      },
    );
  }

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      emit(ProfileState.imageSelected(imagePath: pickedFile.path));
    }
  }

  Future<void> logout() async {
    emit(const ProfileState.logOutLoading());
    final result = await logoutUseCase();

    result.fold(
      (error) => emit(ProfileState.logOutError(message: error.message)),
      (response) => emit(ProfileState.logOutSuccess(message: response.msg)),
    );
  }

  Future<void> deleteAccount() async {
    emit(const ProfileState.deleteLoading());
    final result = await deleteAccountUseCase();

    result.fold(
      (error) => emit(ProfileState.deleteError(message: error.message)),
      (response) => emit(ProfileState.deleteSuccess(message: response.msg)),
    );
  }
}

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:konaf_skora/core/app_cubit/app_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,AppStrings.profile),
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              updateSuccess: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
                Navigator.pop(context);
              },
              updateError: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              loaded: (profile) {
                _nameController.text =
                    '${profile.firstName} ${profile.lastName}';
                _emailController.text = profile.email;
                _phoneController.text = profile.phone;
                _locationController.text =
                    profile.mapDesc ?? 'التجمع الخامس - القاهرة';
                _birthDateController.text = _formatDate(profile.birthDate);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              updateLoading: () => true,
              orElse: () => false,
            );

            final profile = state.maybeWhen(
              loaded: (profile) => profile,
              orElse: () => context.read<ProfileCubit>().userProfile,
            );

            if (isLoading && profile == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            state.maybeWhen(
                              imageSelected: (imagePath) => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  image: DecorationImage(
                                    image: FileImage(File(imagePath)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              orElse: () => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  image: profile != null
                                      ? DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              profile.image??''),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: profile == null
                                    ? const Center(
                                        child: Icon(Icons.person,
                                            size: 50, color: Colors.grey))
                                    : null,
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  context.read<ProfileCubit>().pickImage(),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.camera_alt,
                                    color: Colors.grey, size: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'اضافة صورة وتفاصيل جديدة',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Form Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الاسم', style: AppStyles.s16),
                        const SizedBox(height: 5),
                        _buildTextField(
                          controller: _nameController,
                          hintText: 'روحي محمد',
                          prefixIcon: Icons.person_outline,
                        ),
                        const SizedBox(height: 15),
                        Text('البريد الالكتروني', style: AppStyles.s16),
                        const SizedBox(height: 5),
                        _buildTextField(
                          controller: _emailController,
                          hintText: 'mogamal2234889@gmail.com',
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 15),
                        Text('الهاتف', style: AppStyles.s16),
                        const SizedBox(height: 5),
                        _buildTextField(
                          controller: _phoneController,
                          hintText: '01012123423',
                          prefixIcon: Icons.phone_outlined,
                        ),
                        const SizedBox(height: 15),
                        Text('الموقع', style: AppStyles.s16),
                        const SizedBox(height: 5),
                        _buildTextField(
                          controller: _locationController,
                          hintText: 'التجمع الخامس - القاهرة',
                          prefixIcon: Icons.location_on_outlined,
                        ),
                        const SizedBox(height: 15),
                        Text('تاريخ الميلاد', style: AppStyles.s16),
                        const SizedBox(height: 5),
                        _buildTextField(
                          controller: _birthDateController,
                          hintText: 'xx/xx/xxxx',
                          prefixIcon: Icons.calendar_today_outlined,
                          readOnly: true,
                          onTap: () => _selectDate(context),
                        ),
                      ],
                    ),
                  ),

                  // Save Button
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: state.maybeWhen(
                        updateLoading: () => const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        orElse: () => const Text(
                          'حفظ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

 
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(1.r),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, size: 25.r, color: AppColors.iconColor),
          contentPadding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red.shade300,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _birthDateController.text = _formatDate(picked.toString());
      });
    }
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  void _updateProfile() {
    final nameParts = _nameController.text.split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts[0] : '';
    final lastName = nameParts.length > 1 ? nameParts.skip(1).join(' ') : '';

    context.read<ProfileCubit>().updateProfile(
          firstName: firstName,
          lastName: lastName,
          email: _emailController.text,
          phone: _phoneController.text,
          birthDate: _convertDateFormat(_birthDateController.text),
          location: _locationController.text,
        );
  }

  String _convertDateFormat(String date) {
    final parts = date.split('/');
    if (parts.length == 3) {
      // Convert from dd/MM/yyyy to yyyy-MM-dd
      return '${parts[2]}-${parts[1]}-${parts[0]}';
    }
    return date;
  }
}

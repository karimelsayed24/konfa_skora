import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:konaf_skora/core/common/widgets/custom_text_form_field.dart';
import 'package:konaf_skora/core/utils/custom_app_bar.dart';
import 'package:konaf_skora/src/features/location/presentation/logic/address_cubit.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/services/location_services.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../auth/presentation/widgets/create_account_title.dart';
import '../../../location/presentation/logic/address_state.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _describeLocationController =
      TextEditingController();
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(30.0444, 31.2357);
  final Set<Marker> _markers = {};
  bool _isLoading = true;
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    try {
      final locationData =
          await _locationService.requestLocationPermission(context);

      if (locationData != null) {
        setState(() {
          _currentPosition =
              LatLng(locationData.latitude!, locationData.longitude!);
          _addMarker(_currentPosition);
        });

        if (_mapController != null) {
          _mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: _currentPosition,
                zoom: 15,
              ),
            ),
          );
        }
      }
    } catch (e) {
      print("Error initializing location: $e");
      _addMarker(_currentPosition);

      if (mounted) {
        showToast(
            message: 'تعذر الحصول على الموقع: $e', state: ToastStates.ERROR);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _addMarker(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
          draggable: true,
          onDragEnd: (newPosition) {
            setState(() {
              _currentPosition = newPosition;
            });
          },
        ),
      );
    });
  }

  Future<void> _searchLocation() async {
    if (_searchController.text.isEmpty) return;

    try {
      List<geo.Location> locations =
          await geo.locationFromAddress(_searchController.text);
      if (locations.isNotEmpty) {
        final location = locations.first;
        final newPosition = LatLng(location.latitude, location.longitude);

        setState(() {
          _currentPosition = newPosition;
          _addMarker(newPosition);
        });

        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: newPosition,
              zoom: 15,
            ),
          ),
        );
      }
    } catch (e) {
      showToast(
          message: 'لم يتم العثور على الموقع: $e', state: ToastStates.ERROR);
    }
  }

  void _confirmLocation() async {
    try {
      List<geo.Placemark> placeMarks = await geo.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      String address = 'لم يتم العثور على عنوان';
      if (placeMarks.isNotEmpty) {
        geo.Placemark place = placeMarks.first;
        address =
            '${place.street ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}';
        address = address
            .replaceAll(RegExp(r', ,'), ',')
            .replaceAll(RegExp(r'^, |, $'), '');
      }

      context.read<AddressCubit>().storeAddress(
            title: _describeLocationController.text,
            mapDesc: address,
            lat: _currentPosition.latitude,
            lng: _currentPosition.longitude,
          );
    } catch (e) {
      showToast(message: 'حدث خطأ: $e', state: ToastStates.ERROR);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.addNewAddress),
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              showToast(message: error.message, state: ToastStates.ERROR);
            },
            addressStored: (response) {
              showToast(message: response.msg, state: ToastStates.SUCCESS);
              context.pushReplacement(RouterNames.bottomNavigationBarRoot);
            },
          );
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: const CreateAccountTitle(
                          title: AppStrings.addNewAddress,
                          subTitle: AppStrings.yourLocation,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: AppStrings.searchForYourLocation,
                            prefixIcon: const Icon(
                              Icons.location_on,
                              color: AppColors.primaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: AppColors.borderGrey,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: AppColors.primaryColor,
                                width: 1.5,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: AppColors.borderGrey,
                                width: 1.5,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: _searchLocation,
                            ),
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          onSubmitted: (_) => _searchLocation(),
                        ),
                      ),
                      Expanded(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: _currentPosition,
                                  zoom: 15,
                                ),
                                markers: _markers,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                mapType: MapType.normal,
                                zoomControlsEnabled: true,
                                onMapCreated: (controller) {
                                  _mapController = controller;
                                },
                                onTap: (position) {
                                  setState(() {
                                    _currentPosition = position;
                                    _addMarker(position);
                                  });
                                },
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: CustomTextFormField(
                          hintText: AppStrings.describeLocationHint,
                          controller: _describeLocationController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.r, vertical: 8.0.r),
                        child: CustomButton(
                          text: AppStrings.confirmAddress,
                          onPressed: _confirmLocation,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _describeLocationController.dispose();
    _mapController?.dispose();
    super.dispose();
  }
}

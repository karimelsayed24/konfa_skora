import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/set_location_use_case.dart';
import 'set_location_state.dart';

class SetLocationCubit extends Cubit<SetLocationState> {
  final SetLocationUseCase setLocationUC;
  
  SetLocationCubit(this.setLocationUC) : super(const SetLocationState.initial());
  
  Future<void> setLocation({required String mapDesc,required double lat,required double lng}) async {
    emit(const SetLocationState.loading());
    
    final result = await setLocationUC.setLocation(mapDesc, lat, lng);
    
    result.fold(
      (error) => emit(SetLocationState.error(error)),
      (response) => emit(SetLocationState.loaded(response))
    );
  }
}
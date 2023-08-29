import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/regionModel.dart';
import '../../../../data/repositories/regionRepository.dart';
import '../../../../domain/usecases/regionUseCase.dart';
import '../../state/dataState.dart';

class RegionalESimCubit extends Cubit<DataState>{

  RegionalESimCubit() :super(Loading());

  var regionList = <RegionModel>[];
  late RegionUseCase regionUseCase;
  RegionRepository regionRepository = RegionRepository();

  ///Decoding and Loading Region List from JSON.
  void getRegionList() async {
    await Future.delayed(const Duration(seconds: 2), (){});
    try {
      regionUseCase = RegionUseCase(regionRepository);
      regionList = await regionUseCase.getData();
      emit(Loaded());
    } catch(error) {
      emit(Error());
    }
  }


}
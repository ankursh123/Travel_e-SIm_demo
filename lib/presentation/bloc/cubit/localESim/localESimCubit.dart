import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/countryModel.dart';
import '../../../../data/models/eSimModel.dart';
import '../../../../data/repositories/countryRepository.dart';
import '../../../../domain/usecases/countryUsecase.dart';
import '../../state/dataState.dart';

class LocalESimCubit extends Cubit<DataState> {
  LocalESimCubit() : super(Loading());

  var countryList = <CountryModel>[];
  CountryRepository countryRepo = CountryRepository();
  late CountryUseCase countryUseCase;
  ESimModel eSimData = ESimModel();

  ///Decoding and Loading Couontry List from JSON.
  void getCountryList() async {
    countryUseCase = CountryUseCase(countryRepo);
    try {
      countryList = await countryUseCase.getData();
      emit(Loaded());
    } catch (error) {
      emit(Error());
    }
  }
  
}
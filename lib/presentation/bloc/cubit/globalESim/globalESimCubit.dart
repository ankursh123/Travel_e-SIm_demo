import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/eSimModel.dart';
import '../../../../data/repositories/esimRepository.dart';
import '../../../../domain/usecases/eSimUseCase.dart';
import '../../state/globalESimState.dart';

class GlobalESimCubit extends Cubit<GlobalESimState>{
  GlobalESimCubit(): super(ESimLoading());

  late ESimUseCase eSimUseCase;
  List<ESimModel> simDATA = [];
  bool showCallsAndText = false;
  ESimRepository globalESim = ESimRepository();

  ///Toggle To show or hide Calls and Text in Global E-Sim CARD.
  void toggle(){
    if(showCallsAndText){
      emit(ESimShowCalls());
    } else {
      emit(ESimShowData());
    }
  }

  ///Decoding and Loading Global-ESim Data from JSON.
  void getESimData() async {
    try {
      await Future.delayed(const Duration(seconds: 4),(){});
      eSimUseCase = ESimUseCase(globalESim);
      simDATA = await eSimUseCase.getData();
      emit(ESimShowData());
    } catch(error){
      emit(ESimError());
    }

  }

}
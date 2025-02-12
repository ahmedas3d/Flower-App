import 'package:bloc/bloc.dart';

class myblocobsever extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  void onClose(BlocBase bloc) {
    print('${bloc.runtimeType} closed');
    super.onClose(bloc);
  }
}

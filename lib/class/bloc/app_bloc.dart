import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/class/repository/repository.dart';
import 'app_event.dart';
import 'app_state.dart';

class ShopifyBloc extends Bloc<ShopifyEvent, ShopifyState> {
  ShopifyBloc(this._shopifyRepo) : super(InitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      final authData = await _shopifyRepo.login(event.email, event.password);
      if (authData.contains("Accepted")) {
        final data = await _shopifyRepo.fetchProduct();
        emit(AuthenticatedState(data: data));
      } else {
        emit(ErrorsState(error: authData));
      }
    });
    on<FetchDataEvent>(_onFetchData);
  }
  void _onFetchData(FetchDataEvent event, Emitter<ShopifyState> emit) async {
    print("Fetch event");
    emit(LoadingState());
    final data = await _shopifyRepo.fetchProduct();
    if (data.isNotEmpty) {
      emit(LoadedState(data: data));
    } else {
      emit(const ErrorsState(error: "error"));
    }
  }

  final ShopifyRepository _shopifyRepo;
}

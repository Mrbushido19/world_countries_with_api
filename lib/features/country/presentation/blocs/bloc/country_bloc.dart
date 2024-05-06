import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_countries_with_resp_api/features/country/domain/entities/country.dart';
import 'package:world_countries_with_resp_api/features/country/domain/use_cases/get_countries.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries _countries;
  CountryBloc({required GetCountries countries})
      : _countries = countries,
        super(CountryInitial()) {
    on<CountryGetAll>((event, emit) async {
      emit(CountryLoading());
      final res = await _countries.call();
      if (res != null) {
        res.fold((l) => emit(CountryFailure(l.message)),
            (r) => emit(CountrySuccess(r)));
      }
    });
  }
}

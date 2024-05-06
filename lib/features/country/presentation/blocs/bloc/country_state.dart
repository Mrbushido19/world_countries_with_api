part of 'country_bloc.dart';

@immutable
sealed class CountryState {}

final class CountryInitial extends CountryState {}

final class CountryLoading extends CountryState {}

final class CountryFailure extends CountryState {
  final String errorMessage;

  CountryFailure(this.errorMessage);
}

final class CountrySuccess extends CountryState {
  final List<Country> countries;

  CountrySuccess(this.countries);
}

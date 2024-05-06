part of 'country_bloc.dart';

@immutable
sealed class CountryEvent {}

final class CountryGetAll extends CountryEvent {}

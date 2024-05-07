import 'package:dartz/dartz.dart';
import 'package:world_countries_with_resp_api/core/error/api_exception.dart';
import 'package:world_countries_with_resp_api/core/error/failure.dart';
import 'package:world_countries_with_resp_api/features/country/data/data_sources/remote_country_data_source.dart';
import 'package:world_countries_with_resp_api/features/country/data/models/country_model.dart';
import 'package:world_countries_with_resp_api/features/country/domain/entities/country.dart';
import 'package:world_countries_with_resp_api/features/country/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final RemoteCountryDataSource _countryDataSource;

  CountryRepositoryImpl(this._countryDataSource);

  @override
  Future<Either<Failure, List<Country>>?> getCountries() async {
    try {
      final response = await _countryDataSource.getCountries();
      if (response != null) {
        final countryList = response
            .map((e) => CountryModel(
                  name: e.name,
                  capital: e.capital,
                  population: e.population,
                  timezones: e.timezones,
                  continents: e.continents,
                  flags: e.flags,
                ).toEntity())
            .toList();
        return right(countryList);
      }
    } on ApiException catch (e) {
      return left(Failure(e.error));
    }
    return null;
  }
}

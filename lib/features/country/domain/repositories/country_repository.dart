import 'package:dartz/dartz.dart';
import 'package:world_countries_with_resp_api/core/error/failure.dart';
import 'package:world_countries_with_resp_api/features/country/domain/entities/country.dart';

abstract interface class CountryRepository {
  Future<Either<Failure, List<Country>>?> getCountries();
}

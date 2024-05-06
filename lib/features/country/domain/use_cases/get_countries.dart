import 'package:dartz/dartz.dart';
import 'package:world_countries_with_resp_api/core/error/failure.dart';
import 'package:world_countries_with_resp_api/features/country/domain/entities/country.dart';
import 'package:world_countries_with_resp_api/features/country/domain/repositories/country_repository.dart';

class GetCountries {
  final CountryRepository _repository;

  GetCountries(this._repository);
  Future<Either<Failure, List<Country>>?> call() {
    return _repository.getCountries();
  }
}

import 'package:world_countries_with_resp_api/core/error/api_exception.dart';
import 'package:world_countries_with_resp_api/features/country/data/models/country_model.dart';
import "package:http/http.dart" as http;

abstract interface class RemoteCountryDataSource {
  Future<List<CountryModel>?> getCountries();
}

class RemoteCountryDataSourceImpl implements RemoteCountryDataSource {
  final http.Client httpClient;

  RemoteCountryDataSourceImpl(this.httpClient);
  @override
  Future<List<CountryModel>?> getCountries() async {
    try {
      final uri = Uri.parse("https://restcountries.com/v3.1/all");
      final response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        List<CountryModel> model = countryModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      throw ApiException(e.toString());
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_countries_with_resp_api/core/theme/app_theme.dart';
import 'package:world_countries_with_resp_api/features/country/data/data_sources/remote_country_data_source.dart';
import 'package:world_countries_with_resp_api/features/country/data/repositories_impl/country_repository_impl.dart';
import 'package:world_countries_with_resp_api/features/country/domain/use_cases/get_countries.dart';
import 'package:world_countries_with_resp_api/features/country/presentation/blocs/bloc/country_bloc.dart';
import 'package:world_countries_with_resp_api/features/country/presentation/pages/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) {
      return CountryBloc(
          countries: GetCountries(CountryRepositoryImpl(
              RemoteCountryDataSourceImpl(http.Client()))));
    })
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomePage(),
    );
  }
}

import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_countries_with_resp_api/features/country/presentation/pages/details_pages.dart';
import '../../domain/entities/country.dart';
import '../blocs/bloc/country_bloc.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<CountryBloc>().add(CountryGetAll());
    super.initState();
  }

// Ajoutez cette fonction dans votre classe _HomePageState
  List<Country> _sortCountriesByName(List<Country>? countries) {
    if (countries != null) {
      countries.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));
      return countries;
    } else {
      return [];
    }
  }

  List<Country> _searchCountriesByName(List<Country>? countries, String query) {
    if (countries != null && query.isNotEmpty) {
      return countries
          .where((country) =>
              country.name!.common!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      return countries ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (context, state) {
        if (state is CountryLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is CountrySuccess) {
          List<Country>? filteredCountries =
              _searchCountriesByName(state.countries, searchController.text);
          final countries = filteredCountries;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Country App",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                SearchWidget(
                  onChanged: (query) {
                    setState(() {});
                  },
                  controller: searchController,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: AlphabetScrollView(
                        list: countries
                            .map((e) => AlphaModel(e.name?.common ?? ""))
                            .toList(),
                        selectedTextStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        unselectedTextStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        itemBuilder: (_, k, id) {
                          final sortedCountries =
                              _sortCountriesByName(countries);
                          final country = sortedCountries[k];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsPage(
                                    name: country.name,
                                    capital: country.capital,
                                    languages: country.languages,
                                    population: country.population,
                                    timeZones: country.timezones,
                                    continents: country.continents,
                                    flags: country.flags);
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Image.network(
                                  country.flags?.png ?? "",
                                  width: 64,
                                ),
                                title: Text(
                                    country.name?.common ?? "It's a Problem"),
                              ),
                            ),
                          );
                        }))
                // Expanded(
                //     child: ListView.separated(
                //         separatorBuilder: (context, index) {
                //           return Divider();
                //         },
                //         itemCount: countries.length,
                //         itemBuilder: (context, index) {
                //           final sortedCountries =
                //               _sortCountriesByName(countries);
                //           final country = sortedCountries[index];
                //           return GestureDetector(
                //             onTap: () {
                //               Navigator.push(context,
                //                   MaterialPageRoute(builder: (context) {
                //                 return DetailsPage(
                //                     name: country.name,
                //                     capital: country.capital,
                //                     languages: country.languages,
                //                     population: country.population,
                //                     timeZones: country.timezones,
                //                     continents: country.continents,
                //                     flags: country.flags);
                //               }));
                //             },
                //             child: ListTile(
                //               leading: Image.network(
                //                 country.flags?.png ?? "",
                //                 width: 64,
                //               ),
                //               title: Text(
                //                   country.name?.common ?? "It's a Problem"),
                //             ),
                //           );
                //         }))
              ]),
            ),
          );
        }
        return Container();
      },
    );
  }
}

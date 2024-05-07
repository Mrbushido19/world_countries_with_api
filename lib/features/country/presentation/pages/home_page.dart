import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_countries_with_resp_api/features/country/presentation/pages/details_pages.dart';
import '../blocs/bloc/country_bloc.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<CountryBloc>().add(CountryGetAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (context, state) {
        if (state is CountryLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is CountrySuccess) {
          final countries = state.countries;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Country App",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                SearchWidget(),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          final country = countries[index];
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
                            child: ListTile(
                              leading: Image.network(
                                country.flags?.png ?? "",
                                width: 64,
                              ),
                              title: Text(
                                  country.name?.common ?? "It's a Problem"),
                            ),
                          );
                        }))
              ]),
            ),
          );
        }
        return Container();
      },
    );
  }
}

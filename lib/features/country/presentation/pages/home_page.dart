import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_countries_with_resp_api/features/country/presentation/blocs/bloc/country_bloc.dart';

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
    return Scaffold(body: BlocBuilder<CountryBloc, CountryState>(
      builder: (context, state) {
        if (state is CountryLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CountrySuccess) {
          final countries = state.countries;
          return Center(
            child:
                Text("We have ${countries.length} countries uploaded from API"),
          );
        }
        return Container();
      },
    ));
  }
}

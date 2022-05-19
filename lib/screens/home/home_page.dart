import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common_widgets/show_exception_alert.dart';
import 'package:weather_app/screens/home/bloc/weather_bloc.dart';
import 'package:weather_app/screens/home/model/weather_model.dart';
import 'package:weather_app/screens/home/widgets/location/location_widget.dart';
import 'package:weather_app/screens/home/widgets/search_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.bloc}) : super(key: key);
  final WeatherBloc bloc;
  static Widget create(BuildContext context) {
    return Provider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<WeatherBloc>(
        builder: (ctx, bloc, child) => HomePage(bloc: bloc),
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> searchLocation(String locationName) async {
    try {
      await widget.bloc.searchLocation(locationName);
    } on Exception catch (error) {
      showExceptionAlert(context: context, error: error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent.shade100,
      ),
      backgroundColor: Colors.blueAccent.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchLocation(
              onPressed: searchLocation,
            ),
            StreamBuilder<WeatherModel>(
                stream: widget.bloc.modelStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final weatherModel = snapshot.data!;
                    return LocationWidget(model: weatherModel);
                  }
                  return const Center(
                    child: Text(
                      'No location searched',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

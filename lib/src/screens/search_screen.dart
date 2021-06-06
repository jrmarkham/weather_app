import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/blocs/ui/ui_bloc.dart';
import 'package:weather/src/globals.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final UIBloc _uiBloc = BlocProvider.of<UIBloc>(context);
    final Function _homeFunction = () =>  _uiBloc.updateUI(NavScreen.home);
    final Function _worldFunction = () => _uiBloc.updateUI(NavScreen.world);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Search', style: TextStyle(fontSize: 35.0)),
            Text('Place holder for searching weather via locations'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _homeFunction, child: Text('Home')),
                ElevatedButton(onPressed: _worldFunction, child: Text('World')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'ui/home/view_models/home_viewmodel.dart';
import 'ui/home/widgets/home_state.dart';
import 'routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => HomeController(),
        child: BlocBuilder<HomeController, HomeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: state.darkModeOn ? ThemeData.dark() : ThemeData.light(),
              routerConfig: router,
              title: 'Simple Shop List',
            );
          },
        ),
      ),
    );

import 'ui/home/view_models/home_viewmodel.dart';
import 'ui/home/widgets/home_state.dart';
import 'routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => HomeController(),
        child: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {
            switch (state.counter) {
              case == -1:
                Navigator.pushNamed(context, '/other-page');
                context.read<HomeController>().reset();
              case == 3:
                showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                      'counter is ${state.counter}',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                context.read<HomeController>().reset();
            }
          },
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: state.apptheme ? ThemeData.light() : ThemeData.dark(),
              routerConfig: router,
              title: 'Simple Shop List',
            );
          },
        ),
      ),
    );

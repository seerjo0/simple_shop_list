import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shop_list/ui/home/view_models/home_viewmodel.dart';
import 'package:simple_shop_list/ui/home/widgets/home_state.dart';
import 'package:simple_shop_list/routing/routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).go(Routes.home),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20),
              ),
              BlocBuilder<HomeController, HomeState>(
                builder: (context, state) {
                  return Switch(
                    value: context.read<HomeController>().state.darkModeOn,
                    onChanged: (value) {
                      value = !context.read<HomeController>().state.darkModeOn;
                      context.read<HomeController>().changeTheme();
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<HomeController, HomeState>(
            builder: (context, state) => TextButton(
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => AboutDialog(
                  applicationName: 'Simple Shop List',
                  applicationVersion: '1.0.0',
                  applicationIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.indigo,
                  ),
                  children: [
                    Center(
                      child: Text("Developed by: Sérgio Steiner"),
                    ),
                  ],
                ),
              ),
              child: Text(
                "About Simple Shop List",
                style: TextStyle(
                  fontSize: 20,
                  color:
                      state.darkModeOn ? Colors.white : Colors.indigo.shade900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

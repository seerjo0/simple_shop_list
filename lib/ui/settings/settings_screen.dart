import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shop_list/ui/home/view_models/home_viewmodel.dart';
import 'package:simple_shop_list/ui/home/widgets/home_state.dart';
import '../../routing/routes.dart';

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
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
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
          )
        ],
      ),
    );
  }
}

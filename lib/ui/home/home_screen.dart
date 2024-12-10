import 'package:simple_shop_list/domain/home_controller.dart';
import 'package:simple_shop_list/ui/home/view_models/home_viewmodel.dart';
import 'package:simple_shop_list/ui/add-product/add_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Shop List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        actions: [
          BlocBuilder<HomeController, HomeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.apptheme ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.white,
                ),
                onPressed: () => context.read<HomeController>().changeTheme(),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              showAboutDialog(
                applicationName: "Simple Shop List",
                context: context,
                children: [
                  const Text(
                    "Developed by Sérgio Steiner",
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 20; i++)
              CheckboxListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                value: context.read<HomeController>().state.active,
                onChanged: (value) =>
                    context.read<HomeController>().activeToogle(),
                title: Text(
                  'Produto $i',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text('Categoria ${i * 10}'),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.indigo,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.indigo,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add-product',
            onPressed: () => addProduct(context),
            backgroundColor: Colors.indigo.shade900,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

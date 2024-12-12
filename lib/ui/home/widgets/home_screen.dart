import 'package:go_router/go_router.dart';
import 'package:simple_shop_list/ui/add-product/add_product_view.dart';
import 'package:simple_shop_list/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shop_list/ui/home/widgets/home_state.dart';
import '../../../routing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Shop List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange.shade800,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => GoRouter.of(context).go(Routes.settings),
          ),
        ],
      ),
      body: BlocBuilder<HomeController, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 20; i++)
                  Dismissible(
                    onDismissed: (direction) {},
                    background: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    key: UniqueKey(),
                    child: CheckboxListTile(
                      activeColor: Colors.indigo.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      value: context.read<HomeController>().state.active,
                      onChanged: (value) =>
                          context.read<HomeController>().activeToogle(),
                      title: Text(
                        'Product $i',
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('Category ${i * 10}'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text('Delete all products?'),
                        content: Text(
                            'Are you sure you want to delete the entire list?'),
                        actions: [
                          TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: Text('Delete'),
                          ),
                        ]),
                  );
                },
                heroTag: 'delete-all',
                backgroundColor: Colors.red.shade300,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
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

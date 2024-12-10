import 'package:flutter/material.dart';

addProduct(context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add a product'),
        content: const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: 'Add a product (Ex: Bread)',
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownMenu(
                width: 220,
                dropdownMenuEntries: [
                  DropdownMenuEntry(label: 'Food', value: 'Food'),
                  DropdownMenuEntry(label: 'Hygiene', value: 'Hygiene'),
                  DropdownMenuEntry(label: 'Cleaning', value: 'Cleaning'),
                  DropdownMenuEntry(label: 'Other', value: 'Other'),
                ],
                label: Text('Select a category'),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                      
                    ),
                    
                  ),
                  
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.indigo, fontSize: 15),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.indigo, fontSize: 15),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

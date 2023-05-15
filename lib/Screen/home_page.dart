import 'package:buylist/Models/task_model.dart';
import 'package:buylist/Provider/database_provider.dart';
import 'package:buylist/Widget/ItemCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<TaskModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      // body: ListView.builder(
      //   itemCount: products.length,
      //   itemBuilder: (context, index) {
      //     return Product(taskModel: products[index]);
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'Overview'),
        ],
      ),
    );
  }
}

Widget _buildList() {
  return Consumer<DatabaseProvider>(
    builder: (context, provider, child) {
      return ListView.builder(
          itemCount: provider.tasks.length,
          itemBuilder: (context, index) {
            return Product(taskModel: provider.tasks[index]);
          });
    },
  );
}

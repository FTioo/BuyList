import 'package:buylist/Provider/database_provider.dart';
import 'package:buylist/Services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buylist/Models/task_model.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseHelper>(
      builder: (context, dbHelper, _) {
        return FutureBuilder<List<TaskModel>>(
          future: dbHelper.getTasks(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('there is no list'),
              );
            }

            final prov = DatabaseProvider(databaseHelper: DatabaseHelper());

            return ListView.builder(
              itemCount: prov.tasks.length,
              itemBuilder: (context, index) {
                final task = prov.tasks[index];

                final formattedDate =
                    DateFormat.yMd().format(DateTime.parse(task.date));

                return ListTile(
                  title: Text(task.itemName),
                  subtitle: Text('${task.quantity} x ${task.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(formattedDate),
                      IconButton(
                          onPressed: () {
                            dbHelper.deleteTask(index);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buylist/Models/task_model.dart';
import 'package:buylist/Provider/database_provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<List<TaskModel>>(
          future: provider.getTaskById(widget.taskModel.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(tasks[index].itemName),
                    subtitle: Text(
                        '${tasks[index].quantity} x ${tasks[index].price}'),
                    trailing: Text(tasks[index].date),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/child_model.dart'; // Import Child model
import '../providers/child_provider.dart';
import '../widgets/add_child_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nursery Management'),
      ),
      body: Consumer<ChildProvider>(
        builder: (context, childProvider, child) {
          if (childProvider.children.isEmpty) {
            return Center(
              child: Text('No children available'),
            );
          }
          return ListView.builder(
            itemCount: childProvider.children.length,
            itemBuilder: (context, index) {
              final child = childProvider.children[index];
              return ListTile(
                title: Text('${child.hoDem} ${child.ten}'),
                subtitle: Text('Class: ${child.lop}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddChildDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddChildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddChildDialog(onAddChild: (Child child) {
          Provider.of<ChildProvider>(context, listen: false).addChild(child);
        });
      },
    );
  }
}

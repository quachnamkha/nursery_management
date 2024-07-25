import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Họ Đệm')),
                DataColumn(label: Text('Tên')),
                DataColumn(label: Text('Ngày Sinh')),
                DataColumn(label: Text('Giới Tính')),
                DataColumn(label: Text('Địa Chỉ')),
                DataColumn(label: Text('Người Giám Hộ')),
                DataColumn(label: Text('Số ĐT')),
                DataColumn(label: Text('Lớp')),
              ],
              rows: childProvider.children.map((child) {
                return DataRow(
                  cells: [
                    DataCell(Text(child.hoDem)),
                    DataCell(Text(child.ten)),
                    DataCell(Text(DateFormat('dd-MM-yyyy').format(child.ngaySinh))),
                    DataCell(Text(child.gioiTinh)),
                    DataCell(Text(child.diaChi)),
                    DataCell(Text(child.nguoiGiamHo)),
                    DataCell(Text(child.soDT)),
                    DataCell(Text(child.lop)),
                  ],
                );
              }).toList(),
            ),
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

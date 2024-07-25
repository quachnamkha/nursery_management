import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/child_model.dart';

class AddChildDialog extends StatefulWidget {
  final Function(Child) onAddChild;

  AddChildDialog({required this.onAddChild});

  @override
  _AddChildDialogState createState() => _AddChildDialogState();
}

class _AddChildDialogState extends State<AddChildDialog> {
  final _formKey = GlobalKey<FormState>();
  final _hoDemController = TextEditingController();
  final _tenController = TextEditingController();
  final _ngaySinhController = TextEditingController();
  final _gioiTinhController = TextEditingController();
  final _diaChiController = TextEditingController();
  final _nguoiGiamHoController = TextEditingController();
  final _soDTController = TextEditingController();
  final _lopController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _ngaySinhController.text = _dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Child'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _hoDemController,
                decoration: InputDecoration(labelText: 'Họ Đệm'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Họ Đệm';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tenController,
                decoration: InputDecoration(labelText: 'Tên'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Tên';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ngaySinhController,
                decoration: InputDecoration(labelText: 'Ngày Sinh (yyyy-MM-dd)'),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Ngày Sinh';
                  }
                  try {
                    _dateFormat.parseStrict(value);
                  } catch (e) {
                    return 'Invalid date format, use yyyy-MM-dd';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gioiTinhController,
                decoration: InputDecoration(labelText: 'Giới Tính'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Giới Tính';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _diaChiController,
                decoration: InputDecoration(labelText: 'Địa Chỉ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Địa Chỉ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nguoiGiamHoController,
                decoration: InputDecoration(labelText: 'Người Giám Hộ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Người Giám Hộ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _soDTController,
                decoration: InputDecoration(labelText: 'Số ĐT'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Số ĐT';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lopController,
                decoration: InputDecoration(labelText: 'Lớp'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Lớp';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newChild = Child(
                id: '', // ID will be assigned by Firestore
                hoDem: _hoDemController.text,
                ten: _tenController.text,
                ngaySinh: _dateFormat.parseStrict(_ngaySinhController.text),
                gioiTinh: _gioiTinhController.text,
                diaChi: _diaChiController.text,
                nguoiGiamHo: _nguoiGiamHoController.text,
                soDT: _soDTController.text,
                lop: _lopController.text,
              );
              widget.onAddChild(newChild);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

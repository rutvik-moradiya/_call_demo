import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTable extends StatefulWidget {
   DataTable({Key? key}) : super(key: key);

  @override
  State<DataTable> createState() => _DataTableState();
}

class _DataTableState extends State<DataTable> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2
    ), itemBuilder: (context,index){
      return ListTile(
        title: Column(
          children: [
            Text('id'),
          ],
        ),
        subtitle: Column(
          children: [
            Text('State name'),
          ],
        ),
      );
    });
  }
}

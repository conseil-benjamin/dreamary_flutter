

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DreamCard extends ConsumerWidget{
  const DreamCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text('Dream Title'),
        subtitle: Text('Dream Description'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
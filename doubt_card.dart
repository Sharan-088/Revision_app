import 'package:flutter/material.dart';
import '../model/doubt.dart';

class DoubtCard extends StatelessWidget {
  final Doubt doubt;
  final VoidCallback onTap;

  const DoubtCard({
    super.key,
    required this.doubt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      child: ListTile(
        title: Text(
          doubt.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text('${doubt.subject} • ${doubt.difficulty}'),
        ),
        trailing: Icon(
          doubt.isUnderstood ? Icons.check_circle : Icons.help_outline,
          color: doubt.isUnderstood ? Colors.green : Colors.orange,
        ),
        onTap: onTap,
      ),
    );
  }
}

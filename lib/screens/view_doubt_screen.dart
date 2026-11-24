import 'package:flutter/material.dart';
import '../model/doubt.dart';

class ViewDoubtScreen extends StatefulWidget {
  final Doubt doubt;

  const ViewDoubtScreen({super.key, required this.doubt});

  @override
  State<ViewDoubtScreen> createState() => _ViewDoubtScreenState();
}

class _ViewDoubtScreenState extends State<ViewDoubtScreen> {
  late bool isUnderstood;

  @override
  void initState() {
    super.initState();
    isUnderstood = widget.doubt.isUnderstood;
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Doubt'),
        content: const Text('Are you sure you want to delete this doubt?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, 'delete');
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _save() {
    Navigator.pop(
      context,
      Doubt(
        id: widget.doubt.id,
        title: widget.doubt.title,
        description: widget.doubt.description,
        subject: widget.doubt.subject,
        difficulty: widget.doubt.difficulty,
        isUnderstood: isUnderstood,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doubt Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _save,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _confirmDelete,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doubt.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  widget.doubt.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                Wrap(
                  spacing: 10,
                  children: [
                    Chip(label: Text(widget.doubt.subject)),
                    Chip(label: Text(widget.doubt.difficulty)),
                  ],
                ),
                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Understood',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                        value: isUnderstood,
                        onChanged: (value) {
                          setState(() {
                            isUnderstood = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

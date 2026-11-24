import 'package:flutter/material.dart';
import '../model/doubt.dart';

class AddDoubtScreen extends StatefulWidget {
  const AddDoubtScreen({super.key});

  @override
  State<AddDoubtScreen> createState() => _AddDoubtScreenState();
}

class _AddDoubtScreenState extends State<AddDoubtScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController =
      TextEditingController();

  String _selectedSubject = 'Circuit Analysis';
  String _selectedDifficulty = 'Easy';

  final List<String> subjects = [
    'Circuit Analysis',
    'Dart',
    'Flutter',
    'C Programming',
    'Python',
  ];

  final List<String> difficultyLevels = ['Easy', 'Medium', 'Hard'];

  void _saveDoubt() {
    if (_formKey.currentState!.validate()) {
      final newDoubt = Doubt(
        id: DateTime.now().toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        subject: _selectedSubject,
        difficulty: _selectedDifficulty,
        isUnderstood: false,
      );

      Navigator.pop(context, newDoubt);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Doubt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Doubt Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter title' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter description'
                    : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField(
                initialValue: _selectedSubject,
                items: subjects
                    .map(
                      (sub) => DropdownMenuItem(
                        value: sub,
                        child: Text(sub),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSubject = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField(
                initialValue: _selectedDifficulty,
                items: difficultyLevels
                    .map(
                      (level) => DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDifficulty = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Difficulty',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _saveDoubt,
                child: const Text('Save Doubt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

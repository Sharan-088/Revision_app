import 'package:flutter/material.dart';
import '../model/doubt.dart';
import 'add_doubt_screen.dart';
import 'view_doubt_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Doubt> doubts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Doubts'),
        centerTitle: true,
      ),
      body: doubts.isEmpty
          ? const Center(
              child: Text(
                'No doubts yet 🧐\nTap + to add one',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: doubts.length,
              itemBuilder: (context, index) {
                final doubt = doubts[index];

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      doubt.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '${doubt.subject} • ${doubt.difficulty}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    trailing: Icon(
                      doubt.isUnderstood
                          ? Icons.check_circle
                          : Icons.help_outline,
                      color: doubt.isUnderstood
                          ? Colors.green
                          : Colors.orange,
                      size: 28,
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ViewDoubtScreen(doubt: doubt),
                        ),
                      );

                      if (result == 'delete') {
                        setState(() {
                          doubts.removeAt(index);
                        });
                      } else if (result is Doubt) {
                        setState(() {
                          doubts[index] = result;
                        });
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final newDoubt = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddDoubtScreen(),
            ),
          );

          if (newDoubt != null && newDoubt is Doubt) {
            setState(() {
              doubts.add(newDoubt);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Doubt'),
      ),
    );
  }
}

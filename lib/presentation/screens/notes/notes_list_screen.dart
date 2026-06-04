
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../providers/note_provider.dart';
import '../../widgets/notes/note_card.dart';

class NotesListScreen extends ConsumerWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);
    final query = ref.watch(noteSearchProvider);
    final filtered = notes.where((note) => note.title.toLowerCase().contains(query.state.toLowerCase()) || note.content.toLowerCase().contains(query.state.toLowerCase())).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Cari note', prefixIcon: Icon(Icons.search)),
              onChanged: (value) => ref.read(noteSearchProvider).state = value,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text('Belum ada note yang cocok.'))
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final note = filtered[index];
                        return Slidable(
                          key: ValueKey(note.id),
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (_) => ref.read(notesProvider.notifier).removeNote(note.id),
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                label: 'Hapus',
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () => context.go('/notes/editor', extra: note),
                            child: NoteCard(
                              title: note.title,
                              subtitle: note.content.isEmpty ? 'Tidak ada isi' : note.content,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/notes/editor'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

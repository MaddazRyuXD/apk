
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../providers/note_provider.dart';
import 'package:habitsxd/data/models/note_model.dart';

class NoteEditorScreen extends ConsumerStatefulWidget {
  final NoteModel? note;

  const NoteEditorScreen({super.key, this.note});

  @override
  ConsumerState<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends ConsumerState<NoteEditorScreen> {
  final contentController = TextEditingController();
  final titleController = TextEditingController();
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    contentController.text = widget.note?.content ?? '';
    titleController.text = widget.note?.title ?? '';
  }

  Future<void> _saveNote() async {
    setState(() => isSaving = true);
    final title = titleController.text.trim().isEmpty ? 'Catatan Baru' : titleController.text.trim();
    final content = contentController.text.trim();
    if (widget.note != null) {
      final updatedNote = widget.note!.copyWith(title: title, content: content);
      ref.read(notesProvider.notifier).updateNote(updatedNote);
    } else {
      final note = NoteModel(id: const Uuid().v4(), title: title, content: content);
      ref.read(notesProvider.notifier).addNote(note);
    }
    setState(() => isSaving = false);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor Note'),
        actions: [
          if (widget.note != null)
            IconButton(
              onPressed: isSaving
                  ? null
                  : () {
                      ref.read(notesProvider.notifier).removeNote(widget.note!.id);
                      if (mounted) Navigator.pop(context);
                    },
              icon: const Icon(Icons.delete_outline),
            ),
          IconButton(
            onPressed: isSaving ? null : _saveNote,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Judul Note'),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(border: InputBorder.none, hintText: 'Tulis catatan...'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

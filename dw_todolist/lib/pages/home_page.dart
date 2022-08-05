import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: GestureDetector(
        onTap: () {
          currentFocus.unfocus();
        },
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          color: Colors.black87,
          child: Column(
            children: [
              NoteInput(textEditingController: _textEditingController),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Farefas',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Expanded(
                child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        tarefas[index],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _textEditingController.text = tarefas[index];
                          tarefas.remove(tarefas[index]);
                          currentFocus.requestFocus();
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          tarefas.remove(tarefas[index]);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // extendedPadding: EdgeInsets.all(60),
        onPressed: () {
          if (_textEditingController.text.length > 0) {
            setState(() {
              tarefas.add(_textEditingController.text);
              _textEditingController.clear();
              currentFocus.unfocus();
            });
          }
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteInput extends StatelessWidget {
  const NoteInput({
    Key? key,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      minLines: 1,
      maxLines: 5,
      controller: _textEditingController,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.app_registration_rounded,
          color: Colors.indigo,
        ),
        suffix: GestureDetector(
          child: const Icon(
            Icons.clear,
            color: Colors.indigo,
          ),
          onTap: () {
            _textEditingController.clear();
          },
        ),
        label: const Text(
          'Nova nota',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.indigo,
            // width: 10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}

import 'package:bibliotech_flutter/ui/widgets/lista_livros.dart';
import 'package:flutter/material.dart';

import 'package:bibliotech_flutter/datasource/remote/livro_remote.dart';
import 'package:bibliotech_flutter/ui/pages/livro_detalhe.dart';
import 'package:bibliotech_flutter/ui/widgets/item_lista';
import 'package:bibliotech_flutter/models/aluno.dart';
import 'package:bibliotech_flutter/ui/pages/aluno_detalhe';

class HomeScreen extends StatefulWidget {
  final Aluno aluno;

  const HomeScreen(this.aluno, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('</BiblioTech>'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlunoDetalhe(widget.aluno),
                ),
              );
            },
            color: Theme.of(context).focusColor,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Todos os Livros'),
            Tab(text: 'Livros Reservados'),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildLivrosList('1', widget.aluno.aluno_id.toString()),
          buildLivrosList('2', widget.aluno.aluno_id.toString()),
        ],
      ),
    );
  }
}

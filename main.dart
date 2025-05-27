import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final contacts = [
    Contact(name: "John Doe", email: 'john_doeoe@gmail.com'),
    Contact(name: "Alice O. Austin", email: 'AliceOAustin@rhyta.com'),
    Contact(name: "Douglas R. Broadway", email: 'DouglasRBroadway@dayrep.com'),
  ];

  void toggleFavorite(int index) {
    setState(() {
      contacts[index].favorite = !contacts[index].favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contatos Favoritos ${contacts.where((e) => e.favorite).length}',
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('José da Silva Vieira'),
              accountEmail: Text('jsilvavieira@github.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=4'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Repositórios'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=4'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'José da Silva Vieira',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'jsvieira',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Brazil, São Paulo, SP',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'jsilvavieira@github.com',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        '32',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'seguidores',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '45',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'seguindo',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sobre mim',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Desenvolvedor apaixonado por tecnologia e inovação. Sempre buscando novos desafios para crescer profissionalmente e contribuir com soluções criativas.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // LISTA DE CONTATOS
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=$index'),
                  ),
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].email),
                  trailing: IconButton(
                    icon: contacts[index].favorite
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border),
                    onPressed: () => toggleFavorite(index),
                  ),
                );
              },
            ),

            // BLOCO EXTRA APÓS A LISTA
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Experiência Profissional',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Atualmente atuo como desenvolvedor mobile Flutter na Enesa Engenharia, onde participo da criação de soluções digitais voltadas à produtividade da obra.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Projetos Recentes',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class Contact {
  String name;
  String email;
  bool favorite = false;

  Contact({required this.name, required this.email});
}

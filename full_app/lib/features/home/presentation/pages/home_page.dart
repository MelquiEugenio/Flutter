import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:full_app/features/home/di/home_di.dart';
import 'package:full_app/features/home/presentation/state/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    HomeDI.initializeHomeDI();
    store = getIt.get<HomeStore>();
  }

  @override
  void dispose() {
    HomeDI.unregisterHomeDI();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Repositories')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'GitHub Username'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text.trim();
                  store.fetchRepositories(username);
              },
              child: const Text('Fetch Repositories'),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (store.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (store.errorMessage.isNotEmpty) {
                  return Text(
                    'Error: ${store.errorMessage}',
                    style: const TextStyle(color: Colors.red),
                  );
                }

                if (store.repos.isEmpty) {
                  return const Text('No repositories found.');
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: store.repos.length,
                    itemBuilder: (context, index) {
                      final repo = store.repos[index];
                      return ListTile(
                        title: Text(repo.name ?? '?'),
                        subtitle: Text(
                          repo.language ?? '?',
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

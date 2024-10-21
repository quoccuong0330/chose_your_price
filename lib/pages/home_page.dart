import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Chose your price"),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20),
          const Text('Name product'),
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(onPressed: () {}, child: const Text('Check'))
        ]),
      ),
    );
  }
}

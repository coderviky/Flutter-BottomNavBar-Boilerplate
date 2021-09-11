import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const Text("Not Found!"),
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}

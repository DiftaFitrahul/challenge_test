import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: StreamBuilder(
                  stream: Stream.periodic(const Duration(milliseconds: 970)),
                  builder: (context, snapshot) {
                    return Text(
                      DateFormat('hh:mm:ss').format(DateTime.now()),
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    );
                  },
                )),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      ),
    );
  }
}

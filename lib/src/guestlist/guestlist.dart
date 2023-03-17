import 'package:flutter/material.dart';
import 'package:social_credit_club_app/src/model/guest.dart';
import 'package:social_credit_club_app/src/scan/scanner.dart';

class Guestlist extends StatefulWidget {
  const Guestlist({super.key});

  @override
  State<Guestlist> createState() => _GuestlistState();
}

class _GuestlistState extends State<Guestlist> {

final Future<List<Guest>> _getGuests = Future<List<Guest>>(() => [Guest(),Guest(),]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Guest>>(
        future: _getGuests, 
        builder: (BuildContext context, AsyncSnapshot<List<Guest>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Text(snapshot.data.toString(),)
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scanner(
                title: 'Add guest',
              ),
            ),
          );
        },
        child: const Text('Add guest'),
      ),
    );
  }
}

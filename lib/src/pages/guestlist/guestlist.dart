import 'package:flutter/material.dart';
import 'package:social_credit_club_app/src/model/guest.dart';
import 'package:social_credit_club_app/src/model/user.dart';
import 'package:social_credit_club_app/src/pages/guestlist/widget/guestlistcard.dart';
import 'package:social_credit_club_app/src/pages/scan/scanner.dart';

class Guestlist extends StatefulWidget {
  const Guestlist({super.key});

  @override
  State<Guestlist> createState() => _GuestlistState();
}

class _GuestlistState extends State<Guestlist> {
  List<User> users = [
    User(
      birthdate: '28-8-1980',
      id: '1',
      rating: 10,
      role: Role.customer,
      username: 'Bob',
    ),
    User(
      birthdate: '31-8-1995',
      id: '2',
      rating: 10,
      role: Role.customer,
      username: 'Cees',
    ),
  ];

  late final Future<List<User>> _getGuests;
  @override
  void initState() {
    super.initState();
    _getGuests = Future<List<User>>(() => users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: [
          SafeArea(
            child: FutureBuilder<List<User>>(
              future: _getGuests,
              builder:
                  (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                List<Widget> children = [];
                if (snapshot.hasData) {
                  for (User user in snapshot.data!) {
                    children.add(
                      Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GuestlistCard(user: user),
                          )),
                    );
                  }
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Guestlist(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.recycling_outlined),
                  label: const Text('Refresh'),
                ),
              ),
            ],
          )
        ],
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
          child: const Icon(Icons.person_add)),
    );
  }
}

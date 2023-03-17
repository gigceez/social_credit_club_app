import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_credit_club_app/src/model/user.dart';
import 'package:social_credit_club_app/src/pages/guestlist/guestlist.dart';
import 'package:social_credit_club_app/src/services/apihandler.dart';

class GuestlistCard extends StatelessWidget {
  const GuestlistCard({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(60)),
              ),
              Text(user.username),
              Text(user.birthdate),
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              'Score: ${user.rating}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    adjustUserRasting(user, 1).then(
                      (value) {
                        if (value) {
                          print('Mooi werk');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Guestlist(),
                            ),
                          );
                        } else {
                          print('GING NIET GOED!');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Guestlist(),
                            ),
                          );
                        }
                      },
                    );
                  },
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    adjustUserRasting(user, -1).then(
                      (value) {
                        if (value) {
                          print('Mooi werk');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Guestlist(),
                            ),
                          );
                        } else {
                          print('GING NIET GOED!');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Guestlist(),
                            ),
                          );
                        }
                      },
                    );
                  },
                  icon: const Icon(Icons.heart_broken_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    kickUser(user).then(
                      (value) {
                        if (value) {
                          print('Mooi werk');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Guestlist(),
                            ),
                          );
                        } else {
                          print('GING NIET GOED!');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Guestlist(),
                            ),
                          );
                        }
                      },
                    );
                  },
                  icon: const Icon(Icons.back_hand_outlined),
                )
              ],
            )
          ],
        )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_credit_club_app/src/model/user.dart';

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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.heart_broken_outlined),
                ),
                IconButton(
                  onPressed: () {},
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

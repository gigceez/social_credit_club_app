import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClubMemberCard extends StatelessWidget {
  const ClubMemberCard({required this.memberId, super.key});

  final int memberId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.yellowAccent,
      ),
      child: Text('De memberId is $memberId'),
    );
  }
}

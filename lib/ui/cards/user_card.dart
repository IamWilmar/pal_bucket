import 'package:flutter/material.dart';
import 'package:pal_bucket/models/http/user.dart';
import 'package:pal_bucket/ui/cards/widgets.dart/user_card_photo.dart';
import 'package:pal_bucket/ui/cards/widgets.dart/user_information_card.dart';
import 'package:pal_bucket/ui/labels/custom_labels.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: buildBoxDecoration(),
        child: Row(
          children: [
            CardPhoto(),
            Expanded(
              flex: 2,
              child: UserInformationCard(user: user),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Color(0xFFC4C4C4),
        borderRadius: BorderRadius.circular(20),
      );
}

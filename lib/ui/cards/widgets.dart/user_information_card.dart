import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pal_bucket/models/http/user.dart';
import 'package:pal_bucket/ui/labels/custom_labels.dart';

class UserInformationCard extends StatelessWidget {
  final User user;
  const UserInformationCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Container(
        width: 100,
        decoration: buildBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name!, style: CustomLabels.h4Black),
              Expanded(
                child: _UserDescriptionPanel(
                  description: user.description ?? '',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      );
}

class _UserDescriptionPanel extends StatelessWidget {
  final String description;
  const _UserDescriptionPanel({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      decoration: buildBoxDecoration(),
      child: Text(
        description,
        style: CustomLabels.h5Black,
        maxLines: 5,
        overflow: TextOverflow.fade,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFE7E7E7),
      );
}

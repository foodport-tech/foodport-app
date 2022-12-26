import 'package:flutter/material.dart';
import 'package:foodport_app/utils/colors.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 18,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(''),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'username',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: neutral1Color,
                          ),
                        ),
                        const TextSpan(
                          text: "  ",
                        ),
                        TextSpan(
                          text: 'Some comments go here..',
                          style: TextStyle(
                            color: neutral1Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "dd MMMM yyyy",
                      // DateFormat import from package 'intl'
                      // DateFormat(
                      //   'dd MMMM yyyy · hh:mm aa',
                      // ).format(
                      //   widget.snap['datePublished'].toDate(),
                      // ),
                      style: const TextStyle(
                        fontSize: 12,
                        color: neutral3Color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.favorite_outline,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

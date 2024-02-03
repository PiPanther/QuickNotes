import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/styles/app_styles.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot snapshot) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppStyle.cardscolors[snapshot['color']],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            snapshot['note-title'],
            style: AppStyle.mainTexts,
          ),
          Text(
            snapshot['date'],
            style: AppStyle.datetitle,
          ),
          Text(
            snapshot['note-content'],
            style: AppStyle.maincontent,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    ),
  );
}

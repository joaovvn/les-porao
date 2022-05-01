import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(bool isHome) {
  return AppBar(
    backgroundColor: Colors.blue,
    leading: Builder(builder: (context) {
      return Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 30),
          child: kIsWeb
              ? InkWell(
                  enableFeedback: !isHome,
                  hoverColor: Colors.transparent,
                  onTap: () =>
                      isHome ? null : Navigator.pushNamed(context, '/'),
                  child: Image.network(
                    "assets/assets/iconPorao.png",
                    color: Colors.white,
                  ),
                )
              : InkWell(
                  enableFeedback: !isHome,
                  hoverColor: Colors.transparent,
                  onTap: () =>
                      isHome ? null : Navigator.pushNamed(context, '/'),
                  child: Image.asset(
                    "iconPorao.png",
                    color: Colors.white,
                  ),
                ));
    }),
    title: const Center(
        child: Text(
      'Porão',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),
  );
}

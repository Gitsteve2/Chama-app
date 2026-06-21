import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ProfileImageWidget({
    Key? key,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;

    return Center(
        child: Stack(
      children: [
        buildImage(),
        Positioned(bottom: 0, right: 4, child: buildEditButton(color)),
      ],
    ));
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: const AssetImage('assets/images/profil.png'),
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditButton(Color color) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFFa52b29),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 4)),
      child: Icon(
        Icons.edit,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

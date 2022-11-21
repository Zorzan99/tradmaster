import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CardPosts extends StatelessWidget {
  String comentario;
  String autor;
  String upVotes;
  String downVotes;
  String dataComentario;
  Function() onTap;
  Function() onPressedIcon;
  Widget icon;
  CardPosts(
      {required this.comentario,
      required this.autor,
      required this.upVotes,
      required this.downVotes,
      required this.dataComentario,
      required this.onTap,
      required this.onPressedIcon,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.50,
                    child: Text(
                      autor,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 0.25,
                        child: Text(upVotes,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16)),
                      ),
                      SizedBox(
                        width: Get.width * 0.25,
                        child: Text(downVotes,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.30,
                        child: Text(dataComentario,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16)),
                      ),
                      IconButton(onPressed: onPressedIcon, icon: icon)
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    width: Get.width * 0.99,
                    child: Text(comentario,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16)),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}

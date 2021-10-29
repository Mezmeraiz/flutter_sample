import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoInfoScreen extends StatefulWidget {

  static const route = "photo_info";

  final Photo photo;

  const PhotoInfoScreen(this.photo);

  @override
  State<StatefulWidget> createState() => PhotoInfoScreenState();

}

class PhotoInfoScreenState extends State<PhotoInfoScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      body: Stack(
        children: [
          Image.network(widget.photo.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  widget.photo.liked = !widget.photo.liked;
                });
              },
              child: SvgPicture.asset("assets/icons/heart.svg",
                fit: BoxFit.fill,
                color: widget.photo.liked ? Colors.red : Colors.grey,),
            ),
          )
        ],
      )
    );
  }

}
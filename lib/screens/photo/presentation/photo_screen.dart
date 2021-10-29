import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/injection_container.dart';
import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';
import 'package:flutter_sample/screens/photo_info/presentation/photo_info_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'photo_cubit.dart';
import 'photo_state.dart';

class PhotoScreen extends StatelessWidget {

  static const route = "photo";

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<PhotoCubit>().getPhotos();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: Container(
          color: Colors.black12,
          child: BlocBuilder<PhotoCubit, PhotoState>(builder: (context, state) {
            if (state is PhotoLoaded) {
              return GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: state.photos.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) {
                    return PhotoListItem(state.photos[index]);
                  }
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          })
      ),
    );
  }

}

class PhotoListItem extends StatefulWidget {

  final Photo photo;

  PhotoListItem(this.photo);

  @override
  State<StatefulWidget> createState() => PhotoListItemState();

}

class PhotoListItemState extends State<PhotoListItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        await Navigator.pushNamed(context, PhotoInfoScreen.route, arguments: widget.photo);
        setState(() {});
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            fadeOutDuration: Duration(milliseconds: 100),
              fadeInDuration: Duration(milliseconds: 100),
              imageUrl: widget.photo.thumbnail,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill
          ),
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
          ),
        ],
      ),
    );
  }

}


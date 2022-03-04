import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_list_item.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';
import 'package:flutter_svg/svg.dart';

class SavedScreen extends StatefulWidget {
  static const route = "saved";

  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SavedScreenState();
}

class SavedScreenState extends State<SavedScreen>
    with AutomaticKeepAliveClientMixin<SavedScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved"),
      ),
      body: Container()
    );
  }

  @override
  bool get wantKeepAlive => true;
}

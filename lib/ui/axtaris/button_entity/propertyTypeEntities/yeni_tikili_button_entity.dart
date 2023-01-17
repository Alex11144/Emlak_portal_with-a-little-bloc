import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/evler_data/evler_data.dart';
import '../../../evler/elanlarList/elanlar_list.dart';

class YeniTikiliButtonEntityWidget extends StatefulWidget {
  // bool isSelected = false;
  final void Function()? onTap;
  double height;
  double width;
  double borderRadius;
  String text;
  String? floorCount;
  YeniTikiliButtonEntityWidget({
    Key? key,
    // required this.isSelected,
    this.onTap,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.text,
    this.floorCount,
  }) : super(key: key);

  @override
  State<YeniTikiliButtonEntityWidget> createState() =>
      _YeniTikiliButtonEntityWidgetState();
}

class _YeniTikiliButtonEntityWidgetState
    extends State<YeniTikiliButtonEntityWidget> {
  final filterApi = FilterApiClient();
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: watch.yeni
              ? Border.all(width: 0)
              : Border.all(width: 0.2, color: Colors.grey),
        ),
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: watch.yeni ? Colors.white : Colors.black,
              backgroundColor: watch.yeni
                  ? const Color.fromRGBO(34, 186, 104, 1)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            onPressed: () {
              if (queryParameters.propertyType == '0' ||
                  queryParameters.propertyType == '2' ||
                  queryParameters.propertyType == '3') {
                queryParameters.propertyType = '1';
              } else {
                queryParameters.propertyType = '0';
              }

              setState(() {
                watch.menzil = false;
                watch.yeni = !watch.yeni;
                watch.kohne = false;
                watch.evVilla = false;
              });
              watch.getSatilirMertebeCount();

              // tapped1 = false;
            },
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            )));
  }
}

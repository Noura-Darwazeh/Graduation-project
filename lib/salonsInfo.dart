import 'package:flutter/material.dart';
import 'package:soft/salonmodel.dart';
import 'package:soft/salons_tags.dart';

import 'salon_page.dart';


class salonsInfo extends StatelessWidget{
  final salonmodel salons;
  String? centreName;
  salonsInfo ({Key?key,
    required this.salons, this.centreName
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            centreName!,style:
          Theme.of(context).textTheme.headline3?.copyWith(
            color: Colors.pink,

          ),
          ),
          SizedBox(height: 10,),
          salons_tags(salon:salons),
          SizedBox(height: 5,),
          Text(
              'Salon Information',style:
          Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.black,
          )),
          SizedBox(height: 5,),
          Text(
              'Salon in Nabluse',style:
          Theme.of(context).textTheme.bodyText1?.copyWith(
            color: Colors.black,
          )),
          SizedBox(height: 5,),

        ],
      ),



    );
  }



}
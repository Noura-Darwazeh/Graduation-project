import 'package:flutter/material.dart';
import 'package:soft/salonmodel.dart';

class salons_tags extends StatelessWidget{
  const salons_tags ({
    Key?key,
    required this.salon,
  }):super (key:key);
  final salonmodel salon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      salon.tags
          .map((tag) => salon.tags.indexOf(tag)==salon.tags.length
          ?Text(tag,style: Theme.of(context).textTheme.bodyText1,)
          :Text('$tag, ',
          style:TextStyle(color: Colors.white,fontSize: 2)
      ),
      ).toList(),



    );
  }

}
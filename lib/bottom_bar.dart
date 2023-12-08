
import 'package:flutter/material.dart';
import 'package:soft/cart.dart';

class bar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin:6.0 ,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width/2-40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
              topRight: Radius.circular(25)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width/2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
                  // Icon(Icons.home,color: Color(0xFFEF7532),size: 35,),
                  // Icon(Icons.person_outline,color: Color(0xFFEF7532),size: 35,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.home,size: 35,),color:Colors.pink,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.person_outline,size: 35,),color:Colors.pink,)



                ],

              ),

            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width/2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
                  // Icon(Icons.search,color: Color(0xFFEF7532),size: 35,),
                  // Icon(Icons.shopping_bag,color: Color(0xFFEF7532),size: 35,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 35,),color:Colors.pink,),
                  IconButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>cart(

                        ))
                    );
                  }, icon: Icon(Icons.shopping_bag,size: 35,),color:Colors.pink,)
                ],

              ),

            ),

          ],

        ),
      ),

    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return CupertinoPageScaffold(
     backgroundColor: Color(0xFFFEF7FF),
     navigationBar: CupertinoNavigationBar(
       middle: Text("Need Blood",style: TextStyle(color: CupertinoColors.white,fontSize: 16)),
       trailing: Icon(CupertinoIcons.add,color: CupertinoColors.white,),
       backgroundColor: CupertinoColors.destructiveRed,

     ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: CircleAvatar(
                backgroundColor: CupertinoColors.inactiveGray,
                child: Icon(Icons.bloodtype_outlined,color: CupertinoColors.systemRed,size: 70,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Donate Blood',style: TextStyle(
                fontWeight: FontWeight.w900
            ),)
          ],
        ),
      ),
   );
  }
}

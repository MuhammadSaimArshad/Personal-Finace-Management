import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
        ),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white,width: 1.0),
                    ),
                    hintText: "Search",
                    hintStyle:const TextStyle(color: Colors.white70),
                    suffixIcon: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.close,color:Colors.white ,)),
                    )
                ),
                autocorrect: true,
              ),
            ),

            Text("NOT FOUND",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
          ],),
      ),
    );
  }
}




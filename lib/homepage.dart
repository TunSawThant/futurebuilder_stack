import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Books.dart';
import 'bookdetails.dart';
class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Books> booklists = [];

  Future<List<Books>> _bookDetails() async {
    var respnonseurl =
    await http.get("https://my.api.mockaroo.com/books.json?key=3c694760");
    var jsonData = json.decode(respnonseurl.body);

    for (var bookval in jsonData) {
      Books _books = Books(
          bookval['bookname'],
          bookval['bookauthor'],
          bookval['bookcover'],
          bookval['bookrating'],
          bookval['bookviews'],
          bookval['bookdetails']);
      booklists.add(_books);
    }
    return booklists;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future:_bookDetails() ,
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                  //print(snapshot.data.toString());
                  if(snapshot.connectionState==ConnectionState.done){
                    if(snapshot.data !=null){
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context,int index){
                            return  BookDetails(
                                snapshot.data[index],
//                                snapshot.data[index].bookname,
//                                snapshot.data[index].bookauthor,
//                                snapshot.data[index].bookcover,
//                                snapshot.data[index].bookviews,
//                                snapshot.data[index].bookrating
                            );
                          }
                      );

                    }
                    else {
                      return Container(
                        child: Center(
                          child: Text("Error..",style: TextStyle(color: Colors.red),),
                        ),
                      );
                    }

                  }
                  else{
                    return Container(
                      child:Center(
                        child: Text("Loading.."),
                      ) ,
                    );
                  }

                  }
              ),
          ],
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';

import 'Books.dart';
import 'detailsPage.dart';

class BookDetails extends StatelessWidget {
  Books index;
//  String bookname;
//  String bookauthor;
//  String bookcover;
//  int bookviews;
//  int bookrating;
BookDetails(this.index/*,this.bookname,this.bookauthor,this.bookcover,this.bookviews,this.bookrating*/);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 250.0,
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(image: NetworkImage(index.bookcover),fit: BoxFit.fill)
            ),
          ),
          Positioned(
            top: 70,
              left: 140,
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                  width: 200.0,
                  height: 150.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: Container(
                          child: Center(
                            child: Text(index.bookname,style: TextStyle(
                                color: Color(0xff07128a),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Center(
                            child: Text(index.bookauthor,
                                style: TextStyle(
                                    color: Color(0xff2da9ef),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold))),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(index.bookviews.toString() + " views",
                                  style: TextStyle(
                                      color: Color(0xffff6f00), fontSize: 16.0)),
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xffff6f00),
                                  ),
                                  onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsPage(index)));
                                  }),
                            ],
                          )),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}

import 'package:api/AipData.dart';
import 'package:api/All_match_info.dart';
import 'package:flutter/material.dart';

class DetailsOfMatch extends StatefulWidget {
  SeriesAdWrapper? seriesAdWrapper;

  DetailsOfMatch(this.seriesAdWrapper);

  @override
  State<DetailsOfMatch> createState() => _DetailsOfMatchState();
}

class _DetailsOfMatchState extends State<DetailsOfMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "${widget.seriesAdWrapper!.seriesName}",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
          itemCount: widget.seriesAdWrapper!.matches!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>match_info(widget.seriesAdWrapper!.matches![index].matchInfo,widget.seriesAdWrapper!.matches),
                        ));
                  });
                },
                child: Container(
                  child: Center(
                      child: Center(child: Text(
                          "${widget.seriesAdWrapper!.matches![index].matchInfo!.matchDesc}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      )),
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(15)),
                  width: double.infinity,
                ),
              ),
            );
          },
        ));
  }
}

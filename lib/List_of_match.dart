import 'package:api/AipData.dart';
import 'package:api/Details_of_match.dart';
import 'package:flutter/material.dart';

class ListOfMatch extends StatefulWidget {
  List<SeriesMatches>? seriesMatches;
  String? matchType;

  ListOfMatch(this.seriesMatches, this.matchType);

  @override
  State<ListOfMatch> createState() => _ListOfMatchState();
}

class _ListOfMatchState extends State<ListOfMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "${widget.matchType} match",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: widget.seriesMatches != null
            ? ListView.builder(
                itemCount: widget.seriesMatches!.length,
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: widget.seriesMatches![index].seriesAdWrapper != null,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsOfMatch(widget.seriesMatches![index].seriesAdWrapper),
                                ));
                          });
                        },
                        child: Container(
                          child: Center(
                              child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${widget.seriesMatches![index].seriesAdWrapper?.seriesName}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Series ID ${widget.seriesMatches![index].seriesAdWrapper?.seriesId}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(15)),
                          width: double.infinity,
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

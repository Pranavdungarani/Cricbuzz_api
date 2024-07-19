import 'package:api/AipData.dart';
import 'package:flutter/material.dart';

class match_info extends StatefulWidget {
  MatchInfo? matchInfo;
  List<Matches>? matches;

  match_info(this.matchInfo, this.matches);

  @override
  State<match_info> createState() => _match_infoState();
}

class _match_infoState extends State<match_info> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.matchInfo!.matchDesc}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              if (panelIndex == 0) {
                _isExpanded1 = !_isExpanded1;
              } else if (panelIndex == 1) {
                _isExpanded2 = !_isExpanded2;
              }
            });
          },
          children: [
            ExpansionPanel(
              backgroundColor: Colors.brown,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  tileColor: Colors.brown,
                  title: Text(
                    '${widget.matchInfo!.seriesName} (${widget.matchInfo!.matchDesc}) - Match Info',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                color: Colors.brown,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match ID:- ${widget.matchInfo!.matchId}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Series ID:- ${widget.matchInfo!.seriesId}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Series name:- ${widget.matchInfo!.seriesName}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match desc:- ${widget.matchInfo!.matchDesc}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match format:- ${widget.matchInfo!.matchFormat}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match start date:- ${widget.matchInfo!.startDate}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match end date:- ${widget.matchInfo!.endDate}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match state:- ${widget.matchInfo!.state}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match status:- ${widget.matchInfo!.status}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              isExpanded: _isExpanded1,
            ),
            ExpansionPanel(
              backgroundColor: Colors.brown,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  tileColor: Colors.brown,
                  title: Text(
                    '${widget.matchInfo!.seriesName} (${widget.matchInfo!.matchDesc}) - Match score',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                color: Colors.brown,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Additional Information 1",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Additional Information 2",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Add more widgets as needed
                  ],
                ),
              ),
              isExpanded: _isExpanded2,
            ),
          ],
        ),
      ),
    );
  }
}

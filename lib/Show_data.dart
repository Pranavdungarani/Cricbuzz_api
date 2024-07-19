import 'dart:convert';
import 'package:api/AipData.dart';
import 'package:api/List_of_match.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class show_data extends StatefulWidget {
  const show_data({super.key});

  @override
  State<show_data> createState() => _show_dataState();
}

class _show_dataState extends State<show_data> {
  ApiData? My_app_data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: My_app_data != null
          ? ListView.builder(
              itemCount: My_app_data!.typeMatches!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListOfMatch(
                                My_app_data!.typeMatches![index].seriesMatches,
                                  My_app_data!.typeMatches![index].matchType,
                              ),
                            ));
                      });
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "${My_app_data!.typeMatches![index].matchType}",
                        style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
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
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> fetchData() async {
    print("enter fun =>");

    var url =
        Uri.parse('https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent');
    var response = await http.get(url, headers: {
      "x-rapidapi-key": "df79eb7325msh46761b8f03d9c8bp19e562jsn17545c922ccb",
      "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      var json_decode = json.decode(response.body);
      My_app_data = ApiData.fromJson(json_decode);
    });
  }
}

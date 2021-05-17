import 'package:flutter/material.dart';
import 'package:drishti/src/utils/media_player.dart';
import 'package:google_fonts/google_fonts.dart';

// Instructions and their corresponding audio feedbacks
const _instructionsList = [
  ["Getting started", "cash_recognition/instructions/1.mp3"],
  ["Audio Feedback", "cash_recognition/instructions/2.mp3"],
  ["History Feature", "cash_recognition/instructions/3.mp3"],
  ["Placement of Notes", "cash_recognition/instructions/4.mp3"],
  ["More Queries", "cash_recognition/instructions/5.mp3"],
  ["Additional Information", "cash_recognition/instructions/6.mp3"],
];

class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  final _fontSize = 23.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text("INFORMATION",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 25)))),
        backgroundColor: Color(0xff1F7A8C),
        elevation: 15,
        centerTitle: true,
      ),
      body: getInstructionListView(),
      backgroundColor: Colors.white,
    );
  }

  Widget getInstructionListView() {
    final TextStyle listTextStyle =
        TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600);

    return ListView.builder(
      itemCount: _instructionsList.length,
      itemBuilder: (context, index) {
        return Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.width * 0.0,
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffEAE8E8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Center(
                      child: ListTile(
                    title: Text('${index + 1}. ' + _instructionsList[index][0],
                        style: listTextStyle),
                    trailing: Icon(
                      Icons.volume_up_sharp,
                      color: Colors.black,
                      size: 40,
                    ),
                    onTap: () {
                      MediaPlayer.playAudio(_instructionsList[index][1]);
                    },
                  ))),
            ),
          ),
        ]);
      },
    );
  }

  @override
  void dispose() {
    // If any audio is being played, stop it before leaving Instructions Page
    MediaPlayer.stopAudio();
    super.dispose();
  }
}

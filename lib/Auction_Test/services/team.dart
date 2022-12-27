import 'package:http/http.dart';
class Team{
  String teamName;
  String auctionPurse;
  String auctionPurseLeft;

  Team({required this.teamName, required this.auctionPurse, required this.auctionPurseLeft});
  Future<void> getTeamDetails() async{
    try{

    }
    catch(e)
    {
      print("caught error: $e");
    }
  }
}


import 'package:chari/Auction_Test/services/player.dart';

class PlayerStats extends Player
{
  int matches;
  int battingInnings;
  int battingRuns;
  double battingAverage;
  double battingStrikeRate;
  int highScore;
  int hundreds;
  int fifties;
  int bowlingInnings;
  double bowlingAverage;
  String bowlingStrikeRate;
  int wickets;
  double economy;
  int fifers;

  PlayerStats({required super.playerName, required super.playerRole,
  required this.matches, required this.battingInnings, required this.battingRuns, required this.battingAverage,
  required this.battingStrikeRate,
  required this.highScore, required this.hundreds,
  required this.fifties,required  this.bowlingInnings, required this.bowlingAverage,
  required this.bowlingStrikeRate, required this.wickets,
  required this.economy, required this.fifers
});



}
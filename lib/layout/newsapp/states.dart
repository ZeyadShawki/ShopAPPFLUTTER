abstract class newsStates{}
class newsintialsates extends newsStates{}
class newsbottomnav extends newsStates{}
class newsgetbuissnessloadingState extends newsStates{}
class businesssuccesstate extends newsStates{}
class businesserrorstate extends newsStates {
  late final String error;
  businesserrorstate(this.error);
}
class newsgetsportloadingState extends newsStates{}
class sportsuccesstate extends newsStates{}
class sportserrorstate extends newsStates {
  late final String error;
  sportserrorstate(this.error);
}
class newsgetsciencesloadingState extends newsStates{}
class sciencessuccesstate extends newsStates{}
class scienceserrorstate extends newsStates {
  late final String error;
  scienceserrorstate(this.error);
}
class darkmodestate extends newsStates{}
class newsgetsearchloadingState extends newsStates{}
class searchssuccesstate extends newsStates{}
class searchserrorstate extends newsStates {
  late final String error;
  searchserrorstate(this.error);
}

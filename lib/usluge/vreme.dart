String intToTime(int value) {
  int sekunde = value * 60;

  int h, m, s;

  h = sekunde ~/ 3600;
  m = ((sekunde - h * 3600)) ~/ 60;
  s = sekunde - (h * 3600) - (m * 60);

  String rezultat = "$h:$m:$s";
  return rezultat;
}


List sumTwoVectorsLimited(v1, v2, lim) {
  var sumVectors = [];
  var s = 0;
  for (var i = 0; i < v1.length; i++) {
    for (var j = 0; j < v2.length; j++) {
      s = v1[i] + v2[j];
      if (s > lim) break;
      if (!sumVectors.contains(s)) sumVectors.add(s);
    }
  }
  return sumVectors;
}

List step(k, t, ls, sumVectors) {
  sumVectors = sumTwoVectorsLimited(ls, sumVectors, t);
  sumVectors.sort();
  //print(k, t, ls, "sumVectors=",sumVectors);
  if (k == 2) return sumVectors;
  return step(k - 1, t, ls, sumVectors);
}

num chooseBestDistance(k, t, ls) {
  var sumVectors = ls;
  return step(k, t, ls, sumVectors).last;
}

//print(chooseBestDistance(k, t, ls))
void main() {
  var ls = [51, 56, 100, 58, 59, 61, 180];
  var k = 3;
  var t = 174;
  print(chooseBestDistance(k, t, ls));
}

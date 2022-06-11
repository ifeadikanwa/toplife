const int maxStatsValue = 100;

int? crossCheckStat(int? stat) {
  if (stat == null) {
    return stat;
  } else if (stat > maxStatsValue) {
    return maxStatsValue;
  } else if (stat < 0) {
    return 0;
  } else {
    return stat;
  }
}

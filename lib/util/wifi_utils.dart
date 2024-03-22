import 'dart:math';

int calculateSignalLevel(int rssi) {
  const int MIN_RSSI = -100;
  const int MAX_RSSI = -55;
  int numLevels=5;
  if (rssi <= MIN_RSSI) {
    return 0;
  } else if (rssi >= MAX_RSSI) {
    return numLevels - 1;
  } else {
    return ((rssi - MIN_RSSI) * (numLevels - 1) / (MAX_RSSI - MIN_RSSI)).floor();
  }
}

num calculateDistance(int frequency, int level) {
  const DISTANCE_MHZ_M = 27.55; // Adjust the constant value as needed.
  return pow(10.0, (DISTANCE_MHZ_M - 20 * log(frequency.toDouble()) / log(10) + level.abs()) / 20.0);
}



class TimeUtils {
  static String formatSecondsToClock(int seconds) {
    int hours = (seconds ~/ 3600);
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = (hours < 10) ? '0$hours' : '$hours';
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}

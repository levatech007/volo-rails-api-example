#constants for external API data processing
WIND_DIRECTIONS = {
  0..11=> 'N', 12..33=> 'NNE', 34..56=> 'NE', 57..78=> 'ENE',
  79..101=> 'E', 102..123=> 'ESE', 124..146=> 'SE',147..168=> 'SSE',
  169..191=> 'S',192..213=> 'SSW',214..236=> 'SW',237..258=> 'WSW',
  259..281=> 'W',282..303=> 'WNW',304..326=> 'NW',327..348=> 'NNW',
  349..360=> 'N',
}

DAYS_OF_WEEK = {
  0 => 'Sunday', 1 => 'Monday', 2 => 'Tuesday', 3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday', 6 => 'Saturday'
}

MONTHS = {
  1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June',
  7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
}

ICON_URL = {
  200..232 => 'thunderstorms',
  300..321 => 'rain',
  500..531 => 'rain',
  600..622 => 'snow',
  700..781=> 'fog',
  800 => 'clear',
  801 => 'fewclouds',
  802..803=> 'partlycloudy',
  804 => 'overcast',
}

const String appName = "comodo";

const String homeScreenTitle = "comodo";

String toTitleCase(String input) {
  var tokens = input.trim().split(' ');
  StringBuffer output = StringBuffer();

  for (var token in tokens) {
    output.write(token.substring(0, 1).toUpperCase() + token.substring(1));
    output.write(' ');
  }

  return output.toString().trim();
}

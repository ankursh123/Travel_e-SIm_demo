///Response Status Code Success and Error Handling.
enum ApiStatusCode {

  success(""),
  unauthorized("User Unauthorized! Access Token Expired"),
  serverError("Server Error"),
  notFound("Error, Not Found"),
  unknownError("Unknown Error");

  final String value;
  const ApiStatusCode(this.value);
}

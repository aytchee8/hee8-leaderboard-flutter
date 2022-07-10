import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hee8_lb/utils/auth/api/auth.dart';
import 'package:hee8_lb/utils/error/request_error.dart';
import 'package:http/http.dart' as http;

class AuthImpl implements Auth {
  static const clientId = "995605139614339144";
  static const clientSecret = "Ug0eISKHPTcKRFkp2kNrAflq2ozjQnSU";
  static const apiEndpoint = "https://discord.com/api/v10";
  static const callbackUrl = "localhost:3000/auth";
  static const authEndpoint = "https://discord.com/api/oauth2";

  @override
  Future<Either<String, RequestError>> authUser() async {
    final url = Uri.https(authEndpoint, "/authorize", {
      "response_type": "code",
      "client_id": clientId,
      "redirect_uri": callbackUrl,
      "scope": "identify",
    });

    final result = await FlutterWebAuth.authenticate(url: url.toString(), callbackUrlScheme: callbackUrl);
    Uri parsedResult = Uri.parse(result);

    if (parsedResult.queryParameters.containsKey("code")) {
      return Left(parsedResult.queryParameters["code"]!);
    } else {
      return Right(RequestError("There was a problem while logging you in!"));
    }
  }

  @override
  Future<Either<String, RequestError>> getAccessToken(String code) async {
    final url = Uri.http(authEndpoint, "/oauth2/token");

    final result = await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "grant_type": "authorization_code",
        "client_id": clientId,
        "client_secret": clientSecret,
        "redirect_uri": callbackUrl,
        "code": code,
      }
    );
    final Map body = jsonDecode(result.body);

    if (body.containsKey("access_token")) {
      return Left(body["access_token"]);
    } else {
      return Right(RequestError("There was a problem while getting access token!"));
    }
  }

  @override
  Future<Either<String, RequestError>> getUser() async {
    final url = Uri.https(apiEndpoint, "/users/@me");

    final response = await http.get(url, headers: {
      "Authorization": ""
    });
    final Map responseBody = jsonDecode(response.body);

    if (responseBody.containsKey("id")) {
      return Left(responseBody["id"]);
    } else {
      return Right(RequestError("There was a problem while getting your user!"));
    }
  }
}
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hee8_lb/injection_container.dart';
import 'package:hee8_lb/utils/auth/api/auth.dart';
import 'package:hee8_lb/utils/error/request_error.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthImpl implements Auth {
  static const clientId = "995605139614339144";
  static const clientSecret = "Ug0eISKHPTcKRFkp2kNrAflq2ozjQnSU";
  static const baseDiscordUrl = "discord.com";
  static const redirectUri = "http://localhost:3000/auth.html";
  
  late String accessToken;
  late String code;

  final prefs = sl<SharedPreferences>();

  @override
  Future<Either<String, RequestError>> authUser() async {
    final url = Uri.https(baseDiscordUrl, "/api/oauth2/authorize", {
      "response_type": "code",
      "client_id": clientId,
      "redirect_uri": redirectUri,
      "scope": "identify",
    });

    final result = await FlutterWebAuth.authenticate(url: url.toString(), callbackUrlScheme: redirectUri);
    Uri parsedResult = Uri.parse(result);

    if (parsedResult.queryParameters.containsKey("code")) {
      code = parsedResult.queryParameters["code"]!;
      return Left(code);
    } else {
      return Right(RequestError("There was a problem while logging you in!"));
    }
  }

  @override
  Future<Either<String, RequestError>> getAccessToken(String code) async {
    final url = Uri.http(baseDiscordUrl, "/api/v10/oauth2/token");

    final result = await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "grant_type": "authorization_code",
        "client_id": clientId,
        "client_secret": clientSecret,
        "redirect_uri": redirectUri,
        "code": code,
      }
    );
    final Map body = jsonDecode(result.body);

    if (body.containsKey("access_token")) {
      prefs.setString("accessToken", body["access_token"]);
      return Left(body["access_token"]);
    } else {
      return Right(RequestError("There was a problem while getting access token!"));
    }
  }

  @override
  Future<Either<String, RequestError>> getUser() async {
    final url = Uri.https(baseDiscordUrl, "api/v10/users/@me");

    if (prefs.getString("accessToken") != null) {
      accessToken = prefs.getString("accessToken")!;
    } else {
      (await getAccessToken(code)).fold(
        (l) { accessToken = l; },
        (r) { return Right(RequestError("There was a problem while getting your user!")); }
      );
    }

    final response = await http.get(url, headers: {
      "Authorization": "Bearer $accessToken"
    });
    final Map responseBody = jsonDecode(response.body);

    if (responseBody.containsKey("id")) {
      await prefs.setString("userId", responseBody["id"]);
      return Left(responseBody["id"]);
    } else {
      return Right(RequestError("There was a problem while getting your user!"));
    }
  }

  @override
  Future<void> logoutUser() async {
    await http.post(
      Uri.parse("uri"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "token": prefs.getString("accessToken")
      }
    );

    prefs.remove("accessToken");
    prefs.remove("userId");
  }
}
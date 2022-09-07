import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:testing/user_fields.dart';

class UserSheetApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "electric-360118",
  "private_key_id": "e0afca34317c0cd2f6c69603d74d53aca9b5c22f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAL4M4mrszlyn5\neJt1k6fsI4iowU7+vTRI4nWg2uN5Gl0mbTkdgJoibJZ96Cb0d7fq14gYLfZKM4or\n4U4/JKsh+71vX2aaugtPrFS6bvZrVvRX1BSBdJNldQIrGqFRpg3aRkMSeJxTc1NK\nZwt4LUHUpaFh5QbSboM1Aef0c30Md0ImpSyxXTOOlBKS4sJZPa5vjmPCLSls6RgQ\nSGSb4GuMUBxzLuTvXxRjjoHi5D1bAJ7U+LIStB1GQ6VICT1qZP/vH8Je41R8G8hK\n/xpQRDhDTtoGj2qRKgWvLtqhq60ws1JtSZVViRcMlQVAn+a655A2kA4fYZIdoJNV\nrqwUztRbAgMBAAECggEAAxG/MBboiSO6O+MSjdzUgGT2OHETPeZFANT9DptFqW15\nB2AUhXAZsMBjNuePl7VBxAe6g12t4p7SxMNNvfHBT0L3UjaygM4ags88cIMifwcI\nfU6ZypIouHoXQBumGpO4V5VqWiUq+fo23lKppZBeI3NHEd/X2AyDyUOah2uWF64u\nFxUcQP4e2ks0ORZqSdf5JTKsuiAUvoqv4YIZB/woiefzzl3qmafB2cTvbiougySd\n6KOhOaJwm5RR/b9GObfhb15VmrvjBSyhCWJP585QKvb7JFeg1AdyE/jCdtlhHqFd\nqR3jvLJhRQBFMqlzgXZz++HUuooVx2qU+/RjIlzn4QKBgQD/clGivvJ3oabMus3a\nWfif7OiOEf6DmRmKIYni4O8ndzOjZw0+a6803cJQ4UnxFK9vdDPcJno7ioVHMCW8\nN5J1AB0OVqrgMJV76RPaIAue2PGsus6mXGYdVCKI/hGGi+lqA+iNxjKU7UDpN+Sr\nik1zpZZFxRqaa6ZSUiakeMho1wKBgQDAmhtIiSdEI90A9mrTtviqwki/URXQO6eA\ng57nnu6HaM113whNlwDe0rtEJBpLn+KzeS1jeTCHO1qEuK4HUKLPmfN2yZFhcmsE\nJRhD6OlcHpZiSr/T8YTHPAaBWPXL+0DeWNtwlqWZbYup1DswsZcmGs3vEdgCvfSc\nrw7wG9osHQKBgQD+BR2fPEj7pBmtzzmzn/K4fitIVCaHkPCvxuhKYCoSUdxc6rZl\n00nYxYldSptwDITkzWZgzzaQDRC6GOv9fjm69ZDvWEn2RPnxzXa7W1CS9uNlRCMJ\nlirJkYgCOL0O0gUcMqTIj0ZviHsbMETKPO8GSKzl1rq8wr4TcLQSrDWG4wKBgBeD\neOs9G1cdTcDtVJNuViN6vqjkvFYEwmlVKFQ8ugA8EkFerkPSuJ97eLNT+QXcii/B\nDoKDbCJGY8GqTkzEUmwn7mpFJ4OPFXOXF8RKrhq5/UAYwhyc8snkESM/ehqiHQRI\nMtom+iamEhP0vhkuxTY4tYWHVyjWigOK97bmn5cdAoGARH7OZEPykNNYUYPT6eB+\nKb/JY6ANfF/rMPY6TXWC4+5njFKBjkj3j//mQFzz5wbs6hqXurcVZa5PpAdEfE15\nkMkSk5/0jQFHyNhBPFy2ZCg29w/+wtwwonYNvWiR7fQOQsBcxOAOlwZYHRUnD2A9\nQM1eC9OYU2gS5QJdzRy6+lc=\n-----END PRIVATE KEY-----\n",
  "client_email": "sheets@electric-360118.iam.gserviceaccount.com",
  "client_id": "115571167630812027934",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sheets%40electric-360118.iam.gserviceaccount.com"
}

''';

  static final _spreadsheetId = '1ZpYnbQ0gMx3QEVolXlQm-LFc-ad_tQY3JWD8P0jyOPo';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Consumers');
      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet?> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }
}

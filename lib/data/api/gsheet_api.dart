import 'dart:developer';

import 'package:gsheets/gsheets.dart';

class GsheetApi {
  //create credentials
  static const _credential = r'''
    {
      "type": "service_account",
      "project_id": "flutter-gsheets-390702",
      "private_key_id": "3726561bd5b3590bcc0cb21694e3ec41973c0329",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCxQRdA2myjc43p\njwZIWR8rMJtDD7ehzPwuE/XtqvpfsLCPX8JFCVaPVx8yRF9Zrmoz1DxfcNDQ3pvp\ndnhACDGtFr9G4/pXr1LS3oHzO4KMjZkse6SMlWcAGlw8F6YJXaGH1DdmFEI6/6WU\nZ2hHSdjq0+M00EOJlIFDSZno/h8pNwdKnVK1xEq+L+X1Y1IE1OjSw3+r+eERmrSR\neOa/csFVZiD6RoYm0P4r6G6M6iRaxjdTJ8kioOJ1lWYhIIhy4DrxUwrHS5ZJ+I5g\npYA6Ma1gsG7SepM5shxPIIZmkwk9FgBzUNjwlQHI988AB/JvhRRtyrc6BEYGjIlJ\n4zC/RcqPAgMBAAECggEAMn0rbfYphr9V92adcAMuvSMpvobeFBDq7gcSgIG4soQG\nLrikgfygctDqmmteS5HCP4QfNEJSwIQAHhZ4Nyj+WWLG1h7/AnX2ngjyNAHJ9FYr\nAMAxRTgTMDTR++3yhe1tIt8Abqurl9mU5Po1ekTfLDhxmewOqMQrs6pl1Dd6UccY\n+U4c43LlXdNT+Q/P+tJe3tgb9nigPulUwalBahJYpiL51CIGlnGPP/3P36HeZB0s\n8FZ/qK+mO5N8KMo/55rqBYdeTi8+0TAaKO0I0flqy65iR0Gomk31KbDHFB+jACxN\n8tWsFoBb6Ecsm1qFBtZ2LdDu05UWaI1JUPcqkcaVuQKBgQDcNlRAs61kEhOfGX+O\n7eCRFTS5oC6k0bjAyFM27FoZOZhqTtnEfXAuWk+mOObCSTMMD3kjTQRKcsYH0MmY\nK8K6JKBPFSgmFnk1yETb4SC7ObsjzWFwE97HS67XUKB7gQLrYBUKyViTnwKLX7eZ\n1U2v38RMYCK03skT2bRedJHR2QKBgQDOD4vRqaqpXL8rqo7FYMU2iydD9QHlI8hB\n5h/BLn6PWUtBf55V0xfYdSiwVj0FdeAyruyLZFUgR9k5rksRFTh0ouhCiqt21SfE\nCp3ZfsFFyl/snPGWyC5NW/P0ChiNcwSCh2aGQceTzll/vV8Tg87zAHNPESX909HH\nEn+IZX9WpwKBgQCtT8jxfzf4qU1uCwhcehUiujjb2xi6uSAaAc+US2IBtlWhXVuA\njGTM5mEHZoMe57NYS5lAUi4NVdVLc2Ql8lL4YzkT5IfLqiZNUMf48W7sS1xgqhSE\nu+66lXMOnLMhYIDmtKD680pWLHA5NuTuGnVg9NCud375MNm6WL3fFQlqyQKBgFq+\nk+dgHYz6ECItuTQI2rCbdU5DDnOXX3BN5HwReqCsRSzyA4tuK9kiNyn4wGSwNWx8\nhiUYqThPC8WQEPTT8InE2B29rabmVd3Kgxst6/VNGxM7RlUNkP52WSeGbquUFE9b\nS3Yib76Sp+1OOxl/+VogP6d5OM7gQki1x74MXJiPAoGBALzkrUajMNEvByfdqpYJ\nMQYmbNGZHeHjOGGmr/N7XkxMwjfxsknstHf+MJ2Avd8zYQgEdUmHp59svOhCVWsu\nZWLiK1eblxYWdF+7TrFf2wkLwYg9cU6osB3Fl/nzKd71dRSNzlWlkeHoG9xC6kbg\nJmSgCQAm2sL7obF29EEPb6oR\n-----END PRIVATE KEY-----\n",
      "client_email": "mitch-project@flutter-gsheets-390702.iam.gserviceaccount.com",
      "client_id": "106776039823741761640",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/mitch-project%40flutter-gsheets-390702.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    }
  ''';

  //set up & connect to the spreadsheet
  static const _spreadSheetId = '1xJa746ozavZBRaMPIV40Is5BYx7WWslXSjKSxfu2D9Q';
  static final _gsheets = GSheets(_credential);
  static Worksheet? worksheet;

  //intialize the spredsheet!
  Future init() async {
    try {
      final ss = await _gsheets.spreadsheet(_spreadSheetId);
      worksheet = ss.worksheetByTitle('Note1');
      log("Gsheets Connected");
    } catch (e) {
      log("Error init: $e");
    }
  }
}

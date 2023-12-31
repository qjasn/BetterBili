import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../generated/l10n.dart';
import '../lists.dart';
import '../network/apiRequest.dart';

// 为什么这段请求不放在network目录下?你可以试试哦
class LoginApiRequest extends ChangeNotifier {
  Dio dio = Dio();
  Map _qrcodeContent = {};
  var _loginData, _timer, _loginDataCookie;
  String _loginContent = "Not get Qrcode";
  int _runSeconds = 0;

  GenerateQrcode(context) async {
    var response = await dio.get(bilibiliApiMap["login_qrcode_generate"]!);
    Map<String, dynamic> responseData = jsonDecode(response.toString());
    _qrcodeContent = responseData;
    print(_qrcodeContent['data']['qrcode_key']);
    notifyListeners();
    CheckQrcodeState(context);
  }

  PollQrcode() async {
    if (_qrcodeContent["data"] != null) {
      var response = await dio.get(
          "${bilibiliApiMap['login_qrcode_poll']!}?qrcode_key=${_qrcodeContent['data']['qrcode_key']}");
      Map<String, dynamic> responseData = jsonDecode(response.toString());
      if (response.headers['set-cookie']?[0] != null) {
        _loginDataCookie = response.headers['set-cookie']?[0].split(";")[0];
        SpUtil.putString("SESSDATA", _loginDataCookie);
        print(_loginDataCookie);
      } else {
        _loginDataCookie = "No cookie";
      }
      _loginData = response.data;
      print("$_loginData");
    } else {
      _loginData = null;
    }
  }

  CheckQrcodeState(context) {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      _runSeconds++;
      PollQrcode();
      var state = _loginData != null ? _loginData['data']['code'] : null;
      switch (state) {
        case null:
          _loginContent = "Not Get qrcode";
          notifyListeners();
          break;
        case 86101:
          _loginContent = "Not Scan";
        case 86090:
          _loginContent = "Not Pass";
        case 0:
          _loginContent = "Login Successfully!";
          notifyListeners();
          Navigator.of(context).pop();
          CancelCheckQrcodeState();
      }
      notifyListeners();
      if (_runSeconds == 180) {
        CancelCheckQrcodeState();
      }
    });
  }

  CancelCheckQrcodeState() {
    _timer.cancel();
    _runSeconds = 0;
  }
}


class Login extends StatefulWidget {
  const Login({
    super.key,
    required String method,
  }) : loginMethod = method;
  final String loginMethod;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    var http = context.watch<LoginApiRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).LoginTitle),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
              http.CancelCheckQrcodeState();
            },
          ),
        ),
        body: Center(
          child: QrcodeLogin(),
        ));
  }
}

class QrcodeLogin extends StatelessWidget {
  const QrcodeLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var http = context.watch<LoginApiRequest>();
    return Center(
      child: Column(children: [
        Text("Please scan the QRcode"),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  http.GenerateQrcode(context);
                },
                child: Text("Get")),
          ],
        ),
        http._qrcodeContent['data'] != null
            ? QrImageView(
                data: http._qrcodeContent['data']['url'],
                size: 200,
                backgroundColor: Colors.white,
              )
            : Text("Please click 'Get' button to get a new QRcode"),
        Text(http._loginContent)
        // Image.network(http._content["data"]["url"])
      ]),
    );
  }
}

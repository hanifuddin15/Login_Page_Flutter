import 'package:flutter/material.dart';
import 'package:login_page_flutter/api_manager/api_base_helper.dart';
import 'package:login_page_flutter/api_manager/api_manage_model.dart';
import 'package:login_page_flutter/api_manager/loginresponsemodel.dart';
import 'package:login_page_flutter/login/login_api_request_model.dart';

class LoginAPIRepository {
  final String _getNewsOpinionSummery =
      "Reports/GetNewsOpinionSummery?formDate=";

  late ApiBaseHelper _helper;
  GlobalKey<ScaffoldState>? uikey;

  //LoginAPIRepository Initiallizer
  LoginAPIRepository(GlobalKey<ScaffoldState> uikey) {
    this.uikey = uikey;
    this._helper = ApiBaseHelper(uikey);
  }

//
  // Future<DashboardReportSummeryModel> getAllSummeryReport(
  //   String fromDate,
  //   String toDate,
  // ) async {
  //   var apiEndPoint = _getNewsOpinionSummery + '$fromDate&toDate=$toDate';

  //   var requestData = APIManagerModel(
  //       url: apiEndPoint,
  //       method: APIMethod.getMethod,
  //       body: null,
  //       isTokenRequired: true,
  //       header: null);
  //   final response =
  //       await _helper.manageAPI(requestData: requestData, isForLogin: false);

  //   var list = DashboardReportSummeryModel.fromJson(response);
  //   return list;
  // }
  Future<LoginResponse> postAPICall(String username, String password) async {
    // 1. API Manager  Model Making;
    var loginRequestModel = LoginRequestModel(
        username: username,
        password: password,
        grant_type: 'password',
        scope: 'offline_access',
        DeviceId: '233juuhrn2r',
        DeviceName: 'dksd',
        DeviceModel: '24h1j4nmdjsdah',
        client_id: 'ClientApp',
        client_secret: 'O1ZeoTA_RV',
        DeviceToken: 'dxEPit4gfUPLu8YUFpTEDQ:APA91bHp9k8-Y2hX35-cZOK9EOsCLX1h5mTMFCn5YpMyP5i3dJep2725jiJTYuWS0zUVSnM34sYywf4wywshoQBjy8iu8nt9XPdoysM8Vi2hJcbFpA1BIbsCVyLvKL_0tlMzfEv1j4Wc',
        
        );
    var requestData = APIManagerModel(
        isTokenRequired: false,
        url: "connect/token",
        method: APIMethod.postMethod,
        body: loginRequestModel.toJson(),
        header: null);
    // 2.Api calling using helper class;
    final response =
        await _helper.manageAPI(requestData: requestData, isForLogin: true);

    // 3.APi response JSON convert into model;
    var loginResponse = LoginResponse.fromJson(response);

    // 4. return converted model;
    return loginResponse;
  }
}

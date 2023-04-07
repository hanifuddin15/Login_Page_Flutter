class LoginRequestModel {
    LoginRequestModel({
        this.username,
        this.password,
        this.grant_type,
        this.scope,
        this.DeviceId,
        this.DeviceName,
        this.DeviceModel,
        this.client_id,
        this.client_secret,
        this.DeviceToken
    });

    String? username;
    String? password;
    String? grant_type;
    String? scope;
    String? DeviceId;
    String? DeviceName;
    String? DeviceModel;
    String? client_id;
    String? client_secret;
    String? DeviceToken;
    
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['scope'] = this.scope;
    data['DeviceId'] = this.DeviceId;
    data['DeviceName'] = this.DeviceName;
    data['DeviceModel'] = this.DeviceModel;
    data['DeviceToken'] = this.DeviceToken;
    // data['Type'] = this.type;
    data['grant_type'] = this.grant_type;
    data['client_id'] = this.client_id;
    data['client_secret'] = this.client_secret;

    return data;
  }
}

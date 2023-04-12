class LoginResponseModel {
    LoginResponseModel({
        this.statusCode,
        this.message,
        this.details,
    });

    int? statusCode;
    String? message;
    String? details;

     LoginResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    details = json['details'];
    
  }
}

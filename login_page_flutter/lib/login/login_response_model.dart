class LoginResponseModel {
    LoginResponseModel({
        this.statusCode,
        this.message,
        this.details,
    });

    int? statusCode;
    String? message;
    String? details;
}

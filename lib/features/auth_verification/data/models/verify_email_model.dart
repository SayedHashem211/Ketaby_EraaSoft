class VerifyEmailModel {
  List<dynamic>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  VerifyEmailModel({this.data, this.message, this.error, this.status});

  VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <dynamic>[];
    }
    message = json['message'];
    if (json['error'] != null) {
      error = <dynamic>[];
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.map((v) => v.Json()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
/// fullName : "RYPZNPZ  WNYMD UTTMYYMY"
/// can : "197374"
/// lastLogin : "2024-01-25T14:52:00"
/// errorCode : null
/// errorDescription : null
/// tokenKey : "hifApxRyFTM1c68fUzuGK8oQ69Y5FWLogglp/ZjHt9Y="
/// profilePic : null
/// isProfileUpdated : "1"
/// loginId : "webtestuser"
/// mudarabaID : ""
/// paymentOption : "DD"

class LoginResponse {
  LoginResponse({
      String? fullName, 
      String? can, 
      String? lastLogin, 
      dynamic errorCode, 
      dynamic errorDescription, 
      String? tokenKey, 
      dynamic profilePic, 
      String? isProfileUpdated, 
      String? loginId, 
      String? mudarabaID, 
      String? paymentOption,}){
    _fullName = fullName;
    _can = can;
    _lastLogin = lastLogin;
    _errorCode = errorCode;
    _errorDescription = errorDescription;
    _tokenKey = tokenKey;
    _profilePic = profilePic;
    _isProfileUpdated = isProfileUpdated;
    _loginId = loginId;
    _mudarabaID = mudarabaID;
    _paymentOption = paymentOption;
}

  LoginResponse.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _can = json['can'];
    _lastLogin = json['lastLogin'];
    _errorCode = json['errorCode'];
    _errorDescription = json['errorDescription'];
    _tokenKey = json['tokenKey'];
    _profilePic = json['profilePic'];
    _isProfileUpdated = json['isProfileUpdated'];
    _loginId = json['loginId'];
    _mudarabaID = json['mudarabaID'];
    _paymentOption = json['paymentOption'];
  }
  String? _fullName;
  String? _can;
  String? _lastLogin;
  dynamic _errorCode;
  dynamic _errorDescription;
  String? _tokenKey;
  dynamic _profilePic;
  String? _isProfileUpdated;
  String? _loginId;
  String? _mudarabaID;
  String? _paymentOption;
LoginResponse copyWith({  String? fullName,
  String? can,
  String? lastLogin,
  dynamic errorCode,
  dynamic errorDescription,
  String? tokenKey,
  dynamic profilePic,
  String? isProfileUpdated,
  String? loginId,
  String? mudarabaID,
  String? paymentOption,
}) => LoginResponse(  fullName: fullName ?? _fullName,
  can: can ?? _can,
  lastLogin: lastLogin ?? _lastLogin,
  errorCode: errorCode ?? _errorCode,
  errorDescription: errorDescription ?? _errorDescription,
  tokenKey: tokenKey ?? _tokenKey,
  profilePic: profilePic ?? _profilePic,
  isProfileUpdated: isProfileUpdated ?? _isProfileUpdated,
  loginId: loginId ?? _loginId,
  mudarabaID: mudarabaID ?? _mudarabaID,
  paymentOption: paymentOption ?? _paymentOption,
);
  String? get fullName => _fullName;
  String? get can => _can;
  String? get lastLogin => _lastLogin;
  dynamic get errorCode => _errorCode;
  dynamic get errorDescription => _errorDescription;
  String? get tokenKey => _tokenKey;
  dynamic get profilePic => _profilePic;
  String? get isProfileUpdated => _isProfileUpdated;
  String? get loginId => _loginId;
  String? get mudarabaID => _mudarabaID;
  String? get paymentOption => _paymentOption;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['can'] = _can;
    map['lastLogin'] = _lastLogin;
    map['errorCode'] = _errorCode;
    map['errorDescription'] = _errorDescription;
    map['tokenKey'] = _tokenKey;
    map['profilePic'] = _profilePic;
    map['isProfileUpdated'] = _isProfileUpdated;
    map['loginId'] = _loginId;
    map['mudarabaID'] = _mudarabaID;
    map['paymentOption'] = _paymentOption;
    return map;
  }

}
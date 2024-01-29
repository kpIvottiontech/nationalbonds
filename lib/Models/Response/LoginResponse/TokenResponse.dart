/// access_token : "0L3u_D_hQxeFd5iRzJdEzlPjKa7PI_Ag9aUBDQusjhRL2_aav8ECuvcpW0KKuI4wKQDMmOHqz224HKw2oTNMlPr_VyBAiDxrEDJ1BwfljWDbPi9zLPCfKGdikZ0wLFkYxzBs2tC4KQde0M7T5jwOh5drJJbM1jwAKlb7v_g_FhA470YXF5X9t0HQ5kyhrd5e4rTMswVtVCWO8umngKCybJFL9FAiqB1AikMZuE2XD8cypGvsCCFWJsWks6WCmOsEV9JUcaRLz1xReH-BexcYEV6p7qFGotUaH3bADDSKpswTDUG55TB_r4k_5wt2EDHfKTITnyzdxwA5kW9_SSviEKPqLTaXrf5iqWGnv8wP4msmT7km5OXC18xRVJOxyWwM"
/// token_type : "bearer"
/// expires_in : 3599

class TokenResponse {
  TokenResponse({
      String? accessToken, 
      String? tokenType, 
      num? expiresIn,}){
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
}

  TokenResponse.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }
  String? _accessToken;
  String? _tokenType;
  num? _expiresIn;
TokenResponse copyWith({  String? accessToken,
  String? tokenType,
  num? expiresIn,
}) => TokenResponse(  accessToken: accessToken ?? _accessToken,
  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
);
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    return map;
  }

}
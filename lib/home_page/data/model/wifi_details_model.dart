/// WifiAnalyser : [{"wiFiConnection":{"ipAddress":"192.168.0.100","linkSpeed":72,"wiFiIdentifier":{"bssid":"c0:25:e9:69:29:36","ssid":"Deltin Royal","ssidRaw":"Deltin Royal"}},"wiFiDetails":[{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"0e:83:94:3f:42:8e","ssid":"AirFiber-Khan","ssidRaw":"AirFiber-Khan"},"wiFiSecurity":{"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":2437,"is80211mc":false,"level":-90,"primaryFrequency":2437,"timestamp":972886570373,"wiFiBand":"GHZ2","wiFiStandard":"AX","wiFiWidth":"MHZ_20"}},{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"18:a6:f7:e2:7f:84","ssid":"Mukesh","ssidRaw":"Mukesh"},"wiFiSecurity":{"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":2422,"is80211mc":false,"level":-89,"primaryFrequency":2412,"timestamp":972892043911,"wiFiBand":"GHZ2","wiFiStandard":"N","wiFiWidth":"MHZ_40"}},{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"50:fe:f2:00:c9:10","ssid":"IND_SMAC_AP3_98_V","ssidRaw":"IND_SMAC_AP3_98_V"},"wiFiSecurity":{"capabilities":"[ESS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":5280,"is80211mc":false,"level":-88,"primaryFrequency":5280,"timestamp":972893921978,"wiFiBand":"GHZ5","wiFiStandard":"N","wiFiWidth":"MHZ_20"}},{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"c0:25:e9:69:29:36","ssid":"Deltin Royal","ssidRaw":"Deltin Royal"},"wiFiSecurity":{"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":2432,"is80211mc":false,"level":-59,"primaryFrequency":2422,"timestamp":972896587698,"wiFiBand":"GHZ2","wiFiStandard":"N","wiFiWidth":"MHZ_40"}}]}]

class WifiDetailsModel {
  WifiDetailsModel({
      List<WifiAnalyser>? wifiAnalyser,}){
    _wifiAnalyser = wifiAnalyser  ;
}

  WifiDetailsModel.fromJson(dynamic json) {
    if (json['WifiAnalyser'] != null) {
      _wifiAnalyser = [];
      json['WifiAnalyser'].forEach((v) {
        _wifiAnalyser?.add(WifiAnalyser.fromJson(v));
      });
    }
  }
  List<WifiAnalyser>? _wifiAnalyser;
WifiDetailsModel copyWith({  List<WifiAnalyser>? wifiAnalyser,
}) => WifiDetailsModel(  wifiAnalyser: wifiAnalyser ?? _wifiAnalyser,
);
  List<WifiAnalyser>? get wifiAnalyser => _wifiAnalyser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wifiAnalyser != null) {
      map['WifiAnalyser'] = _wifiAnalyser?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// wiFiConnection : {"ipAddress":"192.168.0.100","linkSpeed":72,"wiFiIdentifier":{"bssid":"c0:25:e9:69:29:36","ssid":"Deltin Royal","ssidRaw":"Deltin Royal"}}
/// wiFiDetails : [{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"0e:83:94:3f:42:8e","ssid":"AirFiber-Khan","ssidRaw":"AirFiber-Khan"},"wiFiSecurity":{"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":2437,"is80211mc":false,"level":-90,"primaryFrequency":2437,"timestamp":972886570373,"wiFiBand":"GHZ2","wiFiStandard":"AX","wiFiWidth":"MHZ_20"}},{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"18:a6:f7:e2:7f:84","ssid":"Mukesh","ssidRaw":"Mukesh"},"wiFiSecurity":{"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":2422,"is80211mc":false,"level":-89,"primaryFrequency":2412,"timestamp":972892043911,"wiFiBand":"GHZ2","wiFiStandard":"N","wiFiWidth":"MHZ_40"}},{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"50:fe:f2:00:c9:10","ssid":"IND_SMAC_AP3_98_V","ssidRaw":"IND_SMAC_AP3_98_V"},"wiFiSecurity":{"capabilities":"[ESS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":5280,"is80211mc":false,"level":-88,"primaryFrequency":5280,"timestamp":972893921978,"wiFiBand":"GHZ5","wiFiStandard":"N","wiFiWidth":"MHZ_20"}},{"children":[],"wiFiAdditional":{"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}},"wiFiIdentifier":{"bssid":"c0:25:e9:69:29:36","ssid":"Deltin Royal","ssidRaw":"Deltin Royal"},"wiFiSecurity":{"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]},"wiFiSignal":{"centerFrequency":2432,"is80211mc":false,"level":-59,"primaryFrequency":2422,"timestamp":972896587698,"wiFiBand":"GHZ2","wiFiStandard":"N","wiFiWidth":"MHZ_40"}}]

class WifiAnalyser {
  WifiAnalyser({
      WiFiConnection? wiFiConnection, 
      List<WiFiDetails>? wiFiDetails,}){
    _wiFiConnection = wiFiConnection;
    _wiFiDetails = wiFiDetails;
}

  WifiAnalyser.fromJson(dynamic json) {
    _wiFiConnection = json['wiFiConnection'] != null ? WiFiConnection.fromJson(json['wiFiConnection']) : null;
    if (json['wiFiDetails'] != null) {
      _wiFiDetails = [];
      json['wiFiDetails'].forEach((v) {
        _wiFiDetails?.add(WiFiDetails.fromJson(v));
      });
    }
  }
  WiFiConnection? _wiFiConnection;
  List<WiFiDetails>? _wiFiDetails;
WifiAnalyser copyWith({  WiFiConnection? wiFiConnection,
  List<WiFiDetails>? wiFiDetails,
}) => WifiAnalyser(  wiFiConnection: wiFiConnection ?? _wiFiConnection,
  wiFiDetails: wiFiDetails ?? _wiFiDetails,
);
  WiFiConnection? get wiFiConnection => _wiFiConnection;
  List<WiFiDetails>? get wiFiDetails => _wiFiDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wiFiConnection != null) {
      map['wiFiConnection'] = _wiFiConnection?.toJson();
    }
    if (_wiFiDetails != null) {
      map['wiFiDetails'] = _wiFiDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// children : []
/// wiFiAdditional : {"vendorName":"","wiFiConnection":{"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}}
/// wiFiIdentifier : {"bssid":"0e:83:94:3f:42:8e","ssid":"AirFiber-Khan","ssidRaw":"AirFiber-Khan"}
/// wiFiSecurity : {"capabilities":"[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]","securityTypes":[]}
/// wiFiSignal : {"centerFrequency":2437,"is80211mc":false,"level":-90,"primaryFrequency":2437,"timestamp":972886570373,"wiFiBand":"GHZ2","wiFiStandard":"AX","wiFiWidth":"MHZ_20"}

class WiFiDetails {
  WiFiDetails({
      WiFiAdditional? wiFiAdditional, 
      WiFiIdentifier? wiFiIdentifier, 
      WiFiSecurity? wiFiSecurity, 
      WiFiSignal? wiFiSignal,
    WifiAbility? wifiAbility,}){
    _wiFiAdditional = wiFiAdditional;
    _wiFiIdentifier = wiFiIdentifier;
    _wiFiSecurity = wiFiSecurity;
    _wiFiSignal = wiFiSignal;
    _wifiAbility = wifiAbility;
}

  WiFiDetails.fromJson(dynamic json) {

    _wiFiAdditional = json['wiFiAdditional'] != null ? WiFiAdditional.fromJson(json['wiFiAdditional']) : null;
    _wiFiIdentifier = json['wiFiIdentifier'] != null ? WiFiIdentifier.fromJson(json['wiFiIdentifier']) : null;
    _wiFiSecurity = json['wiFiSecurity'] != null ? WiFiSecurity.fromJson(json['wiFiSecurity']) : null;
    _wiFiSignal = json['wiFiSignal'] != null ? WiFiSignal.fromJson(json['wiFiSignal']) : null;
    _wifiAbility = json['wifiAbility'] != null ? WifiAbility.fromJson(json['wifiAbility']) : null;
  }
  WiFiAdditional? _wiFiAdditional;
  WiFiIdentifier? _wiFiIdentifier;
  WiFiSecurity? _wiFiSecurity;
  WiFiSignal? _wiFiSignal;
  WifiAbility? _wifiAbility;
WiFiDetails copyWith({  List<dynamic>? children,
  WiFiAdditional? wiFiAdditional,
  WiFiIdentifier? wiFiIdentifier,
  WiFiSecurity? wiFiSecurity,
  WiFiSignal? wiFiSignal,
  WifiAbility? wifiAbility,
}) => WiFiDetails(
  wiFiAdditional: wiFiAdditional ?? _wiFiAdditional,
  wiFiIdentifier: wiFiIdentifier ?? _wiFiIdentifier,
  wiFiSecurity: wiFiSecurity ?? _wiFiSecurity,
  wiFiSignal: wiFiSignal ?? _wiFiSignal,
  wifiAbility: wifiAbility ?? _wifiAbility,
);
  WiFiAdditional? get wiFiAdditional => _wiFiAdditional;
  WiFiIdentifier? get wiFiIdentifier => _wiFiIdentifier;
  WiFiSecurity? get wiFiSecurity => _wiFiSecurity;
  WiFiSignal? get wiFiSignal => _wiFiSignal;
  WifiAbility? get wifiAbility => _wifiAbility;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (_wiFiAdditional != null) {
      map['wiFiAdditional'] = _wiFiAdditional?.toJson();
    }
    if (_wiFiIdentifier != null) {
      map['wiFiIdentifier'] = _wiFiIdentifier?.toJson();
    }
    if (_wiFiSecurity != null) {
      map['wiFiSecurity'] = _wiFiSecurity?.toJson();
    }
    if (_wiFiSignal != null) {
      map['wiFiSignal'] = _wiFiSignal?.toJson();
    }
    if (_wifiAbility != null) {
      map['wifiAbility'] = _wifiAbility?.toJson();
    }
    return map;
  }

}
/// channelDisplay : "3"
/// distance : "~439.9m"
/// width : "(20MHz)"

class WifiAbility {
  WifiAbility({
    String? channelDisplay,
    String? distance,
    String? width,}){
    _channelDisplay = channelDisplay;
    _distance = distance;
    _width = width;
  }

  WifiAbility.fromJson(dynamic json) {
    _channelDisplay = json['channelDisplay'];
    _distance = json['distance'];
    _width = json['width'];
  }
  String? _channelDisplay;
  String? _distance;
  String? _width;
  WifiAbility copyWith({  String? channelDisplay,
    String? distance,
    String? width,
  }) => WifiAbility(  channelDisplay: channelDisplay ?? _channelDisplay,
    distance: distance ?? _distance,
    width: width ?? _width,
  );
  String? get channelDisplay => _channelDisplay;
  String? get distance => _distance;
  String? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelDisplay'] = _channelDisplay;
    map['distance'] = _distance;
    map['width'] = _width;
    return map;
  }

}
/// centerFrequency : 2437
/// is80211mc : false
/// level : -90
/// primaryFrequency : 2437
/// timestamp : 972886570373
/// wiFiBand : "GHZ2"
/// wiFiStandard : "AX"
/// wiFiWidth : "MHZ_20"

class WiFiSignal {
  WiFiSignal({
      num? centerFrequency, 
      bool? is80211mc, 
      num? level, 
      num? primaryFrequency, 
      num? timestamp, 
      String? wiFiBand, 
      String? wiFiStandard, 
      String? wiFiWidth,}){
    _centerFrequency = centerFrequency;
    _is80211mc = is80211mc;
    _level = level;
    _primaryFrequency = primaryFrequency;
    _timestamp = timestamp;
    _wiFiBand = wiFiBand;
    _wiFiStandard = wiFiStandard;
    _wiFiWidth = wiFiWidth;
}

  WiFiSignal.fromJson(dynamic json) {
    _centerFrequency = json['centerFrequency'];
    _is80211mc = json['is80211mc'];
    _level = json['level'];
    _primaryFrequency = json['primaryFrequency'];
    _timestamp = json['timestamp'];
    _wiFiBand = json['wiFiBand'];
    _wiFiStandard = json['wiFiStandard'];
    _wiFiWidth = json['wiFiWidth'];
  }
  num? _centerFrequency;
  bool? _is80211mc;
  num? _level;
  num? _primaryFrequency;
  num? _timestamp;
  String? _wiFiBand;
  String? _wiFiStandard;
  String? _wiFiWidth;
WiFiSignal copyWith({  num? centerFrequency,
  bool? is80211mc,
  num? level,
  num? primaryFrequency,
  num? timestamp,
  String? wiFiBand,
  String? wiFiStandard,
  String? wiFiWidth,
}) => WiFiSignal(  centerFrequency: centerFrequency ?? _centerFrequency,
  is80211mc: is80211mc ?? _is80211mc,
  level: level ?? _level,
  primaryFrequency: primaryFrequency ?? _primaryFrequency,
  timestamp: timestamp ?? _timestamp,
  wiFiBand: wiFiBand ?? _wiFiBand,
  wiFiStandard: wiFiStandard ?? _wiFiStandard,
  wiFiWidth: wiFiWidth ?? _wiFiWidth,
);
  num? get centerFrequency => _centerFrequency;
  bool? get is80211mc => _is80211mc;
  num? get level => _level;
  num? get primaryFrequency => _primaryFrequency;
  num? get timestamp => _timestamp;
  String? get wiFiBand => _wiFiBand;
  String? get wiFiStandard => _wiFiStandard;
  String? get wiFiWidth => _wiFiWidth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['centerFrequency'] = _centerFrequency;
    map['is80211mc'] = _is80211mc;
    map['level'] = _level;
    map['primaryFrequency'] = _primaryFrequency;
    map['timestamp'] = _timestamp;
    map['wiFiBand'] = _wiFiBand;
    map['wiFiStandard'] = _wiFiStandard;
    map['wiFiWidth'] = _wiFiWidth;
    return map;
  }

}

/// capabilities : "[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS][WPS]"
/// securityTypes : []

class WiFiSecurity {
  WiFiSecurity({
      String? capabilities, 
      List<dynamic>? securityTypes,}){
    _capabilities = capabilities;
}

  WiFiSecurity.fromJson(dynamic json) {
    _capabilities = json['capabilities'];
  }
  String? _capabilities;
  List<dynamic>? _securityTypes;
WiFiSecurity copyWith({  String? capabilities,
  List<dynamic>? securityTypes,
}) => WiFiSecurity(  capabilities: capabilities ?? _capabilities,
);
  String? get capabilities => _capabilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['capabilities'] = _capabilities;
    return map;
  }

}


/// vendorName : ""
/// wiFiConnection : {"ipAddress":"","linkSpeed":-1,"wiFiIdentifier":{"bssid":"","ssid":"*hidden*","ssidRaw":""}}

class WiFiAdditional {
  WiFiAdditional({
      String? vendorName, 
      WiFiConnection? wiFiConnection,}){
    _vendorName = vendorName;
    _wiFiConnection = wiFiConnection;
}

  WiFiAdditional.fromJson(dynamic json) {
    _vendorName = json['vendorName'];
    _wiFiConnection = json['wiFiConnection'] != null ? WiFiConnection.fromJson(json['wiFiConnection']) : null;
  }
  String? _vendorName;
  WiFiConnection? _wiFiConnection;
WiFiAdditional copyWith({  String? vendorName,
  WiFiConnection? wiFiConnection,
}) => WiFiAdditional(  vendorName: vendorName ?? _vendorName,
  wiFiConnection: wiFiConnection ?? _wiFiConnection,
);
  String? get vendorName => _vendorName;
  WiFiConnection? get wiFiConnection => _wiFiConnection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vendorName'] = _vendorName;
    if (_wiFiConnection != null) {
      map['wiFiConnection'] = _wiFiConnection?.toJson();
    }
    return map;
  }

}




/// ipAddress : "192.168.0.100"
/// linkSpeed : 72
/// wiFiIdentifier : {"bssid":"c0:25:e9:69:29:36","ssid":"Deltin Royal","ssidRaw":"Deltin Royal"}

class WiFiConnection {
  WiFiConnection({
      String? ipAddress, 
      num? linkSpeed, 
      WiFiIdentifier? wiFiIdentifier,}){
    _ipAddress = ipAddress;
    _linkSpeed = linkSpeed;
    _wiFiIdentifier = wiFiIdentifier;
}

  WiFiConnection.fromJson(dynamic json) {
    _ipAddress = json['ipAddress'];
    _linkSpeed = json['linkSpeed'];
    _wiFiIdentifier = json['wiFiIdentifier'] != null ? WiFiIdentifier.fromJson(json['wiFiIdentifier']) : null;
  }
  String? _ipAddress;
  num? _linkSpeed;
  WiFiIdentifier? _wiFiIdentifier;
WiFiConnection copyWith({  String? ipAddress,
  num? linkSpeed,
  WiFiIdentifier? wiFiIdentifier,
}) => WiFiConnection(  ipAddress: ipAddress ?? _ipAddress,
  linkSpeed: linkSpeed ?? _linkSpeed,
  wiFiIdentifier: wiFiIdentifier ?? _wiFiIdentifier,
);
  String? get ipAddress => _ipAddress;
  num? get linkSpeed => _linkSpeed;
  WiFiIdentifier? get wiFiIdentifier => _wiFiIdentifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ipAddress'] = _ipAddress;
    map['linkSpeed'] = _linkSpeed;
    if (_wiFiIdentifier != null) {
      map['wiFiIdentifier'] = _wiFiIdentifier?.toJson();
    }
    return map;
  }

}

/// bssid : "c0:25:e9:69:29:36"
/// ssid : "Deltin Royal"
/// ssidRaw : "Deltin Royal"

class WiFiIdentifier {
  WiFiIdentifier({
      String? bssid, 
      String? ssid, 
      String? ssidRaw,}){
    _bssid = bssid;
    _ssid = ssid;
    _ssidRaw = ssidRaw;
}

  WiFiIdentifier.fromJson(dynamic json) {
    _bssid = json['bssid'];
    _ssid = json['ssid'];
    _ssidRaw = json['ssidRaw'];
  }
  String? _bssid;
  String? _ssid;
  String? _ssidRaw;
WiFiIdentifier copyWith({  String? bssid,
  String? ssid,
  String? ssidRaw,
}) => WiFiIdentifier(  bssid: bssid ?? _bssid,
  ssid: ssid ?? _ssid,
  ssidRaw: ssidRaw ?? _ssidRaw,
);
  String? get bssid => _bssid;
  String? get ssid => _ssid;
  String? get ssidRaw => _ssidRaw;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bssid'] = _bssid;
    map['ssid'] = _ssid;
    map['ssidRaw'] = _ssidRaw;
    return map;
  }

}
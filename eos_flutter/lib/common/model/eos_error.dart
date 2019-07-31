class EosError {
  int _code;
  String _message;
  Error _error;

  EosError({int code, String message, Error error}) {
    this._code = code;
    this._message = message;
    this._error = error;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;
  Error get error => _error;
  set error(Error error) => _error = error;

  EosError.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    if (this._error != null) {
      data['error'] = this._error.toJson();
    }
    return data;
  }
}

class Error {
  int _code;
  String _name;
  String _what;
  List<Details> _details;

  Error({int code, String name, String what, List<Details> details}) {
    this._code = code;
    this._name = name;
    this._what = what;
    this._details = details;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;
  String get what => _what;
  set what(String what) => _what = what;
  List<Details> get details => _details;
  set details(List<Details> details) => _details = details;

  Error.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _name = json['name'];
    _what = json['what'];
    if (json['details'] != null) {
      _details = new List<Details>();
      json['details'].forEach((v) {
        _details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['name'] = this._name;
    data['what'] = this._what;
    if (this._details != null) {
      data['details'] = this._details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String _message;
  String _file;
  int _lineNumber;
  String _method;

  Details({String message, String file, int lineNumber, String method}) {
    this._message = message;
    this._file = file;
    this._lineNumber = lineNumber;
    this._method = method;
  }

  String get message => _message;
  set message(String message) => _message = message;
  String get file => _file;
  set file(String file) => _file = file;
  int get lineNumber => _lineNumber;
  set lineNumber(int lineNumber) => _lineNumber = lineNumber;
  String get method => _method;
  set method(String method) => _method = method;

  Details.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _file = json['file'];
    _lineNumber = json['line_number'];
    _method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['file'] = this._file;
    data['line_number'] = this._lineNumber;
    data['method'] = this._method;
    return data;
  }
}

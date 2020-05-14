class Global {
  static dynamic data;

  static set(String key, dynamic val) {
    data[key] = val;
  }

  static get(String key) {
    return data[key];
  }
}

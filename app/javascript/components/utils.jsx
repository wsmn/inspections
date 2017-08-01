class Utils {
  static postRequest(token, params) {
    return {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': token,
      },
      body: JSON.stringify(params),
      credentials: 'same-origin',
    };
  }
}

export default Utils;

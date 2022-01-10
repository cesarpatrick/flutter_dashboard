class Variables {
  static String prod() {
    return 'https://rdltr.com:8999/';
  }

  static String beta() {
    return 'https://beta.rdltr.com/';
  }

  static String baseUrl() {
    return prod();
    // return beta();
  }

  static String getAuthUrl() {
    return baseUrl() + 'rdl-report-ws/ws/auth';
  }

  static String getLocationUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/location';
  }

  static String getUploadUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/upload';
  }

  static String getRunUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/run';
  }

  static String getTruckUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/trucks';
  }

  static String getRosterUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/roster';
  }

  static String getReportUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/report';
  }

  static String getImageEndpoint(String fileId, String uz) {
    return baseUrl() +
        'rdlops/rubbishdirectops/DocumentManager?a=get-file&fid=' +
        fileId +
        '&uz=' +
        uz;
  }
}

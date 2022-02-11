class Variables {
  static String prod() {
    return 'https://rdltr.com:8999/';
  }

  static String beta() {
    return 'https://beta.rdltr.com/';
  }

  static String localhost() {
    return 'http://localhost:8880/RDLWebService/ws/';
  }

  static String baseUrl() {
    return prod();
  }

  static String getAuthUrl() {
    return baseUrl() + 'rdl-report-ws/ws/auth';
  }

  static String getWorkshopStatusUrl() {
    return baseUrl() + 'rdl-report-ws/ws/report/workshopstatus';
  }

  static String getTruckIssuesUrl() {
    return baseUrl() + 'rdl-report-ws/ws/cache/truckissuetypes';
  }

  static String getTruckIssuesCategoriesUrl() {
    return baseUrl() + 'rdl-report-ws/ws/cache/truckissuecategories';
  }

  static String getTruckIssuesListUrl() {
    return baseUrl() + 'rdl-pictures-ws2/ws/trucks/issue/all';
  }

  static String getTruckListUrl() {
    return baseUrl() + 'rdl-report-ws/ws/cache/trucks';
  }

  static String getTruckIssuesRCAListUrl() {
    return baseUrl() + 'rdlws51/ws/trucks/issue/status/list';
  }
}

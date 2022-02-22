class Variables {
  static String prod() {
    return 'https://rdltr.com:8999/RDLWebService/ws/';
  }

  static String beta() {
    return 'https://beta.rdltr.com/';
  }

  static String localhost() {
    return 'http://localhost:8880/RDLWebService/ws/';
  }

  static String baseUrl() {
    return localhost();
  }

  static String getAuthUrl() {
    return baseUrl() + 'auth';
  }

  static String getWorkshopStatusUrl() {
    return baseUrl() + 'report/workshopstatus/';
  }

  static String getTruckIssuesUrl() {
    return baseUrl() + 'cache/truckissuetype/';
  }

  static String getTruckIssuesCategoriesUrl() {
    return baseUrl() + 'cache/truckissuecategories/';
  }

  static String getTruckIssuesType() {
    return baseUrl() + 'cache/truckissuetype/';
  }

  static String getTruckIssuesTypeList() {
    return baseUrl() + 'cache/truckissuetypes/';
  }

  static String getTruckIssuesListUrl() {
    return baseUrl() + 'trucks/issue/all/';
  }

  static String getTruckListUrl() {
    return baseUrl() + 'cache/trucks/';
  }

  static String getTruckIssuesRCAListUrl() {
    return baseUrl() + 'trucks/issue/status/list/';
  }

  static String getTruckIssuesRCAUrl() {
    return baseUrl() + 'trucks/issue/status/';
  }

  static String getWebuserUrl() {
    return baseUrl() + 'webuser/';
  }

  //Form Template Urls

  static String getTemplateListUrl() {
    return baseUrl() + 'formTemplate/list/';
  }

  static String getTemplateListFilterUrl() {
    return baseUrl() + 'formTemplate/filter/';
  }

  //Form Record Urls

  static String getFormRecordSaveUrl() {
    return baseUrl() + 'formRecords/save/';
  }

  //Run Status Urls

  static String getRunStatusUrl() {
    return baseUrl() + 'report/runstatus/';
  }

  // Depot Dahsboard
  static String getDepotDashboardInfo() {
    return baseUrl() + 'depotDashboard/';
  }

  static String getDepotDashboardSave() {
    return baseUrl() + 'depotDashboard/save/';
  }
}

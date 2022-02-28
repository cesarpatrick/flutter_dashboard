import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

const blackTextStyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

const String API_KEY = "7a11c629-38a0-484b-86b0-a706bb1b4da0";

const String WORKSHOP_STATUS_ENDPOINT =
    "https://rdltr.com:8999/rdl-report-ws/ws/report/workshopstatus/";

const String TRUCK_ISSUES_TYPES_ENDPOINT =
    "https://rdltr.com:8999/rdl-report-ws/ws/cache/truckissuetypes";

const String TRUCK_ISSUES_CATEGORIES_ENDPOINT =
    "https://rdltr.com:8999/rdl-report-ws/ws/cache/truckissuecategories";

const String TRUCK_ISSUES_LIST_ENDPOINT =
    "https://rdltr.com:8999/rdl-pictures-ws2/ws/trucks/issue/all/";

const String TRUCK_LIST_ENDPOINT =
    "https://rdltr.com:8999/rdl-report-ws/ws/cache/trucks/";

const String TRUCK_ISSUES_RCA_LIST_ENDPOINT =
    "https://rdltr.com:8999/rdlws51/ws/trucks/issue/status/list/";

//ROUTES
const String LOGIN_ROUTE = "/";
const String DASHBOARD_ROUTE = "/dashboard";
const String INVENTORY_ROUTE = "/inventory";

const String DEPOT_ROUTE = "/depot";
const String DEPOT_CHECKLIST_ROUTE = DEPOT_ROUTE + "/checklist";
const String DEPOT_REPORTS_ROUTE = DEPOT_ROUTE + "/reports";

//QUESTION TYPES
const String INPUT_TEXT = "Input";
const String SWITCH = "Switch";
const String CHECKBOX_INPUT = "Checkbox";
const String SELECT_INPUT = "Select";
const String TEXT_AREA_INPUT = "TextArea";
const String RADIO_BUTTON_INPUT = "RadioButton";

//DEPARTAMENTS
const String IT = "INFORMATION TECHNOLOGY";
const String HR = "HUMAN RESOURCES";
const String WORKSHOP = "WORKSHOP";
const String OPERATIONS = "OPERATIONS";
const String DEPOT = "DEPOT";

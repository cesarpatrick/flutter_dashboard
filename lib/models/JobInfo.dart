class JobInfo {
  final String? icon,
      truck,
      date,
      driver,
      issueType,
      message,
      note,
      truckRequested,
      category,
      rca,
      updated,
      id;

  JobInfo(
      {this.icon,
      this.truck,
      this.date,
      this.driver,
      this.issueType,
      this.message,
      this.category,
      this.note,
      this.rca,
      this.truckRequested,
      this.updated,
      this.id});
}

List demoJobs = [
  JobInfo(
      icon: "assets/icons/truck-icon.svg",
      truck: "NSQ810",
      date: "01-03-2021",
      driver: "Hermann",
      issueType: "Remote Problem",
      message: "Engine can't start again. Max",
      category: "General",
      note: "Inspection and Repairs.",
      rca: "Not Classified",
      truckRequested: "20/12/2021 16:00 - 20/12/2021 20:00",
      updated: "17/12/2021 09:45 (rdlworkshop)")
];

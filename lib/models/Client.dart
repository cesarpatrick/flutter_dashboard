class Client {
  final int clientId;
  final String clientName;
  final int order;

  Client(this.clientId, this.clientName, this.order);

  factory Client.fromJson(Map<String, dynamic> json) {
    var clientId = json['clientId'];
    String clientName = json['clientName'];
    int order = json['order'];
    return Client(clientId, clientName, order);
  }
}

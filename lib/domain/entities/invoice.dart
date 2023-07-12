class Invoice {
    final int? amount;
    final String? currency;
    final String? id;
    final String? invoiceNumber;
    final String? status;
    final String? submittedByUserId;
    final DateTime? submittedDate;
    final String? type;

    Invoice({
        this.amount,
        this.currency,
        this.id,
        this.invoiceNumber,
        this.status,
        this.submittedByUserId,
        this.submittedDate,
        this.type,
    });

    factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        amount: json["amount"],
        currency: json["currency"],
        id: json["id"],
        invoiceNumber: json["invoiceNumber"],
        status: json["status"],
        submittedByUserId: json["submittedByUserId"],
        submittedDate: json["submittedDate"] == null ? null : DateTime.parse(json["submittedDate"]),
        type: json["type"],
    );
}
package Model;

import java.util.Date;

public class TransactionModel {
    private int id;
    private Date transactionDate;
    private String jobTitle;
    private double amount;
    private String status;
    private String utrNumber;
    private String paymentScreenshot;
    private int clientId;

    public TransactionModel() {}

    public TransactionModel(int id, Date transactionDate, String jobTitle, double amount, String status, String utrNumber, String paymentScreenshot, int clientId) {
        this.id = id;
        this.transactionDate = transactionDate;
        this.jobTitle = jobTitle;
        this.amount = amount;
        this.status = status;
        this.utrNumber = utrNumber;
        this.paymentScreenshot = paymentScreenshot;
        this.clientId = clientId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUtrNumber() {
        return utrNumber;
    }

    public void setUtrNumber(String utrNumber) {
        this.utrNumber = utrNumber;
    }

    public String getPaymentScreenshot() {
        return paymentScreenshot;
    }

    public void setPaymentScreenshot(String paymentScreenshot) {
        this.paymentScreenshot = paymentScreenshot;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
}

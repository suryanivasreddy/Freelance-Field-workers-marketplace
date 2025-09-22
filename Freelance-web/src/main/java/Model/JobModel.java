package Model;

import java.util.Date;

public class JobModel {
    private int id;
    private String jobTitle;
    private String jobDescription;
    private String location;
    private String workType;
    private String payType;
    private double budget;
    private Date deadline;
    private int clientId;

    public JobModel() {}

    public JobModel(int id, String jobTitle, String jobDescription, String location, String workType, String payType, double budget, Date deadline, int clientId) {
        this.id = id;
        this.jobTitle = jobTitle;
        this.jobDescription = jobDescription;
        this.location = location;
        this.workType = workType;
        this.payType = payType;
        this.budget = budget;
        this.deadline = deadline;
        this.clientId = clientId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public Date getDeadline() {
        return deadline;
    }

    @Override
	public String toString() {
		return "JobModel [id=" + id + ", jobTitle=" + jobTitle + ", jobDescription=" + jobDescription + ", location="
				+ location + ", workType=" + workType + ", payType=" + payType + ", budget=" + budget + ", deadline="
				+ deadline + ", clientId=" + clientId + "]";
	}

	public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
}

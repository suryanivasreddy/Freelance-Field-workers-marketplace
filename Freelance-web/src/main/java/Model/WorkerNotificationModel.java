package Model;

public class WorkerNotificationModel {
    private int notificationId;
    private int workerId;
    private int jobId;
    private String notificationMessage;
    private String status;

    public WorkerNotificationModel() {}

    public WorkerNotificationModel(int notificationId, int workerId, int jobId, String notificationMessage, String status) {
        this.notificationId = notificationId;
        this.workerId = workerId;
        this.jobId = jobId;
        this.notificationMessage = notificationMessage;
        this.status = status;
    }

    // Getters and Setters
    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public int getWorkerId() {
        return workerId;
    }

    public void setWorkerId(int workerId) {
        this.workerId = workerId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getNotificationMessage() {
        return notificationMessage;
    }

    public void setNotificationMessage(String notificationMessage) {
        this.notificationMessage = notificationMessage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

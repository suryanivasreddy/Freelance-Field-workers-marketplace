package Model;

public class ReviewModel {
    private int id;
    private int rating;
    private String reviewText;
    private int clientId;
    private int workerId;

    public ReviewModel() {}

    public ReviewModel(int id, int rating, String reviewText, int clientId, int workerId) {
        this.id = id;
        this.rating = rating;
        this.reviewText = reviewText;
        this.clientId = clientId;
        this.workerId = workerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getWorkerId() {
        return workerId;
    }

    public void setWorkerId(int workerId) {
        this.workerId = workerId;
    }
}

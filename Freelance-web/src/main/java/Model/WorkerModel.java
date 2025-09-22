package Model;

/**
 * Model class for Worker entity.
 */
public class WorkerModel {
    private int userId;
    private String name;
    private String jobRole;
    private String email;
    private String phone;
    private String location;
    private String joiningDate;
    private String skills;

    // Default constructor
    public WorkerModel() {}

    // Parameterized constructor
    public WorkerModel(int userId, String name, String jobRole, String email, String phone,
                       String location, String joiningDate, String skills) {
        this.userId = userId;
        this.name = name;
        this.jobRole = jobRole;
        this.email = email;
        this.phone = phone;
        this.location = location;
        this.joiningDate = joiningDate;
        this.skills = skills;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJobRole() {
        return jobRole;
    }

    public void setJobRole(String jobRole) {
        this.jobRole = jobRole;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(String joiningDate) {
        this.joiningDate = joiningDate;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    @Override
    public String toString() {
        return "WorkerModel{" +
                "userId=" + userId +
                ", name='" + name + '\'' +
                ", jobRole='" + jobRole + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", location='" + location + '\'' +
                ", joiningDate='" + joiningDate + '\'' +
                ", skills='" + skills + '\'' +
                '}';
    }
}

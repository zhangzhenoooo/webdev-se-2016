package cn.edu.nxu.it.DTO;

public class MyClassDTO {
    private Long classId;
    private String title;
    private String latestUpdated;

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLatestUpdated() {
        return latestUpdated;
    }

    public void setLatestUpdated(String latestUpdated) {
        this.latestUpdated = latestUpdated;
    }
}

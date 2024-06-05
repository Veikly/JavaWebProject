package cdu.model;
// 用户状态枚举
public enum UserStatus {
    NORMAL("正常"),
    FREEZE("冻结"),
    UNKNOWN("异常"),
    ALL("");
    private String name;
    UserStatus(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    @Override
    public String toString() {
        return name;
    }
}
package cdu.model;
//订单状态枚举
public enum OrderStatus {
    UNKNOWN("异常"),
    UNPAID("未付款"),
    PAID("已付款"),
    SHIPPED("已发货"),
    FINISHED("已完成"),
    CANCEL("已取消"),
    ALL("");
    OrderStatus(String name) {
        this.name = name;
    }
    private String name;
    public String getName() {
        return name;
    }
    @Override
    public String toString() {
        return name;
    }
}
package cdu.service;
import cdu.model.Customer;
import cdu.model.User;
import cdu.model.UserStatus;
import java.util.List;
public interface CustomerService {
    // 获取指定id的顾客
    Customer get(int id);
    // 查找顾客，用于登录
    Customer get(User user);
    // 分页模糊查找顾客列表
    List<Customer> get(Customer condition, int page, int pageSize);
    // 获取模糊查询顾客的记录数
    int count(Customer condition);
    // 顾客注册
    boolean register(Customer customer);
    // 重置顾客登录密码
    boolean resetPwd(int id);
    // 更新顾客最后一次访问时间
    boolean modAccessTime(Customer customer);
    // 修改顾客账户状态
    boolean modStatus(int id, UserStatus status);
    // 检查顾客账户状态
    boolean checkStatus(Customer customer);
    // 修改顾客
    // boolean mod(Customer customer);
    // 删除顾客
    // boolean del(int id);
}
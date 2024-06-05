package cdu.service;
import cdu.model.AdminUser;
import cdu.model.User;
import cdu.model.UserStatus;
import java.util.List;
public interface AdminUserService {
    // 获取指定id的管理员用户
    AdminUser get(int id);
    // 查找管理员用户，用于登录验证
    AdminUser get(User user);
    // 分页模糊查询管理员用户列表
    List<AdminUser> get(AdminUser condition, int page, int pageSize);
    // 获取查询管理员数量
    int count(AdminUser condition);
    // 添加管理员用户
    boolean add(AdminUser adminUser);
    // 修改管理员用户
    boolean mod(AdminUser adminUser);
    // 重置管理员用户登录密码
    boolean resetPwd(int id);
    // 修改管理员用户状态
    boolean modStatus(int id, UserStatus status);
    // 检查管理员用户状态是否正常
    boolean isNormal(AdminUser adminUser);
    // 删除管理员用户
    boolean del(int id);
}
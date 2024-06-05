package cdu.service.impl;
import cdu.dao.AdminUserDao;
import cdu.dao.impl.AdminUserDaoImpl;
import cdu.model.AdminUser;
import cdu.model.User;
import cdu.model.UserStatus;
import cdu.service.AdminUserService;
import cdu.util.Encrypt;
import java.util.Date;
import java.util.List;
public class AdminUserServiceImpl implements AdminUserService {
    AdminUserDao adminUserDao = new AdminUserDaoImpl();
    @Override
    public AdminUser get(int id) {
        return adminUserDao.findById(id);
    }
    @Override
    public AdminUser get(User user) {
        if (user == null) {
            return null;
        }
        AdminUser adminUser = adminUserDao.find(user.getName(), Encrypt.toMd5(user.getPassword()));
        if (adminUser != null) {
            adminUser.setLastAccessTime(new Date());
            adminUserDao.updateAccessTime(adminUser);
        }
        return adminUser;
    }
    @Override
    public List<AdminUser> get(AdminUser condition, int page, int pageSize) {
        return adminUserDao.query(condition, (page - 1) * pageSize, pageSize);
    }
    @Override
    public int count(AdminUser condition) {
        return adminUserDao.count(condition);
    }
    @Override
    public boolean add(AdminUser adminUser) {
        adminUser.setPassword(Encrypt.toMd5(adminUser.getPassword()));
        adminUser.setStatus(UserStatus.NORMAL);
        return adminUserDao.insert(adminUser) == 1;
    }
    @Override
    public boolean mod(AdminUser adminUser) {
        return adminUserDao.update(adminUser) == 1;
    }
    @Override
    public boolean resetPwd(int id) {
        String newPwd = Encrypt.toMd5("123");
        return adminUserDao.updatePwd(id, newPwd) == 1;
    }
    @Override
    public boolean modStatus(int id, UserStatus status) {
        return adminUserDao.updateStatus(id, status.getName()) == 1;
    }
    @Override
    public boolean isNormal(AdminUser adminUser) {
        return adminUser.getStatus() == UserStatus.NORMAL;
    }
    @Override
    public boolean del(int id) {
        return adminUserDao.delete(id) == 1;
    }
}
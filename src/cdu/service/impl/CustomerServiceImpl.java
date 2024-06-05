package cdu.service.impl;
import cdu.dao.CustomerDao;
import cdu.dao.impl.CustomerDaoImpl;
import cdu.model.Customer;
import cdu.model.User;
import cdu.model.UserStatus;
import cdu.service.CustomerService;
import cdu.util.Encrypt;
import java.util.Date;
import java.util.List;
public class CustomerServiceImpl implements CustomerService {
    CustomerDao customerDao = new CustomerDaoImpl();
    @Override
    public Customer get(int id) {
        return (Customer) customerDao.findById(id);
    }
    @Override
    public Customer get(User user) {
        if (user == null) {
            return null;
        }
        Customer customer = customerDao.find(user.getName(), Encrypt.toMd5(user.getPassword()));
        if (customer != null) {
            customer.setLastAccessTime(new Date());
            customerDao.updateAccessTime(customer);
        }
        return customer;
    }
    @Override
    public List<Customer> get(Customer condition, int page, int pageSize) {
        return customerDao.query(condition, (page - 1) * pageSize, pageSize);
    }
    @Override
    public int count(Customer condition) {
        return customerDao.count(condition);
    }
    @Override
    public boolean register(Customer customer) {
        customer.setPassword(Encrypt.toMd5(customer.getPassword()));
        customer.setStatus(UserStatus.NORMAL);
        return customerDao.insert(customer) == 1;
    }
    @Override
    public boolean resetPwd(int id) {
        String newPwd = Encrypt.toMd5("123");
        return customerDao.updatePwd(id, newPwd) == 1;
    }
    @Override
    public boolean modAccessTime(Customer customer) {
        customer.setLastAccessTime(new Date().getTime());
        return customerDao.updateAccessTime(customer) == 1;
    }
    @Override
    public boolean modStatus(int id, UserStatus status) {
        return customerDao.updateStatus(id, status.getName()) == 1;
    }
    @Override
    public boolean checkStatus(Customer customer) {
        if (customer.getStatus() != null && customer.getStatus() == UserStatus.NORMAL) {
            return true;
        }
        return false;
    }
}
package cdu.dao.impl;
import cdu.dao.BaseDao;
import cdu.dao.CustomerDao;
import cdu.model.Customer;
import cdu.model.UserStatus;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class CustomerDaoImpl extends BaseDao implements CustomerDao {
    @Override
    public Customer find(String name, String password) {
        Customer customer = null;
        String sql = "SELECT * FROM customer_table WHERE name=? AND password=?";
        System.out.println("DAO验证顾客query(name,pwd) : " + sql);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPassword(rs.getString("password"));
                customer.setCreateTime(rs.getLong("createTime"));
                customer.setLastAccessTime(rs.getLong("lastAccessTime"));
                customer.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            System.out.println("DAO验证顾客出错：" + sql + "," + e.getMessage());
        }
        return customer;
    }
    @Override
    public Customer findById(int id) {
        Customer customer = null;
        String sql = "SELECT * FROM customer_table WHERE id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPassword(rs.getString("password"));
                customer.setCreateTime(rs.getLong("createTime"));
                customer.setLastAccessTime(rs.getLong("lastAccessTime"));
                customer.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            System.out.println("DAO查找顾客出错：" + sql + "," + e.getMessage());
        }
        return customer;
    }
    @Override
    public List<Customer> query(Customer condition) {
        List<Customer> customerList = new ArrayList<>();
        String sql = "SELECT * FROM customer_table";
        if (condition != null) {
            sql += " WHERE 1=1";
            if (condition.getId() != 0) {
                sql += " AND id='" + condition.getId() + "'";
            }
            if (condition.getName() != null && !condition.getName().isEmpty()) {
                sql += " AND name LIKE '%" + condition.getName() + "%'";
            }
            if (condition.getStatus() != null && condition.getStatus() != UserStatus.ALL) {
                sql += " AND status='" + condition.getStatus().getName() + "'";
            }
        }
        sql += " ORDER BY id DESC";
        System.out.println("DAO查询find(condition) : " + sql);
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPassword(rs.getString("password"));
                customer.setCreateTime(rs.getLong("createTime"));
                customer.setLastAccessTime(rs.getLong("lastAccessTime"));
                customer.setStatus(rs.getString("status"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("DAO查询顾客出错：" + sql + "," + e.getMessage());
        }
        return customerList;
    }
    @Override
    public List<Customer> query(Customer condition, int start, int num) {
        List<Customer> customerList = new ArrayList<>();
        String sql = "SELECT * FROM customer_table";
        if (condition != null) {
            sql += " WHERE 1=1";
            if (condition.getId() != 0) {
                sql += " AND id='" + condition.getId() + "'";
            }
            if (condition.getName() != null && !condition.getName().isEmpty()) {
                sql += " AND name LIKE '%" + condition.getName() + "%'";
            }
            if (condition.getStatus() != null && condition.getStatus() != UserStatus.ALL) {
                sql += " AND status='" + condition.getStatus().getName() + "'";
            }
        }
        sql += " ORDER BY id DESC LIMIT ?,?";
        System.out.println("DAO查询find(condition, start, num) : " + sql);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, num);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPassword(rs.getString("password"));
                customer.setCreateTime(rs.getLong("createTime"));
                customer.setLastAccessTime(rs.getLong("lastAccessTime"));
                customer.setStatus(rs.getString("status"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("DAO查询顾客出错：" + sql + "," + e.getMessage());
        }
        return customerList;
    }
    @Override
    public int insert(Customer customer) {
        int rows = 0;
        String sql = "INSERT INTO customer_table(name,password,createTime,status) VALUES(?,?,?,?) ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, customer.getName());
            pstmt.setString(2, customer.getPassword());
            pstmt.setLong(3, new Date().getTime());
            pstmt.setString(4, customer.getStatus().getName());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DAO添加顾客出错：" + sql + "," + e.getMessage());
        }
        return rows;
    }
    @Override
    public int update(Customer customer) {
        return 0;
    }
    @Override
    public int updateAccessTime(Customer customer) {
        int rows = 0;
        String sql = "UPDATE customer_table SET lastAccessTime=? WHERE id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, customer.getLastAccessTime());
            pstmt.setInt(2, customer.getId());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DAO修改顾客出错：" + sql + "," + e.getMessage());
        }
        return rows;
    }
    @Override
    public int updatePwd(int id, String newPwd) {
        int rows = 0;
        String sql = "UPDATE customer_table SET password=? WHERE id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPwd);
            pstmt.setInt(2, id);
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DAO重置顾客密码出错：" + sql + "," + e.getMessage());
        }
        return rows;
    }
    @Override
    public int updateStatus(int id, String status) {
        int rows = 0;
        String sql = "UPDATE customer_table SET status=? WHERE id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DAO修改顾客状态出错：" + sql + "," + e.getMessage());
        }
        return rows;
    }
    @Override
    public int delete(int id) {
        int rows = 0;
        String sql = "DELETE FROM customer_table WHERE id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DAO删除顾客出错：" + sql + "," + e.getMessage());
        }
        return rows;
    }
    @Override
    public int count() {
        return count(null);
    }
    @Override
    public int count(Customer condition) {
        int num = 0;
        String sql = "SELECT count(*)  FROM customer_table WHERE 1=1";
        if (condition != null) {
            if (condition.getId() != 0) {
                sql += " AND id='" + condition.getId() + "'";
            }
            if (condition.getName() != null && !condition.getName().isEmpty()) {
                sql += " AND name LIKE '%" + condition.getName() + "%'";
            }
            if (condition.getStatus() != null && condition.getStatus() != UserStatus.ALL) {
                sql += " AND status='" + condition.getStatus().getName() + "'";
            }
        }
        System.out.println("DAO查询count(con): " + sql);
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("DAO查询顾客数量出错：" + sql + "," + e.getMessage());
        }
        return num;
    }
}
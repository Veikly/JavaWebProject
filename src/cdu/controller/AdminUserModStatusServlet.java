package cdu.controller;
import cdu.model.User;
import cdu.model.UserStatus;
import cdu.service.AdminUserService;
import cdu.service.CustomerService;
import cdu.service.impl.AdminUserServiceImpl;
import cdu.service.impl.CustomerServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//后台：修改管理员用户的状态
@WebServlet(urlPatterns = {"/admin/adminUser/freeze", "/admin/adminUser/active"})
public class AdminUserModStatusServlet extends HttpServlet {
    AdminUserService adminUserService = new AdminUserServiceImpl();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid != null && !sid.equals("")) {
            int id = Integer.parseInt(sid);
            if (req.getServletPath().contains("freeze")) {
                //冻结
                adminUserService.modStatus(id, UserStatus.FREEZE);
            } else if (req.getServletPath().contains("active")) {
                //解冻
                adminUserService.modStatus(id, UserStatus.NORMAL);
            } else {
                //异常
                adminUserService.modStatus(id, UserStatus.UNKNOWN);
            }
        }
        //重定向到管理员用户列表界面
        resp.sendRedirect("list");
    }
}
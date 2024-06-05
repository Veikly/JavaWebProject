package cdu.controller;
import cdu.model.Order;
import cdu.service.OrderService;
import cdu.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
// 前台：顾客查看订单详情
// 后台：管理员查看订单详情
@WebServlet(urlPatterns = {"/customer/order/info", "/admin/order/info"})
public class OrderInfoServlet extends HttpServlet {
    OrderService orderService = new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        // 调用服务层方法获取订单
        Order order = orderService.get(orderId);
        // 将订单保存至请求范围内
        req.setAttribute("order", order);
        // 请求转发至订单详情页面
        req.getRequestDispatcher("info.do").forward(req, resp);
    }
}
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
import java.util.List;
//前台：顾客查看自己的订单历史
//后台：管理员模糊查询、管理订单列表
@WebServlet(urlPatterns = {"/admin/order/list", "/admin/order/query", "/customer/order/list"})
public class OrderListServlet extends HttpServlet {
    OrderService orderService = new OrderServiceImpl();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 从客户端获取模糊查询条件
        // req.setCharacterEncoding("utf-8"); 已配置字符编码过滤器进行处理 //处理中文乱码
        Order condition = new Order();
        condition.setOrderId(req.getParameter("orderId"));
        condition.setCustomerId(req.getParameter("customerId"));
        condition.setStatus(req.getParameter("statusName"));
        // 从客户端获取分页信息
        int page = 1;
        String sPage = req.getParameter("p");
        if (sPage != null && !"".equals(sPage)) {
            page = Integer.parseInt(req.getParameter("p"));
        }
        int pageSize = 10;
        int ordersCount = orderService.count(condition);
        int pageCount = ordersCount % pageSize == 0 ? ordersCount / pageSize : ordersCount / pageSize + 1;
        // 从服务层获取到分页查询结果
        List<Order> orderList = orderService.get(condition, page, pageSize);
        // 在请求范围内保存图书列表数据
        req.setAttribute("orders", orderList);
        req.setAttribute("p", page);
        req.setAttribute("pCount", pageCount);
        // 页面跳转：请求转发至订单列表页面
        req.getRequestDispatcher("list.do").forward(req, resp);
    }
}
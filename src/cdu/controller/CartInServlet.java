package cdu.controller;
import cdu.model.Cart;
import cdu.service.CartService;
import cdu.service.impl.CartServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
//前台：顾客在购物车中添加图书
@WebServlet("/customer/cart/in")
public class CartInServlet extends HttpServlet {
    CartService cartService = new CartServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        int bookId = 0;
        if (sid != null && !sid.equals("")) {
            //从客户端查询字符串中获取要加入购物车的图书id
            bookId = Integer.parseInt(sid);
        }
        HttpSession session = req.getSession();
        //获取当前访问者的购物车数据，未登录和已登录的用户都在会话中有购物车数据
        Cart cart = (Cart) session.getAttribute("cart");
        //调用服务层方法处理向购物车中添加图书的逻辑
        cart = cartService.putIn(cart, bookId);
        //更新当前用户的购物车数据
        session.setAttribute("cart", cart);
        //删除成功或失败，都重定向到购物车界面
        resp.sendRedirect("info");
    }
}
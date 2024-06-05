package cdu.controller;
import cdu.model.Book;
import cdu.model.Consult;
import cdu.service.BookService;
import cdu.service.ConsultService;
import cdu.service.impl.BookServiceImpl;
import cdu.service.impl.ConsultServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/admin/consult/info")
public class ConsultInfoServlet extends HttpServlet {
    ConsultService consultService = new ConsultServiceImpl();
    BookService bookService = new BookServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id == null || id.isEmpty()) {
            // 未获取到咨询id，重定向到咨询列表
            resp.sendRedirect("list");
            return;
        }
        Consult consult = consultService.get(Integer.parseInt(id));
        Book book = bookService.get(consult.getBookId());
        req.setAttribute("consult", consult);
        req.setAttribute("book", book);
        // 页面跳转：请求转发至咨询管理列表页面
        req.getRequestDispatcher("info.do").forward(req, resp);
    }
}
package cdu.controller;
import cdu.model.Book;
import cdu.model.Consult;
import cdu.model.ConsultStatus;
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
import java.util.List;
// 前台：获取某图书的详情
@WebServlet("/customer/book/info")
public class BookInfoServlet extends HttpServlet {
    BookService bookService = new BookServiceImpl();
    ConsultService consultService = new ConsultServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        if (sid != null && !sid.equals("")) {
            int bookId = Integer.parseInt(sid);
            // 调用服务层方法使用客户端传递的id值处理查询图书的业务逻辑
            Book book = bookService.get(bookId);
            // 根据bookId获取咨询列表
            List<Consult> consultList = consultService.getByBookId(bookId, ConsultStatus.DONE);
            // 在请求范围内保存查询到的图书对象
            req.setAttribute("book", book);
            req.setAttribute("consultList", consultList);
            // 请求转发到图书详情页面
            req.getRequestDispatcher("info.do").forward(req, resp);
        } else {
            // 未获取到id参数，则无法获取图书信息，重定向到图书列表界面
            resp.sendRedirect("list");
        }
    }
}
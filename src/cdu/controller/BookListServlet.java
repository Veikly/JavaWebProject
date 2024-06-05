package cdu.controller;
import cdu.model.Book;
import cdu.service.BookService;
import cdu.service.impl.BookServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
// 后台：管理员查询、管理图书列表
@WebServlet(urlPatterns = {"/admin/book/list", "/admin/book/query"})
public class BookListServlet extends HttpServlet {
    BookService bookService = new BookServiceImpl();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 从客户端获取模糊查询条件
        // req.setCharacterEncoding("utf-8"); 已配置字符编码过滤器进行处理 // 处理中文乱码
        Book condition = new Book();
        condition.setTitle(req.getParameter("title"));
        condition.setAuthor(req.getParameter("author"));
        condition.setPress(req.getParameter("press"));
        int page = 1;  // 页码默认值
        int pageSize = 3;   // 每页显示数量
        // 获取客户端请求的页码
        String sPage = req.getParameter("p");
        if (sPage != null && !"".equals(sPage)) {
            page = Integer.parseInt(req.getParameter("p"));
        }
        // 获取当前查询条件下的图书数量
        int booksCount = bookService.count(condition);
        // 计算总页数
        int pageCount = booksCount % pageSize == 0 ? booksCount / pageSize : booksCount / pageSize + 1;
        // 调用服务层方法获取图书的模糊查询结果
        List<Book> bookList = bookService.get(condition, page, pageSize);
        // 在请求范围内保存图书列表数据
        req.setAttribute("books", bookList);
        req.setAttribute("p", page);
        req.setAttribute("pCount", pageCount);
        // 页面跳转：请求转发至图书列表页面
        req.getRequestDispatcher("list.do").forward(req, resp);
    }
}
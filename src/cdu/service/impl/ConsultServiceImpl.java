package cdu.service.impl;
import cdu.dao.ConsultDao;
import cdu.dao.impl.ConsultDaoImpl;
import cdu.model.Consult;
import cdu.model.ConsultStatus;
import cdu.service.ConsultService;
import java.util.List;
public class ConsultServiceImpl implements ConsultService {
    ConsultDao consultDao = new ConsultDaoImpl();
    @Override
    public Consult get(int id) {
        return consultDao.findById(id);
    }
    @Override
    public List<Consult> getByBookId(int bookId, ConsultStatus status) {
        Consult condition = new Consult();
        condition.setBookId(bookId);
        condition.setReStatus(status);
        return consultDao.query(condition);
    }
    @Override
    public List<Consult> get(Consult condition, int page, int pageSize) {
        return consultDao.query(condition, (page - 1) * pageSize, pageSize);
    }
    @Override
    public boolean add(Consult consult) {
        return consultDao.insert(consult) == 1;
    }
    @Override
    public boolean reply(Consult consult) {
        return consultDao.update(consult) == 1;
    }
    @Override
    public boolean del(int id) {
        return consultDao.delete(id) == 1;
    }
    @Override
    public boolean delByBookId(int bookId, ConsultStatus status) {
        return consultDao.deleteByBookId(bookId, status) > 0;
    }
    @Override
    public int count(Consult condition) {
        return consultDao.count(condition);
    }
}
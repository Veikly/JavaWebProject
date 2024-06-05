package cdu.dao;
import cdu.model.Consult;
import cdu.model.ConsultStatus;

public interface ConsultDao extends SimpleDao<Consult> {
    // 根据图书id删除所有咨询
    int deleteByBookId(int bookId, ConsultStatus status);
}
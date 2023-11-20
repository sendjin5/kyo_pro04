package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Cart;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {
    public List<Cart> list() ;
    public List<Cart> listpro(Page page) ;
    public List<Cart> listForMain() ;
    public Cart getlast(int cno);
    public Cart get(int lsno) ;
    public void insert(Cart cart) ;
    public void delete(int cno) ;
    public int count(Page page) ;
}

package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Cart;
import kr.ed.haebeop.persistence.CartMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CartServiceImpl implements CartService{
    
    @Autowired
    private CartMapper cartmapper;

    @Override
    public List<Cart> list() {
        return cartmapper.list();
    }

    @Override
    public List<Cart> listpro(Page page) {
        return cartmapper.listpro(page);
    }

    @Override
    public List<Cart> listForMain() {
        return cartmapper.listForMain();
    }

    @Override
    public Cart getlast(int cno) {
        return cartmapper.getlast(cno);
    }

    @Override
    public Cart get(int lsno) {
        return cartmapper.get(lsno);
    }

    @Override
    public void insert(Cart cart) {
        cartmapper.insert(cart);
    }

    @Override
    public void delete(int cno) {
        cartmapper.delete(cno);

    }

    @Override
    public int count(Page page) {
        return cartmapper.count(page);
    }
}

package com.PSVM.dopamin.dao.Item;

import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Repository
public class ItemUserDaoImpl {
    String namespace="com.PSVM.dopamin.dao.ItemUserMapper.";
    private final SqlSession sqlSession;

    public ItemUserDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    public int addCart(Cart_ItemDto cart_itemDto) throws Exception{
        return sqlSession.insert(namespace+"addCart",cart_itemDto);
    }

    public int find_item(Integer item_id) throws Exception {
        return sqlSession.selectOne(namespace+"find_item",item_id);
    }

    public int getItem_Stat(Integer item_id) throws Exception {
        return sqlSession.selectOne(namespace+"item_stat",item_id);
    }

    public List<ItemDto> getCart_list(int cart_id) throws Exception {
        return sqlSession.selectList(namespace+"getCart_list",cart_id);
    }

    public int delete_cart(Map map) throws Exception {
        return sqlSession.delete(namespace+"delete_cart_item",map);
    }

    public int getUser_point(String user_id) throws Exception {
        return sqlSession.selectOne(namespace+"getUser_point",user_id);
    }

    public int updateUser_point(ConcurrentHashMap user_map) throws Exception{
        return sqlSession.update(namespace+"updateUser_point",user_map);
    }

    public int delete_item_in_Cart(ConcurrentHashMap cart_map) {
        return sqlSession.delete(namespace+"delete_item_in_Cart",cart_map);
    }
    public int add_item_to_user(List<OrderDto> orderDtoList) {
        return sqlSession.insert(namespace+"insert_item_in_Possesion",orderDtoList);
    }

    public int add_deal_detl(List<OrderDto> orderDtoList) {
        return sqlSession.insert(namespace+"add_deal_detl",orderDtoList);
    }

    public int pnt_use_detl(List<OrderDto> orderDtoList) {
        return sqlSession.insert(namespace+"pnt_use_detl",orderDtoList);
    }
}

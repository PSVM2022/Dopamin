package com.PSVM.dopamin.dao.Item;

import com.PSVM.dopamin.domain.Item.Cart_ItemDto;
import com.PSVM.dopamin.domain.Item.ItemDto;
import com.PSVM.dopamin.domain.Item.OrderDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
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
    public ItemDto find_item(Integer item_id) throws Exception {
        return sqlSession.selectOne(namespace+"find_item",item_id);
    }
    public int addCart(Cart_ItemDto cart_itemDto) throws SQLException,Exception{
        return sqlSession.insert(namespace+"addCart",cart_itemDto);
    }
    public Cart_ItemDto find_possesion(Cart_ItemDto cart_itemDto) throws Exception{
        return sqlSession.selectOne(namespace+"find_possesion",cart_itemDto);
    }
    public int getItem_Stat(int item_id) throws Exception {
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

    public int delete_item_in_Cart(ConcurrentHashMap cart_map)throws Exception {
        return sqlSession.delete(namespace+"delete_item_in_Cart",cart_map);
    }
    public int add_item_to_user(List<OrderDto> orderDtoList) throws Exception{
        return sqlSession.insert(namespace+"insert_item_in_Possesion",orderDtoList);
    }

    public int add_deal_detl(List<OrderDto> orderDtoList) throws Exception{
        return sqlSession.insert(namespace+"add_deal_detl",orderDtoList);
    }

    public int pnt_use_detl(List<OrderDto> orderDtoList) throws Exception{
        return sqlSession.insert(namespace+"pnt_use_detl",orderDtoList);
    }

    public int getStat_from_possesion(OrderDto orderDto) throws Exception{
        return sqlSession.selectOne(namespace+"getStat_from_possesion",orderDto);
    }

    public int increase_userPoint(ConcurrentHashMap point_map) {
        return sqlSession.update(namespace+"increase_userPoint",point_map);
    }

    public int delete_in_possesion(OrderDto orderDto) {
        return sqlSession.delete(namespace+"delete_in_possesion",orderDto);
    }

    public int exchange_insert_deal_detl(OrderDto orderDto) {
        return sqlSession.insert(namespace+"exchange_insert_deal_detl",orderDto);
    }

    public int exchange_insert_pnt_detl(OrderDto orderDto) {
        return sqlSession.insert(namespace+"exchange_insert_pnt_detl",orderDto);
    }

    public List<ItemDto> getItem_list() {
        return sqlSession.selectList(namespace+"getItem_list");
    }
}

package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.Cart_ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

    public int find_item(Integer item_id) {
        return sqlSession.selectOne(namespace+"find_item",item_id);
    }

    public int getItem_Stat(Integer item_id) {
        return sqlSession.selectOne(namespace+"item_stat",item_id);
    }
}

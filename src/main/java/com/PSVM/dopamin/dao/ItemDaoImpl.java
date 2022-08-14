package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ItemDaoImpl {
    private final SqlSession sqlSession;
    String namespace="com.PSVM.dopamin.dao.ItemMapper.";
    public ItemDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    public List<ItemDto> getPage(Map map) throws Exception{
        return sqlSession.selectList(namespace+"item_getPage",map);
    }

    public int getCount() throws Exception{
        return sqlSession.selectOne(namespace+"item_getCount");
    }

    public void remove(Integer item_id) {
        //아이템을 삭제하는게 아니라 상태값을 바꿔주는 것
        //상태값 1 아이템 display
        //상태값 0 아이템 non-display
    }

    public String getUser_nic(String writer_id) throws Exception{
        return sqlSession.selectOne(namespace+"item_user_nic",writer_id);
    }//해야함

    public int register(Map map) throws Exception {
        return sqlSession.insert(namespace+"item_register",map);
    }

    public int getStatus(int item_id) throws Exception{
        return sqlSession.selectOne(namespace+"item_getStatus",item_id);
    }

    public int getUser_stat(String user_id) throws Exception {
        return sqlSession.selectOne(namespace + "UserStatus", user_id);
    }
//    public ItemDto select(Integer item_id) throws Exception{
//        return sqlSession.selectOne(namespace+"select",item_id);
//    }
}

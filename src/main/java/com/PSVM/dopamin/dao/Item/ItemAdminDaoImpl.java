package com.PSVM.dopamin.dao.Item;

import com.PSVM.dopamin.domain.Item.ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemAdminDaoImpl {
    private final SqlSession sqlSession;
    public ItemAdminDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    String namespace="com.PSVM.dopamin.dao.ItemAdminMapper.";
    public int getCount() throws Exception{
        return sqlSession.selectOne(namespace+"item_getCount");
    }//테스트 완료
    public List<ItemDto> getPage(int index) throws Exception{
        return sqlSession.selectList(namespace+"item_getPage",index);
    }
    public List<ItemDto> getStat_0() {
        return sqlSession.selectList(namespace+"item_getStat_0");
    }
    public List<ItemDto> getStat_1() {
        return sqlSession.selectList(namespace+"item_getStat_1");
    }
    public int getUser_stat(String user_id) {//테스트 완료.
        return sqlSession.selectOne(namespace+"item_getUser_stat",user_id);
    }
    //테스트 완료
    public String getUser_nic(String user_id) throws Exception{
        return sqlSession.selectOne(namespace+"item_user_nic",user_id);
    }//테스트 완료
    public int registerItem(ItemDto itemDto) throws Exception{
        return sqlSession.insert(namespace+"item_register",itemDto);
    }//테스트 완료 정상작동함.

    public int remove(Integer item_id) throws Exception {
        return sqlSession.delete(namespace+"remove_item",item_id);
    }//테스트 완료 정상작동.
    public int modify(ItemDto itemDto) {
        return sqlSession.update(namespace+"modify_item",itemDto);
    }

    public String test_select(String item_name)throws Exception{
        return sqlSession.selectOne(namespace+"test_select",item_name);

    }
    public int test_delete_item(String item_name) throws Exception{
        return sqlSession.delete(namespace+"test_delete_item",item_name);
    }

    public int ShowToNoShow(Integer item_id) throws Exception{
        return sqlSession.update(namespace+"ShowToNoShow",item_id);
    }

    public int NoShowToShow(Integer item_id) throws Exception{
        return sqlSession.update(namespace+"NoShowToShow",item_id);
    }
}

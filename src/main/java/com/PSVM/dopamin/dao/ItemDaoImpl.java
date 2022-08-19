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




    public String test_select(String item_name)throws Exception{
        return sqlSession.selectOne(namespace+"test_select",item_name);

    }
    public int test_delete_item(String item_name) throws Exception{
        return sqlSession.delete(namespace+"test_delete_item",item_name);
    }

//
//    public void remove(Integer item_id) {
//        //아이템을 삭제하는게 아니라 상태값을 바꿔주는 것
//        //상태값 1 아이템 display
//        //상태값 0 아이템 non-display
//    }
//

//

//
//    public int getStatus(int item_id) throws Exception{
//        return sqlSession.selectOne(namespace+"item_getStatus",item_id);
//    }
//
//    public int getUser_stat(String user_id) throws Exception {
//        return sqlSession.selectOne(namespace + "UserStatus", user_id);
//    }
//

//    public ItemDto select(Integer item_id) throws Exception{
//        return sqlSession.selectOne(namespace+"select",item_id);
//    }
}

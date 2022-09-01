package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyPageDaoImpl implements MyPageDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.PSVM.dopamin.dao.MyPageMapper.";

    @Override
    public List<MyPageRevwDto> selectRevw(String user_id) throws Exception {
        return session.selectList(namespace + "selectrevw", user_id);
    }

    @Override
    public List<MyPageRevwDto> selectRevwRt(String user_id) {
        return session.selectList(namespace + "selectrevwRt", user_id);
    }

    @Override
    public List<MyPageCntsDto> selectCntsWish(String user_id) {
        return session.selectList(namespace + "selectCntsWish", user_id);
    }

    @Override
    public List<MyPageCntsDto> selectCntsView(String user_id) {
        return session.selectList(namespace + "selectCntsView", user_id);
    }

    @Override
    public List<MyPagePostDto> selectPost(String user_id) {
        return session.selectList(namespace + "selectPost", user_id);
    }

    @Override
    public MyPageDto selectMyInfo(String user_id) {
        return session.selectOne(namespace + "selectUserInfo", user_id);
    }

    @Override
    public String selectSkin(String user_id) throws Exception {
        return session.selectOne(namespace + "selectSkin", user_id);
    }

    @Override
    public String genreIdToNm(int genre_id) {
        return session.selectOne(namespace + "genreIdToNm", genre_id);
    }

    @Override
    public List<MyPageItemsDto> selectSkinItem(String user_id) {
        return session.selectList(namespace + "selectSkinItem", user_id);
    }

    @Override
    public List<MyPageItemsDto> selectProfItem(String user_id) {
        return session.selectList(namespace + "selectProfItem", user_id);
    }

    @Override
    public List<MyPagePointDto> selectPntList(String user_id) {
        return session.selectList(namespace + "selectPntList", user_id);
    }

    @Override
    public int equipSkin(MyPageItemsDto myPageItemsDto) {
        return session.update(namespace + "equipSkin", myPageItemsDto);
    }

    @Override
    public int skinWearOff(MyPageItemsDto myPageItemsDto) {
        return session.update(namespace + "skinWearOff", myPageItemsDto);
    }

    @Override
    public int equipProf(MyPageItemsDto myPageItemsDto) {
        return session.update(namespace + "equipSkin", myPageItemsDto);
    }

    @Override
    public int profWearOff(MyPageItemsDto myPageItemsDto) {
        return session.update(namespace + "profWearOff", myPageItemsDto);
    }

    @Override
    public int deleteRevw(Integer revwId) {
        return session.delete(namespace + "deleteRevw", revwId);
    }

    @Override
    public int deletePost(Integer postId) {
        return session.delete(namespace + "deletePost", postId);
    }

}

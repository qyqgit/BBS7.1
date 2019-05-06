package org.fishcc.bbs.dao;

import java.util.List;

import org.fishcc.bbs.entity.MyPage;

public interface MyPageDao {
    public int insertMyPage(MyPage myPage);
    public int deleteMyPage(String id);
    public int updateMyPage(MyPage myPage);
    public MyPage selectMyPageById(String id);
    public List<MyPage> selectMyPageList();
}

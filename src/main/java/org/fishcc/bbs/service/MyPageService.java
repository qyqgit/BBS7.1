package org.fishcc.bbs.service;

import java.util.List;

import org.fishcc.bbs.entity.MyPage;

public interface MyPageService {
    public MyPage getMyPageById(String id);
    public List<MyPage> getMyPageList();
    public boolean sendMyPage(MyPage myPage);
}

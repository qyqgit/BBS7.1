package org.fishcc.bbs.service;

import java.util.List;

import javax.annotation.Resource;

import org.fishcc.bbs.dao.MyPageDao;
import org.fishcc.bbs.entity.MyPage;
import org.springframework.stereotype.Service;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
    @Resource(name="myPageDao")
    private MyPageDao myPageDao;
    public MyPage getMyPageById(String id) {
        // TODO Auto-generated method stub
        return myPageDao.selectMyPageById(id);
    }
    public List<MyPage> getMyPageList() {
        // TODO Auto-generated method stub
        return myPageDao.selectMyPageList();
    }
    public boolean sendMyPage(MyPage myPage) {
        // TODO Auto-generated method stub
        return 1==myPageDao.insertMyPage(myPage);
    }

}

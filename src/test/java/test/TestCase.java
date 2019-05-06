package test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.fishcc.bbs.dao.MessageDao;
import org.fishcc.bbs.dao.MyPageDao;
import org.fishcc.bbs.dao.UserDao;
import org.fishcc.bbs.entity.Message;
import org.fishcc.bbs.entity.MyPage;
import org.fishcc.bbs.entity.User;
import org.fishcc.bbs.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class TestCase {
    ApplicationContext ac;
    UserDao userDao;
    MyPageDao myPageDao;
    MessageDao messageDao;
    UserService userService;
    @Before
    public void init() {
        String a[] = {"conf/spring-mvc.xml","conf/spring-mybatis.xml"};
        ac = new ClassPathXmlApplicationContext(a);
        userDao = ac.getBean("userDao", UserDao.class);
        myPageDao = ac.getBean("myPageDao", MyPageDao.class);
        messageDao = ac.getBean("messageDao", MessageDao.class);
        userService = ac.getBean("userService", UserService.class);
        
    }
    @Test
    public void test() {
        User user = new User();
        user.setName("222");
        user.setPassword("sss");
        user =  userDao.selectUserById("1000");
        System.out.println(user.getId());
        System.out.println(user.getName());
        assertEquals("1000",user.getId());
        user.setId("bbb1");
        int a = userDao.insertUser(user);
        System.out.println(a);
        user.setId("sssss1");
        user.setAge("2018/08/08");
        user.setPassword("1111");
        user.setName("222");
        user.setSex("1");
        userDao.insertUser(user);
    }
    @Test
    public void test2() {
        User user = new User();
        user.setName("www");
        user.setPassword("xxx");
        System.out.println(userService.registerUser(user));
    }
    @Test
    public void test3() {
        User user = userDao.selectUserById("2e96afea-4e13-46bc-8c78-dd63357bbada");
        System.out.println(user.getName());
    }
    @Test
    public void test4() {
        System.out.println(userService.alreadyRegister("gg"));
    }
    @Test
    public void test5() {
        User user = new User();
        user.setName("d");
        user.setPassword("8277e0910d750195b448797616e091ad");
        System.out.println(userService.loginSuccess(user));
    }
    @Test
    public void test6() {
        //myPageDao.deleteMyPage("1");
        MyPage myPage = myPageDao.selectMyPageById("1");
        System.out.println(myPage.getText());
        System.out.println(myPage.getUser().getId());
        System.out.println(myPage.getInvalid());
        System.out.println(myPage.getCreateDate());
        System.out.println(myPage.getTimeStamp());
        System.out.println(myPage.getMessageNumber());
        
    }
    @Test
    public void test7() {
        //myPageDao.deleteMyPage("1");
        MyPage myPage = new MyPage();
        myPage.setId("2");
        myPage.setTitle("df");
        myPage.setText("df");
        User user = new User();
        user.setId("d");
        myPage.setUser(user);
        System.out.println(myPageDao.insertMyPage(myPage));
        
    }
    @Test
    public void test8() {
        User user = new User();
        user.setId("b2a7586b-a896-4083-a282-53502db9b370");
        user.setName("xxx");
        user.setAge("2018/08/08");
        System.out.println(userDao.updateUser(user));
        
    }
    @Test
    public void test9() {
        //myPageDao.deleteMyPage("1");
        MyPage myPage = new MyPage();
        myPage.setId("1");
        myPage.setTitle("df");
        myPage.setText("df");
        User user = new User();
        user.setId("d");
        myPage.setUser(user);
        myPage.setMessageNumber("100");
        System.out.println(myPageDao.updateMyPage(myPage));
        myPage.setId("22");
        myPage.setTitle("dddddddddddd");
        myPageDao.updateMyPage(myPage);
        
    }
    @Test
    public void test10() {
        List<MyPage> list = myPageDao.selectMyPageList();
        System.out.println(list.size());
        System.out.println(list.get(0).getUser().getId());
        
    }
    @Test
    public void test11() {
        Message message = messageDao.selectMessageById("111");
        message.setRead("1");
        message.setInvalid("1");
        messageDao.updateMessage(message);
        message.setId("wxwnw");
        message.setRead("1");
        messageDao.insertMessage(message);
        List<Message> messageList = messageDao.selectMessageListByPageId("1");
        System.out.println(message.getText());
        System.out.println(message.getId());
        System.out.println(messageList.get(0).getText());
        messageDao.deleteMessage("www");
        
    }
    @Test
    public void test12() {
        List<User> userList = userDao.selectLastSendMessageUserList();
        System.out.println(userList.size());
        
    }
}

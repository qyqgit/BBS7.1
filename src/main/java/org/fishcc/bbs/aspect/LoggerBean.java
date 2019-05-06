package org.fishcc.bbs.aspect;

import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
@Aspect
public class LoggerBean {
    @Resource(name="logConfig")
    private Properties logProperties;
    
    @Before("within(org.fishcc.bbs.controller..*)")
    public void logController(JoinPoint point) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if(logProperties == null)
            BasicConfigurator.configure();
        PropertyConfigurator.configure(logProperties);
        Logger log = Logger.getLogger(LoggerBean.class);
        log.info(request.getRemoteHost() + " " + point.getSignature().getName());
    }
    @AfterThrowing(pointcut="within(org.fishcc.bbs.controller..*)",throwing="e")
    public void logExController(JoinPoint point, Throwable e) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if(logProperties == null)
            BasicConfigurator.configure();
        PropertyConfigurator.configure(logProperties);
        Logger log = Logger.getLogger(LoggerBean.class);
        log.error(request.getRemoteHost() + " " + point.getSignature().getName() + "\r\n" + e.toString());
    }
}

package kh.spring.pisic.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;


@Aspect
@Component
public class AdviceLog {

	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Pointcut("execution(public * kh.spring.pisic..*Dao.*(..))")
	public void daoPointcut() {}
	@Pointcut("execution(public * kh.spring.pisic..*ServiceImpl.*(..))")
	public void servicePointcut() {}
	@Pointcut("execution(public * kh.spring.pisic..*Controller.*(..))")
	public void controllerPointcut() {}
	
	@Around("daoPointcut()")
	public Object aroundLogMethod(ProceedingJoinPoint pjp) throws Throwable{
		Object ro = null;
		
		
		logger.info("\t\t\t["+pjp.getThis()+"."+pjp.getSignature().getName()+"]");
		// 매개인자 log 찍기
		Object[] args = pjp.getArgs();
		for(int i = 0 ; i <args.length ; i++) {
			logger.info("\t\t\t-args["+i+"]" + args[i]);
		}
		
		// 메소드 실행시간
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		ro = pjp.proceed();
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		logger.info("\t\t\t[DAO Ret:]" + ro);
		
		return ro;
	}
	
	@Around("servicePointcut()")
	public Object aroundServiceLogMethod(ProceedingJoinPoint pjp) throws Throwable{
		Object ro = null;
		
		
		logger.info("\t\t["+pjp.getThis()+"."+pjp.getSignature().getName()+"]");
		// 매개인자 log 찍기
		Object[] args = pjp.getArgs();
		for(int i = 0 ; i <args.length ; i++) {
			logger.info("\t\t-args["+i+"]" + args[i]);
		}
		
		// 메소드 실행시간
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		ro = pjp.proceed();
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		logger.info("\t\t[service Ret:]" + ro);
		
		return ro;
	}
	
	@Around("controllerPointcut()")
	public Object aroundCtrlLogMethod(ProceedingJoinPoint pjp) throws Throwable{
		Object ro = null;
		
		
		logger.info("\t["+pjp.getThis()+"."+pjp.getSignature().getName()+"]");
		// 매개인자 log 찍기
		Object[] args = pjp.getArgs();
		for(int i = 0 ; i <args.length ; i++) {
			logger.info("\t-args["+i+"]" + args[i]);
		}
		
		// 메소드 실행시간
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		ro = pjp.proceed();
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		logger.info("\t[CTRL Ret:]" + ro);
		
		return ro;
	}
}

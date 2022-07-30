package kh.spring.pisic.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ContollerAdvice {

	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		
		return "error/error_500";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String handler404(NoHandlerFoundException e) {
		
		return "error/error_404";
	}
}

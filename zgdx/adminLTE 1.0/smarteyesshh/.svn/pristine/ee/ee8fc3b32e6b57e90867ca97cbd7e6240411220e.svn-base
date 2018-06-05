package cn.com.ctbri.ctbigdata.smarteyes.constants;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

public class XssSqlBinderController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		binder.registerCustomEditor(String.class, new XssSqlStringEscapeEditor(true, true, true));
	}
	
}

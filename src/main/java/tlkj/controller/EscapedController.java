package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tlkj.json.JsonUtil;
import tlkj.model.Escaped;
import tlkj.service.EscapedServiceI;

@Controller
public class EscapedController {
	private EscapedServiceI escapedService;
	private JsonUtil jsonutil = new JsonUtil();

	public EscapedServiceI getEscapedService() {
		return escapedService;
	}

	@Autowired
	public void setEscapedService(EscapedServiceI escapedService) {
		this.escapedService = escapedService;
	}
	
	@RequestMapping(value="getEscapedHundred",method=RequestMethod.POST)
	@ResponseBody
	public void getEcaspedRecord_Hundred(HttpServletRequest request, HttpServletResponse response){
		List<Escaped> escapedList = null;
		escapedList = escapedService.getHundredRecord();
		String jsondata = jsonutil.ListToJSON(escapedList);
		if(jsondata==""||jsonutil==null){
			jsondata = "false";
		}
		outputJson(response, jsondata);
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	@RequestMapping(value="compareEscapedByPersonId",method=RequestMethod.POST)
	@ResponseBody
	public void compareEscapedByPersonId(HttpServletRequest request, HttpServletResponse response){
		String personId = request.getParameter("jsondata");
		System.out.println("需要比对的身份证号："+personId);
		ArrayList<Escaped> escapedList = new ArrayList<Escaped>();
		Escaped escaped = escapedService.selectByPersonId(personId);
		escapedList.add(escaped);
		String result = jsonutil.ListToJSON(escapedList);
		if(escaped==null){
			result = "false";
		}
		outputJson(response, result);
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	private void outputJson(HttpServletResponse response,String result) {
        response.setContentType("text/javascript;charset=UTF-8");
        response.setHeader("Cache-Control", "no-store, max-age=0, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        try {
            PrintWriter out = response.getWriter();
            try {
                out.write(result);
            } finally {
                out.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
}

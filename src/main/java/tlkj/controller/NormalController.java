package tlkj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tlkj.json.JsonUtil;
import tlkj.model.Normal;
import tlkj.service.NormalService;

@Controller
public class NormalController {

	private NormalService normalService;

	public NormalService getNormalService() {
		return normalService;
	}

	@Autowired
	public void setNormalService(NormalService normalService) {
		this.normalService = normalService;
	}

	@RequestMapping("/showNormal/{id}")
	public String showNormal(@PathVariable int id, HttpServletRequest request) {
		Normal n = normalService.getNormalById(id);
		request.setAttribute("user", n);
		return "showNormal";
	}
	
	@RequestMapping(value="addNormal",method = RequestMethod.POST)
	@ResponseBody
	public void addNormalRecord(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String jsondata = request.getParameter("jsondata");
		System.out.println("数据："+jsondata);
		JsonUtil jsonutil = new JsonUtil();
		ArrayList<Normal> list = jsonutil.StringFromJSON(jsondata);
		Normal record = null;
		//System.out.println(list.size());
		List<Normal> norlist = null;
		ArrayList<String> errorNormalRecord = null;
		String result = "true";
		if(list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				record = list.get(i);
				record.setId(null);
				// 插入之前查询记录数
				norlist = normalService.getAllNormal();
				int before_normal_num = norlist.size();
				System.out.println("before_normal_num:"+before_normal_num);
				// 插入记录
				normalService.AddNormalRecord(record);
				// 插入之后查询记录数
				norlist = normalService.getAllNormal();
				int after_normal_num = norlist.size();
				System.out.println("after_normal_num:"+after_normal_num);
				if(after_normal_num == before_normal_num){
					result = "false";
//					result = "身份证号为"+record.getPersonid()+"的记录插入错误";
//					errorNormalRecord.add(result);
				}
			}
		}else{
			result = "您的设备上核录信息已经全部提交完毕，不需要重复提交，谢谢！";
		}
		
		
//		if(errorNormalRecord.size()==0){
//			errorNormalRecord.add(result);
//		}
//		result = jsonutil.ListToJSON(errorNormalRecord);
		outputJson(response,result);
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

package com.luwenjing.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luwenjing.bean.Meeting;
import com.luwenjing.bean.Type;
import com.luwenjing.service.MeetService;

@Controller
public class MeetController {

	@Resource
	private MeetService meetService;
	@RequestMapping("list")
	public String list(Model m,@RequestParam(value="pageNum",defaultValue="1") Integer pageNum){
		PageHelper.startPage(pageNum, 2);
		List<Meeting> list = meetService.list();
		PageInfo<Meeting> page = new PageInfo<Meeting>(list);
		m.addAttribute("page", page);
		m.addAttribute("list", list);
		return "list";
	}
	@RequestMapping("findXL")
	public List<Type> findXL(){
		List<Type> sel = meetService.sel();
		return sel;
		
	}
	@RequestMapping("add")
	@ResponseBody
	public boolean add(Integer id){
		try {
			meetService.add(id);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	@RequestMapping("queryHui")
	public String queryHui(Model m,Meeting meeting){
		List<Meeting> queryHui = meetService.queryHui(meeting);
		m.addAttribute("list", queryHui);
		return "update";
	}
	@RequestMapping("update")
	@ResponseBody
	public boolean update(Integer id){
		try {
			meetService.update(id);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}

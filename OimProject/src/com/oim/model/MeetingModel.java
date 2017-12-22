package com.oim.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;

@Controller
public class MeetingModel {
	@RequestMapping("meeting_list.do") //모임목록
	public String meeting_list(HttpServletRequest req, HttpServletResponse res) {
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start= (rowSize*curpage)-(rowSize-1);
		int end= rowSize*curpage;
		int totalpage=0;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<MeetingVO> list=MeetingDAO.meetingListData(map);
		totalpage=MeetingDAO.meetingTotalPage();
		
		//jsp로 전송
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../meeting/meeting_list.jsp");
		return "main/main.jsp";
	}
    @RequestMapping("meeting_detail.do")
    public String meeting_detail(HttpServletRequest req, HttpServletResponse res) {
       String meet_no = req.getParameter("meet_no");
       
       MeetingVO vo = MeetingDAO.meetingDetailData(Integer.parseInt(meet_no));
       
       req.setAttribute("vo", vo);
       
       req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
       return "main/main.jsp";
    }
    //멍미
    @RequestMapping("meeting_payment.do")
    public String meeting_payment(HttpServletRequest req, HttpServletResponse res) {
    	String meet_no = req.getParameter("meet_no");
    	System.out.println("meet_no:"+meet_no);
    	MeetingVO vo = MeetingDAO.meetingDetailData(Integer.parseInt(meet_no));
    	
        req.setAttribute("vo", vo);
        req.setAttribute("meeting_payment.do", "meeting_payment.jsp");
    	return "meeting/meeting_payment.jsp";
    }
    
    
    @RequestMapping("meeting_insert.do")//모임개설
    public String meeting_insert(HttpServletRequest req, HttpServletResponse res) {
    	
    	
    	
    	req.setAttribute("main_jsp", "../meeting/meeting_insert.jsp");
    	return "main/main.jsp";
    }
    
}

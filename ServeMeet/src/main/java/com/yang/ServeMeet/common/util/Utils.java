package com.yang.ServeMeet.common.util;

import org.springframework.stereotype.Controller;

@Controller
public class Utils {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 10;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<nav class='pg_wrap'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<span class='pg'>";
			pageBar += "<li class='pg_page pg_start' href='#' tabindex='-1'></li>";
			pageBar += "</span>";
		}
		else {
			pageBar += "<span class='pg'>";
			pageBar += "<a class='pg_page pg_start' href='javascript:fn_paging("+(pageNo-1)+")'></a>";
			pageBar += "</span>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<span class='pg'>";
				pageBar += "<li class='pg_page'><strong class='pg_current'>"+pageNo+"</strong></li>";
				pageBar += "</span>";
			} 
			else {
				pageBar += "<span class='pg'>";
				pageBar += "<a class='pg_page' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</span>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<span class='pg'>";
			pageBar += "<li class='pg_page pg_end' href='#'></li>";
			pageBar += "</span>";
			
		} else {
			pageBar += "<span class='pg'>";
			pageBar += "<a class='pg_page pg_end' href='javascript:fn_paging("+pageNo+")'></a> ";
			pageBar += "</span>";
		}
		
		pageBar += "</nav>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}

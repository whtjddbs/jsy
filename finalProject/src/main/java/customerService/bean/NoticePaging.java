package customerService.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class NoticePaging {
	private int currentPage; // 현재페이지
	private int pageBlock; // [이전][1][2][3][다음]
	private int pageSize; // 1페이지당 5개씩
	private int totalA;   // 총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		// 총 페이지 수 ( 총 글 수 필요 )
		int totalP = (totalA+pageSize-1) / pageSize;
		
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("<a id=paging href='notice.do?pg="+(startPage-1)+"'><</a>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("<a id=currentPaging href='notice.do?pg="+i+"'>"+i+"</a>");
			}else {
				pagingHTML.append("<a id=paging href='notice.do?pg="+i+"'>"+i+"</a>");
			}
		}
		
		if(endPage < totalP) {
			pagingHTML.append("<a style='font-weight: 700; color: #000; font-size:20px;' id=paging href='notice.do?pg="+(endPage+1)+"'>></a>");
		}
	}
}

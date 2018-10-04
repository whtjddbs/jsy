package item.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ItemControllPaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA-1)/pageSize+1;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)
			pagingHTML.append("<span style='font-weight: 700; color: #000; font-size:20px;' id=paging class='"+(startPage-1)+"'><</span>");
		
		for(int i=startPage;i<=endPage;i++) {
			if(i==currentPage)
				pagingHTML.append("<span id=currentPaging class='"+i+"'>"+i+"</span>");
			else
				pagingHTML.append("<span id=paging class='"+i+"'>"+i+"</span>");
		}
		
		if(endPage<totalP)
			pagingHTML.append("<span style='font-weight: 700; color: #000; font-size:20px;' id=paging class='"+(endPage+1)+"'>></span>");
	}
}

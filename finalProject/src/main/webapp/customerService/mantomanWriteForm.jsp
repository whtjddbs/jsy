<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mantomanWriteForm.css">
<link rel="stylesheet" href="../css/paging.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>



<script type="text/javascript">

//파일 리스트 번호
var fileIndex = 0;
// 등록할 전체 파일 사이즈
var totalFileSize = 0;
// 파일 리스트
var fileList = new Array();
// 파일 사이즈 리스트
var fileSizeList = new Array();
// 등록 가능한 파일 사이즈 MB
var uploadSize = 50;
// 등록 가능한 총 파일 사이즈 MB
var maxUploadSize = 500;
// 파일개수
var fileCnt =1;

//폼 
//var form = document.getElementById("uploadForm")

var formData=new FormData($('#uploadForm'));

function fileDropDown(){
    var dropZone = $("#dropZone");
    //Drag기능 
    dropZone.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
       
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        
        dropZone.css('background-color','#E3F2FC');
    });
    // drop됬을 때
    dropZone.on('drop',function(e){
        e.preventDefault();
       
        dropZone.css('background-color','#E3F2FC');
        
        var files = e.originalEvent.dataTransfer.files;
        if(files != null){
        	selectFile(files)
        }
    });
}

//파일 선택시
function selectFile(fileObject){
    var files = null;
    
    if(fileCnt<=1){
    	if(fileObject != null){
        	
            files = fileObject;
            fileCnt++;
        }
    }
    
    // 다중파일 등록
    if(files != null){
        for(var i = 0; i < files.length; i++){
            // 파일 이름
            var fileName = files[i].name;
            var fileNameArr = fileName.split("\.");
            // 확장자
            var ext = fileNameArr[fileNameArr.length - 1];
            // 파일 사이즈(단위 :MB)
            var fileSize = files[i].size/1024/1024;
            
            if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                // 확장자 체크
                $('#dialog_frame_fileType').show();
                break;
            }else if(fileSize > uploadSize){
                // 파일 사이즈 체크
                alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                break;
            }else{
                // 전체 파일 사이즈
                totalFileSize += fileSize;
                
                // 파일 배열에 넣기
                fileList[fileIndex] = files[i];
                
                // 파일 사이즈 배열에 넣기
                fileSizeList[fileIndex] = fileSize;

                // 업로드 파일 목록 생성
                addFileList(fileIndex, fileName);

                // 파일 번호 증가
                fileIndex++;
                
                //파일등록
                uploadFile();
            }
            
        }
    }else{
    	$('#dialog_frame_fileTotal').show();
    }
}

//업로드 파일 목록 생성
function addFileList(fIndex, fileName){
    var html = "";
    html += "<tr id='fileTr_" + fIndex + "'>";
    html += "    <td class='left' >";
    html +=         fileName
    html += "    </td>"
    html += "</tr>"
	
    $('#fileTableTbody').append(html);
}

// 업로드 파일 삭제
function deleteFile(fIndex){
    // 전체 파일 사이즈 수정
    totalFileSize -= fileSizeList[fIndex];
    
    // 파일 배열에서 삭제
    delete fileList[fIndex];
    
    // 파일 사이즈 배열 삭제
    delete fileSizeList[fIndex];
    
    // 업로드 파일 테이블 목록에서 삭제
    $("#fileTr_" + fIndex).remove();
}

// formData에 추가
function uploadFile(){
	// 등록할 파일 리스트
	var uploadFileList = Object.keys(fileList);
	    
    for(var i = 0; i < uploadFileList.length; i++){
        formData.append('m_files', fileList[uploadFileList[i]]);
    }
    
}

$(document).ready(function(){
	
	getBuyList(); 
	
	fileDropDown();
	
	$('input[name="sel_inquiry"]').change(function(){
		$('li.second').remove();
		$('li.third').remove();
		$('li.fourth').remove();
		$('li.fifth').remove();
		
		if($(this).parents('div').prev().children('strong').text()=='구매관련문의') {
			$('li.first').before($('<li/>',{
						 	class : 'second'
						 }).append($('<div/>',{
							text : '주문번호',
							class : 'td1'
						 }).css({
								 display: 'table-cell',
							     'font-size': '12px',
							     'font-weight': '700',
							     color: '#303033',
							     'line-height': '60px'
						 })).append($('<div/>',{
						 	 class : 'td2',
						 	 style :'width: 328px;'
						 }).append($('<div/>')
						 .append($('<input/>',{
							 type : 'text',
							 id : 'serialText'
						 }).css({
							 cursor: 'unset',
							 width : '150px',
							 height : '40px'
						 }).attr('readonly', true)).append($('<button/>',{
							 type : 'button',
							 text : '주문번호',
							 id : 'findBuyListBtn'
						 }).css({
							 width: '80px',
						     height: '40px',
						     margin: '0 0 0 10px',
						     display: 'inline-block',
						     background: '#0000',
						     border: '1px solid #d4d4d4',
						     'border-radius': '2px',
						     'font-size': '14px',
						     color: '#5d5d5d',
						     'line-height': '40px',
						     'text-align': 'center',
						     'box-sizing': 'border-box'
						 }))))
						 .append($('<div/>',{
	    				    class : 'td3',
	    				    text : '주문금액'
	    			  	 }).css({
		    			  		  'padding-left': '10px',
		    			  		  width: '109px',
		    			  		  display: 'table-cell',
							      'font-size': '12px',
							      'font-weight': '700',
							      color: '#303033',
							      'line-height': '60px',
		    			  		  'border-right': '1px solid #d4d4d4',
		    			  		  'border-left': '1px solid #d4d4d4'
		    			  })).append($('<div/>',{
		    				  class: 'td2'
		    			  }).append($('<p/>',{id:'p_totalPrice'}))));
			
			$('li.first').before($('<li/>',{
						 	class : 'third'
						 }).append($('<div/>',{
						  	text : '주문일자',
						  	class : 'td1'
						 }).css({
							 	 display: 'table-cell',
							     'font-size': '12px',
							     'font-weight': '700',
							     color: '#303033',
							     'line-height': '60px'
						 })).append($('<div/>',{
							  class : 'td2',
		    				  style: 'width: 328px'
						 }).append($('<p/>',{id:'p_logtime'}))).append($('<div/>',{
							  class : 'td3',
							  text : '결제방법'
						 }).css({
						  		 'padding-left': '10px',
						  		 width : '109px',
						  		 'border-right': '1px solid #d4d4d4',
						  		 display: 'table-cell',
							     'font-size': '12px',
							     'font-weight': '700',
							     color: '#303033',
							     'line-height': '60px',
						  		 'border-left': '1px solid #d4d4d4'
						 })).append($('<div/>',{
							  class : 'td2'
						 }).append($('<p/>'))));
			
		}else if($(this).parent().prop('title')=='상품문의'){
			$('li.second').remove();
			$('li.third').remove();
			$('li.fourth').remove();
			$('li.fifth').remove();
			
			$('li.first').before($('<li/>',{class : 'fourth'}).append($('<div/>',{
												text : '문의상품',
												class : 'td1'
											}).css({
												display: 'inline-block',
											    'font-size': '12px',
											    'font-weight': '700',
											    color: '#303033',
											    'line-height': '60px'
										 	})).append($('<div/>',{
											 	 class : 'td2',
											 	 style :'display:inline-block'
											 }).append($('<div/>')
											 .append($('<input/>',{
												 type : 'text',
												 id : 'itemSeqText'
											 }).css({
												 width : '150px',
												 height : '40px'
											 })).append($('<button/>',{
												 type : 'button',
												 text : '조회',
												 id : 'findItemBtn'
											 }).css({
												 width: '80px',
											     height: '40px',
											     margin: '0 0 0 10px',
											     display: 'inline-block',
											     background: '#0000',
											     border: '1px solid #d4d4d4',
											     'border-radius': '2px',
											     'font-size': '14px',
											     color: '#5d5d5d',
											     'line-height': '40px',
											     'text-align': 'center',
											     'box-sizing': 'border-box'
											 }))))
											
			);
			
			$('li.first').before($('<li/>',{
						 	class : 'fifth'
						 }).append($('<div/>',{
						  	text : '상품명',
						  	class : 'td1'
						 }).css({
							    'font-size': '12px',
							    'font-weight': '700',
							    color: '#303033',
							    'line-height': '60px'
						 })).append($('<div/>',{
							  class : 'td2'
						 }).append($('<p/>',{id:'p_itemName'}))).append($('<div/>',{
							  class : 'td3',
							  text : '판매가'
						 }).css({
					  		     'padding-left': '10px',
					  		      width : '120px',
					  		     'border-right': '1px solid #d4d4d4',
						         'font-size': '12px',
						         'font-weight': '700',
						         color: '#303033',
						         'line-height': '60px',
					  		     'border-left': '1px solid #d4d4d4'
						 })).append($('<div/>',{
							  class : 'td2'
						 }).append($('<p/>',{id:'p_itemPrice'}))));
		}else {
			$('li.second').remove();
			$('li.third').remove();
			$('li.fourth').remove();
			$('li.fifth').remove();
		}
	});
	
	//등록하기 눌렀을 때 
	$('#m_registerBtn').on('click',function(){
		
		if(!$('input[name="sel_inquiry"]').is(':checked')){
			$('#dialog_frame').show();
		} else if($('#m_title').val()=='제목을 입력하세요.' || $('#m_title').val()==''){
			$('#dialog_frame_title').show();
		}else if($('#m_content').val()=='내용을 입력하세요.' || $('#m_content').val()==''){
			$('#dialog_frame_content').show();
		}else{
		    
		    formData.append("title",$('#m_title').val());
		    formData.append("content",$('#m_content').val());
		    formData.append("type",$('input[name="sel_inquiry"]:checked').parent().prop('title'));
		    formData.append("serial",$('#serialText').val());
			
			$.ajax({
                url:"/finalProject/customerService/mantomanWrite.do",
                data:formData,
                type:'POST',
                async:false,
                processData: false, 
                contentType: false,
                enctype:'multipart/form-data',
                dataType:'text',
                success:function(response){
                  	location.href="/finalProject/customerService/mantomanList.do"
                }
            });  
		}
	});

	//dialog닫기
	$(document).on('click','#dialog_closeBtn',function(){
		$(this).parent().parent().hide();		
	});
	
	//파일첨부버튼으로 파일추가
	$('input[type=file]').on("change", function () {
		var files=this.files;
		selectFile(files);
	});
	
	//삭제버튼
	$('button[id=m_Btn2]').on('click',function(){
        
        // 파일 배열에서 삭제
        delete fileList[0];
        
        // 파일 사이즈 배열 삭제
        delete fileSizeList[0];
        
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_0").remove();
        
        // fileCnt 1로 초기화
        fileCnt=1;
        fileIndex=0;
	});
	
	//주문번호 버튼 눌렀을 때,
	$(document).on('click', '#findBuyListBtn', function(){
		$('#buyList_frame').show();
	});
	
	
});

function getBuyList(){
	$.ajax({
		type : 'POST',
		url : '/finalProject/customerService/mantomanWriteForm2.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			$('.info').siblings().remove();
			
			$.each(data.list,function(index,item){
			var date = new Date(item.LOGTIME);
			
			$('<li/>').append($('<span/>',{
					  		id : 'IHaveSerial',
					  		style:'cursor:pointer;'
					  }).append($('<div/>',{
						  	class:'info2'
					  }).append($('<p>',{
						  	text:item.SERIAL,
						  	style:"width: 165px"
					  })).append($('<p>',{
						  	text:jsonDateFormat(date),
						  	style:"width: 110px"
					  })).append($('<p>',{
						  	text:item.TOTALPRICE,
						  	style:"width: 100px"
					  })).append($('<p>',{
						  	text:item.NAME,
						  	style:"width: 160px"
					  })).append($('<p>',{
						  	text:item.STATUS
					  })))).appendTo($('#ul_buyList'));
			});	
			
			$('#findBuyListPaging').html(data.paging.pagingHTML);
		}
	});
}
$('body').on('click','#IHaveSerial',function(){
	
	$('#buyList_frame').hide();
	$('#serialText').val("");
	$('#serialText').val($(this).children().children().eq(0).text());
	$('#p_totalPrice').text($(this).children().children().eq(2).text());
	$('#p_logtime').text($(this).children().children().eq(1).text());
});

function getSerial(serialNum){
	$('#buyList_frame').hide();
	$('#serialText').val("");
	$('#serialText').val(serialNum);
}

$('body').on('click','#findBuyListPaging span',function(){
	
	$('#pg').val($(this).prop('class'));
	$('#li_base').siblings().remove();
	
	getBuyList();
	
});	

//json Date to YYYY-MM-DD
function jsonDateFormat(date) {
	var year = date.getYear()+1900;
	var month = date.getMonth()+1;
	var day = date.getDate();
	return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
}
	
//조회버튼 클릭시	
$('body').on('click','#findItemBtn',function(){
	$.ajax({
		type : 'POST',
		url : '/finalProject/customerService/findItem.do',
		data : 'itemSeq='+$(this).prev().val(),
		dataType : 'json',
		success : function(data){
			$('#p_itemName').text(data.itemDTO.name);
			$('#p_itemPrice').text(data.itemDTO.price);
		}
	});
	
});	

</script>
</head>


<body>
<div class="wrap" style="padding: 0 50px 100px;">
<h3 class="m_title">1:1 문의쓰기</h3>

<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" 
	method="post" action="/finalProject/customerService/mantomanWrite.do">
	
<ul class="mantoman_writeForm">
	<li class="buy_inquiry">
		<div class="td1"><strong>구매관련문의</strong></div>
		
		<div class="td2">
			<label title="배송문의"><input type="radio" name="sel_inquiry">
	    	배송문의</label>

	    	<label title="주문문의"><input type="radio" name="sel_inquiry">
	   		주문문의</label>

		    <label title="취소문의"><input type="radio" name="sel_inquiry">
		         취소문의</label>

		    <label title="반품문의"><input type="radio" name="sel_inquiry">
		        반품문의</label>

		    <label title="교환문의"><input type="radio" name="sel_inquiry">
		        교환문의</label>

		    <label title="환불문의"><input type="radio" name="sel_inquiry">
		        환불문의</label>

		    <label title="입금문의"><input type="radio"name="sel_inquiry" >
		        입금문의</label>
		</div>
	</li>
	
	<li class="normal_inquiry">
		<div class="td1"><strong class="type">일반상담문의</strong></div>
		
		<div class="td2">
		    <label title="회원정보문의"><input type="radio" name="sel_inquiry">
		        회원정보문의</label>

		    <label title="회원제도문의"><input type="radio" name="sel_inquiry">
		        회원제도문의</label>

		    <label title="결제방법문의"><input type="radio" name="sel_inquiry">
		        결제방법문의</label>

		    <label title="상품문의"><input type="radio" name="sel_inquiry">
		        상품문의</label>

		</div>
	</li>
	
	
	<li class="etc_inquiry">
		<div class="td1"><strong class="type">기타문의</strong></div>
		
		<div class="td2">
		    <label title="시스템문의"><input type="radio" name="sel_inquiry">
		        시스템문의</label>
			 
		    <label title="기타문의"><input type="radio" name="sel_inquiry">
		        기타문의</label>

		    <label title="증빙서류문의"><input type="radio" name="sel_inquiry">
		        증빙서류문의</label>
		</div>
	</li>
	
	<li class="first">
        <div class="td1"><strong>성명</strong></div>
		<div class="td2">
			<p>${memberDTO.name }</p> 
		</div>
	</li>
	
	<li>
		<div class="td1"><strong>아이디</strong></div>
		<div class="td2">
			<p>${memberDTO.id }</p> 
		</div>
	</li>
	
	<li>
        <div class="td1"><strong class="type">이메일</strong></div>
		<div class="td2">
			<p>${memberDTO.email }</p> 
		</div>
	</li>
	
	
	<li>
		<div class="td1"><label class="type" for="u_title"><strong>제목</strong></label></div>
		<div class="td2">
			<div class="inpbx">
				<input style="width: 300px; height: 40px;" placeholder="제목을 입력하세요." type="text" id="m_title" name="title">
			</div>
		</div>
	</li>
	
	<li>
		<div class="td1"><label><strong>내용</strong></label></div>
		<div class="td2">
			<div class="inptxtbx">
				<textarea style="width:80%; resize: none; height: 140px;" cols="1" placeholder="내용을 입력하세요." rows="5" name="content" id="m_content"></textarea>
			</div>
		</div>
	</li>
	
	<li>
		<div class="td1"><strong class="type">사진첨부</strong></div>
		
		<div class="td2">
			<div style="padding-bottom: 10px;">
				<label id="m_Btn" for="u_file">파일첨부</label>
				<input class="hidden_x" id="u_file" name="files" type="file">
			</div>
				
			<div>
		        <table id="select_list">
		            <tbody id="fileTableTbody">
		                <tr>
		                    <td id="dropZone">파일을 드래그 하세요.</td>
		                </tr>
		            </tbody>
		        </table>
		    	<button id="m_Btn2" type="button">삭제</button> 
			        
			</div>

			<ul class="caution">
				<li>상품 불량 및 오배송의 경우, 해당 제품 사진을 등록 부탁드립니다.</li>
				<li id="point">파일명은 영문만 가능하며, 파일당 최대 10MB 의 용량 제한이 있습니다.</li>
				<li>가로사이즈가 450pixel을 초과하는 경우 자동으로 450픽셀로 조정됩니다.</li>
				<li>첨부파일은 최대 2개까지 등록가능합니다.</li>
			</ul>
		</div>
	</li>
</ul>
</form>
	<div style="padding-top: 10px;text-align: center;">
		<a id="m_registerBtn" href="javascript:void(0)">등록하기</a>
	</div>
</div>



<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		문의유형을 선택해주세요.
	</div>		
</div>	

<div id="dialog_frame_title">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		제목을 입력해주세요.
	</div>		
</div>	

<div id="dialog_frame_content">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		내용을 입력해주세요.
	</div>		
</div>	

<div id="dialog_frame_fileType">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		이미지 형식의 파일을 올려주세요.
	</div>		
</div>	

<div id="dialog_frame_fileTotal">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		하나의 파일만 첨부할 수 있습니다.
	</div>		
</div>


<div id="buyList_frame">
	<div id="buyList">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		<h3>주문/배송조회</h3>
		<p class="dsc">고객님의 최근 주문내역입니다. 상담을 원하시는 주문번호. 상품명을 선택해주세요.</p>
		<div>
	        <ul id="ul_buyList">
	        	<li id="li_base">
	                <div class="info">
	                    <p style="width: 170px;">주문번호</p>
	                    <p style="width: 110px;">주문일자</p>
	                    <p style="width: 100px;">결제금액</p>
	                    <p style="width: 150px;">상품명</p>
	                    <p>배송상태</p>
	                </div>
	            </li>
	    	</ul>
		</div>
		
		<div class="paging" id="findBuyListPaging" style="texet-align:center;">${paging.pagingHTML }</div>
		<input type="hidden" id="pg" value="1">
	</div>
</div>


</body>
</html>
























<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/itemView.css">
</head>
<body>
<div >
	<div  class="qa_write_wrap">
<ul class="field_section">
	<li >
		<div  class="title">
			<label  for="textField_text1">아이디</label>
		</div>
		
		<div  class="field">
			<div  class="field_id"></div>
		</div>
	</li>
	<li >
		<div  class="title">
			<label  for="textField_text2">이메일주소</label>
		</div>
		<div  class="field">
			<div  class="inpbx">
				<input  id="textField2" name="q_mail" type="text" class="">
			</div>

    <input  type="checkbox">
    <label  title="답변메일받기">답변메일받기</label>
		</div>
	</li>
	<li >
		<div  class="title">
			<label for="textField_text3">문의내용</label>
		</div>
		<div  class="field">
			
    <select  class="">
        <option value="0">상품문의</option>
        <option value="1">재입고문의</option>
        <option value="2">사이즈문의</option>
        <option value="3">배송문의</option>
        <option value="4">기타</option>
    </select>

			<div  class="write_inptxtbx">
				<textarea  class="" cols="1" name="q_content" placeholder="질문은 입력해주세요." rows="5" value="문의내용 작성"></textarea>
			</div>
		</div>
	</li>
</ul>

		<div  class="write_btnbx">
			<button  class="btn_cls">닫기</button>
			<button  class="btn_save">등록</button>
		</div>
	</div>
</div>
</body>
</html>
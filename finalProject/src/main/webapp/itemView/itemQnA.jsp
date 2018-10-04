<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="position: relative; padding: 24px 30px 30px; background: #f5f5f5;">
	<ul style="list-style: none;">
		<li style="display: table; width: 100%; table-layout: fixed;">
			<div style="width: 80px; display: table-cell;">
				<label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">아이디</label>
			</div>
			<div style="display: table-cell;">
				<div style="height: 40px; padding: 0 14px; font-size: 14px; color: #303033; line-height: 40px;">${sesscionScope.memberDTO.name}</div>
			</div>
		</li>
		<li style="margin-top: 10px; display: table; width: 100%; table-layout: fixed;">
			<div style="width: 80px; display: table-cell;">
				<label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">이메일 주소</label>
			</div>
			<div style="display: table-cell;">
				<div style="display: inline-block; width: 260px; background: #fff;">
					<input type="text" style="width: 80%; height: 40px; padding: 0 14px; font-size: 15px; color: #1a1a1a; border: 0; outline: none;">
				</div>
				<span style="display: inline-block; margin: 9px 0 -9px 8px; color: #5d5d5d;">
					<input type="checkbox">
					<label style="display: inline-block; position: relative; cursor: pointer;">답변메일받기</label>
				</span>
			</div>
		</li>
		<li style="margin-top: 10px; display: table; width: 100%; table-layout: fixed;">
			<div style="width: 80px; display: table-cell;">
				<label style="display: inline-block; font-size: 14px; font-weight: 400; color: #303033;">문의내용</label>
			</div>
			<div style="display: table-cell;">
				<span style="width: 245px; height: 35px; background: #fff; display: inline-block; position: relative; height: 40px; padding: 9px 0 0 14px; border: 1px solid #d4d4d4;">
					<select style="display: block; width: 100%; height: 100%; margin: -4px 0 0; padding: 0; border : 0 none; background: #fff; font-size: 14px; line-height: 30px; outline: none;">
						<option>상품문의</option>
						<option>재입고문의</option>
						<option>사이즈문의</option>
						<option>배송문의</option>
						<option>기타</option>
					</select>
				</span>
				<div style="margin-top: 10px; border: 1px solid #d4d4d4; backtround: #fff;">
					<textarea placeholder="질문은 최대 5자 이상 입력해 주세요." rows="5" value="문의내용 작성" style="background: #fff; width: 100%; padding: 0; font-size: 13px; line-height: 24px;"></textarea>
				</div>
			</div>
		</li>
	</ul>
	<div style="margin-top: 10px; text-align: right;">
		<button style="background: #fff; border: 1px solid #d4d4d4; font-weight: 700; font-size: 13px; width: 82px; height: 40px; vertical-align: bottom; line-height: 40px;">닫기</button>
		<button style="background: #303033; font-size: 13px; line-height: 40px;  font-weight: 700; color: #fff; width: 82px; height: 40px; vertical-align: bottom;">등록</button>
	</div>
</div>
</body>
</html>
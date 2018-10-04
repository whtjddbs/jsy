<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
<style>
.option_lstbx {
	width: 100%;
	height: auto;
	overflow: hidden;
	margin-bottom: 30px;
	margin-top: 20px;
	
}
.option_result {
	float: left;
	width: 10%;
}
.option_num{
	float: left;
	width: 30%;
}

.option_price{
	float: right;
	width: 20%;
}
.numcountbx button{
	float: left;
	position: relative;
    width: 28px;
    height: 28px;
    border: 1px solid #cdcdcd;
    border-radius: 0;
    background: #fff;
    font-size: 15px;
    color: #5d5d5d;
    cursor: pointer;
    text-decoration: none;
    margin: 0px;

}
.numcountbx input{
	float: left;
	width: 35px;
    height: 28px;
    border: 1px solid #cbcbcb;
    border-width: 1px 0;
    margin: 0px;
    font-size: 13px;
    color: #666;
    text-align: center;
    box-sizing: border-box;
}


#deleteBtn{
	overflow: visible;
    width: 16px;
    height: 16px;
    margin: -2px 0 2px 7px;
    padding: 1px;
    box-sizing: border-box;
    background: transparent;
    position: fixed;
}

.result_total{
	border-top: 2px solid #000;
	text-align: right;
    line-height: 32px;
}

.num{
	font-size: 22px;
    color: #ff4800;
}

.material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-smoothing: antialiased;
 }
</style>
</head>
<body>
			<div  class="option_resultbx" id="select_hidden" method="post">
                <div  class="option_lstbx">
                      <div  class="option_result">
                        	<span>55</span>
                      </div>
                      <div  class="option_num">
                        <span  class="numcountbx">
							<button  type="button" >-</button>
							<input  type="text" value="1">
							<button  type="button">+</button>
						</span>
                      </div>
                      <div  class="option_price">
                          <span  class="price">169,000원
                          	<i class="material-icons" id="deleteBtn">highlight_off</i>
                          </span>
                      </div>
                </div>
                <div  class="result_total">
                    <span  class="total_price">총 상품 금액</span>
                    <span  class="num"><span >169,000</span>원</span>
                </div>
 			</div>
</body>
</html>
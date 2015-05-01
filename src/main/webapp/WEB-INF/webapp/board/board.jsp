<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board.jsp</title>
<script type="text/javascript" src="/jquery/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin.js"></script>
<script type="text/javascript">
var tokenInfo = { accessToken:"" , refreshToken:"" };
function checkLoginState() {
	var state = $.cookie("state_token");
	if(naver.checkAuthorizeState(state) === "connected") {
		//정상적으로 Callback정보가 전달되었을 경우 Access Token발급 요청 수행
		naver.getAccessToken(function(data) {
			if(data.error === "fail") {
				//access token 생성 요청이 실패하였을 경우에 대한 처리
			    return ; 
			}
			tokenInfo.access_token = data.access_token;
			tokenInfo.refresh_token = data.refresh_token;
			console.log("success to get access token", data);
		});
	} else {
		//Callback으로 전달된 데이터가 정상적이지 않을 경우에 대한 처리
		return ;
	}
}
</script>

</head>
<body>
<h1>호롤롤롤</h1>
</body>
</html>
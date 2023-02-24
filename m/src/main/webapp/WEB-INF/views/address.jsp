<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>주소 테스트 화면</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function openAddressPopup(){
    	var themeObj = {
    			   bgColor: "#162525", //바탕 배경색
    			   searchBgColor: "#162525", //검색창 배경색
    			   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    			   pageBgColor: "#162525", //페이지 배경색
    			   textColor: "#FFFFFF", //기본 글자색
    			   queryTextColor: "#FFFFFF", //검색창 글자색
    			   //postcodeTextColor: "", //우편번호 글자색
    			   //emphTextColor: "", //강조 글자색
    			   outlineColor: "#444444" //테두리
    			};
    	var width = 500; //팝업의 너비
    	var height = 600; //팝업의 높이
        new daum.Postcode({

        	   theme: themeObj,
        	width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
            height: height,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                console.log(data);
                document.getElementById("a1").value = data.address;
                document.getElementById("a2").value = data.jibunAddress;
                document.getElementById("a3").value = data.roadAddress;
            }
        }).open({
        	popupKey: 'popup1',
        	left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2),
            q: document.getElementById("t").value
        });
    }
</script>
</head>
<body>
	<input type="text" id="t">
	<br>
	<input type="button" onclick="openAddressPopup()" value="주소검색">
	<br>
	<input type="text" id="a1" style="width: 1000px">
	<br>
	<input type="text" id="a2" style="width: 1000px">
	<br>
	<input type="text" id="a3" style="width: 1000px">
	<br>

</body>
</html>

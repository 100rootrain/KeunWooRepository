<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<style>
table{
   margin:auto;
}
td {
   text-align: center;
   border: 1px solid gray;
   border-collapse: collapse;
}
.t1{
   width:100px;
}

.t2{
   width:200px;
}

input[type='text']{
   width:98%;
}


</style>
<script>
   function fnSave() {
      console.log($("#frm").serialize());
      $.ajax({
         url : "insertUser",   //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
         type : "POST",   //요청 방식 - GET:조회, POST:입력
         cache : false,   //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
         data : $("#frm").serialize(),   
         success : function(data) {   //데이터 송,수신에 성공했을 경우의 동작
            alert("저장되었습니다.");
         },
         error : function(request, status, error) {   // 오류가 발생했을 경우의 동작
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   }
</script>
</head>
<body>
   <form id="frm">
      <table>
         <tr>
            <td class="t1">아이디</td>
            <td class="t2"><input type="text" name="id"></td>
         </tr>
         <tr>
            <td class="t1">비밀번호</td>
            <td class="t2"><input type="text" name="pw"></td>
         </tr>
         <tr>
            <td class="t1">이름</td>
            <td class="t2"><input type="text" name="name"></td>
         </tr>
         <tr>
            <td class="t1">휴대폰</td>
            <td class="t2"><input type="text" name="tel"></td>
         </tr>
         <tr>
            <td class="t1">이메일</td>
            <td class="t2"><input type="text" name="email"></td>
         </tr>

         <tr>
            <td class="t1">주소</td>
            <td class="t2"><input type="text" name="address"></td>
         </tr>

         <tr>
            <td colspan="2"><input type="button" value="저장"
               onclick="fnSave()"></td>
         </tr>
      </table>
   </form>
</body>
</html>
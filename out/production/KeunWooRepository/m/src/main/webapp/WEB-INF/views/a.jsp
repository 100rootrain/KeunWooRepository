<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>

<script>
   function move() {

      var a = document.getElementById("b").val;
      console.log(a);
      location.href="/a1?a="+a;
      

   }
</script>
<title>a</title>
</head>
<body>



   <table>
      <tr>
         <td id="b">abababab</td>

      </tr>
      <tr>
         <td><input type="button" value="a1 이동" onclick="move()"></td>
      </tr>
   </table>
</body>

</html>
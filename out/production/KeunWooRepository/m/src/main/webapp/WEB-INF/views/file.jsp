<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script>
   function upload() {
      var file = $("#file")[0];
      // 파일을 여러개 선택할 수 있으므로 files 라는 객체에 담긴다.
      console.log("file: ", file.files)

      if (file.files.length === 0) {
         alert("파일은 선택해주세요");
         return;
      }

      const formData = new FormData();
      
      for(var i=0; i<file.files.length; i++){
         formData.append("file_"+i, file.files[i]);
      }

      $.ajax({
         type : "POST",
         url : "/uploadFile",
         processData : false,
         contentType : false,
         data : formData,
         success : function(data) {
            console.log(data);
            //$("#resultUploadPath").text(message.uploadFilePath);
            var t = "";
            for(var i=0; i<data.length; i++){
               t += "<a href='/downloadFile?fileName="+data[i]+"' download>"+data[i]+"</a><br>";
            }
            console.log(t);
            $("#result").html(t);
            
         },
         err : function(err) {
            console.log("err:", err)
         }
      })
   }
</script>
</head>
<body>
   <p>이미지 업로드 테스트 창</p>
   <div>
      <form id="uploadForm" enctype="multipart/form-data">
         <input type="file" id="file" multiple/> <!-- multiple 속성을 추가하면 파일을 여러개 선택가능 -->
      </form>
      <hr />
      <button onclick="upload()">업로드</button>
      <hr />
      <p>업로드결과:</p>
      <div id="result">
      
      </div>
   </div>
</body>
</html>
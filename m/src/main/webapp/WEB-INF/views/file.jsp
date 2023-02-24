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
      // ������ ������ ������ �� �����Ƿ� files ��� ��ü�� ����.
      console.log("file: ", file.files)

      if (file.files.length === 0) {
         alert("������ �������ּ���");
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
   <p>�̹��� ���ε� �׽�Ʈ â</p>
   <div>
      <form id="uploadForm" enctype="multipart/form-data">
         <input type="file" id="file" multiple/> <!-- multiple �Ӽ��� �߰��ϸ� ������ ������ ���ð��� -->
      </form>
      <hr />
      <button onclick="upload()">���ε�</button>
      <hr />
      <p>���ε���:</p>
      <div id="result">
      
      </div>
   </div>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="\resources\ckeditor\ckeditor.js"></script>
<style>

</style>
<script>
window.onload = function (){
	ClassicEditor
    .create( document.querySelector( '#txt' ) )
    .then( editor => {
    	editor.ui.view.editable.element.style.height = '500px';
        console.log( editor );
    } )
    .catch( error => {
        console.error( error );
    } );
	
}
</script>
</head>
<body>
<div id="txt" style="width:1000px; height:700px"></div>
</body>
</html>

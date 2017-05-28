<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>吉他搜索结果</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/layoutit.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/jquery.htmlClean.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript">
$(function(){
	$('#addbtn').linkbutton({
		onClick:function(){
			$('#addwin').window('open');
		}
	});

	$('#addwin').window({
		width:300,
		title:'添加guitar',
		collapsible:true,
		minimizable:true,
	    maximizable:false, 
	    closable:true,
	    draggable:true,
	    closed:true
		
	});
    $('#btnCancel').click(function(){
    	$('#addwin').window('close');
	});	

})
function save(){
	$('#addform').form('submit',{
		url:'addGuitar.action',
		success: function(){
				$('#addwin').window('close');				
				alert("添加成功！")
		}
	});
};


</script>
<style>
* {
	padding:0;
	margin:0;
}
.wrap {
	width:1200px;
	margin:20px auto 0;
}
table {
	border-collapse:collapse;
	border-spacing:0;
	border:1px solid #c0c0c0;
	width:1000px;
}
th,td {
	border:1px solid #d0d0d0;
	color:#404060;
	padding:10px;
}
th {
	background-color:#09c;
	font:bold 16px "微软雅黑";
	color:#fff;
}
td {
	font:14px "微软雅黑";
}
tbody tr {
	background-color:#f0f0f0;
}
tbody tr:hover {
	cursor:pointer;
	background-color:#fafafa;
}
</style>
</head>
<body>
<p><font size="6" color="blue">吉他展示结果</font></p>
<div class="wrap">
    <table>
        <thead>
            <tr>
                <th>
                    <input type="checkbox" id="j_cbAll" />
                </th>
                <th>serialNumber</th>
                <th>price</th>
                <th>builder</th>
                <th>model</th>
                <th>type</th>
                <th>backWood</th>
                <th>topWood</th>
            </tr>
        </thead>
        
        <tbody id="j_tb">
        <s:iterator value="#session.list1" id="Guitar">
            <tr>
                <td>
                    <input type="checkbox" />
                </td>
                <td><s:property value="#Guitar.serialNumber"/></td>
			    <td><s:property value="#Guitar.price"/></td>
			    <td><s:property value="#Guitar.spec.builder"/></td>
			    <td><s:property value="#Guitar.spec.model"/></td>
			    <td><s:property value="#Guitar.spec.type "/></td>
			    <td><s:property value="#Guitar.spec.backWood"/></td>
			    <td><s:property value="#Guitar.spec.topWood"/></td>
            </tr>
             </s:iterator>
        </tbody>
       
    </table>
  
			 <a href="findall" class="btn btn-primary"  type="submit">查看全部</a>
</div>

<script>
 var all = document.getElementById("j_cbAll");
 var tbody = document.getElementById("j_tb");
 var checkboxs = tbody.getElementsByTagName("input");
 all.onclick = function() {
     for (var i = 0; i < checkboxs.length; i++) {
         var checkbox = checkboxs[i];
         checkbox.checked = this.checked;
     }
 };
 for (var i = 0; i < checkboxs.length; i++) {
     checkboxs[i].onclick = function() {
         var isCheckedAll = true;
         for (var i = 0; i < checkboxs.length; i++) {
             if (!checkboxs[i].checked) {
                 isCheckedAll = false;
                 break;
             }
         }
         all.checked = isCheckedAll;
     };
 }</script>
 
</body>
</html>

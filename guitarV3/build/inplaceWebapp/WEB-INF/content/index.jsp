<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/layoutit.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/jquery.htmlClean.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <link rel="stylesheet" href="css/easyui.css" />
	<link rel="stylesheet" href="css/icon.css" />
	<link rel="stylesheet" href="css/demo.css" />
    <script src="js/eajquery.min.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
<meta charset="utf-8">
<title>全部吉他</title>

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
<center>
<p><font size="6" color="blue">全部吉他</font></p>
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
                <th>删除吉他</th>
            </tr>
        </thead>
        
        <tbody id="j_tb">
         <s:iterator value="#session.listAll" id="Guitar">
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
			    <td><a href="deleGuitar?serialNumber=<s:property value="#Guitar.serialNumber"/>">删除</a></td>
            </tr>
            </s:iterator>
        </tbody>   
      
    </table>
</div>

<br /><br /><br />
<button id="addbtn" class="easyui-linkbutton">添加吉他</button>
	<div id="addwin">
	添加一个新的guitar，请输入其信息：
		<form id="addform" method="post" enctype="multipart/form-data" action="addGuitar">
		<br /><br />
			<div>
				<label for="serialNumber">serialNumber：</label>
				<input id="serialNumber" name="serialNumber"/>
			</div><br />
			<div>
				<label for="price">price：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="price" name="price"/>
			</div><br />
			<div>
				<label for="builder">builder：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="builder" name="builder"/>
			</div><br />
			<div>
				<label for="model">model：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="model" name="model"/>
			</div><br />
			<div>
				<label for="type">type：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="type" name="type"/>
			</div><br />
			<div>
				<label for="backWood">backWood：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="backWood" name="backWood"/>
			</div><br />
			<div>
				<label for="topWood">topWood：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input id="topWood" name="topWood"/>
			</div><br />

			<a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" onclick="save()">添加</a> 
    		<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a> 
		</form>	
	</div>	
<script type="text/javascript">
$(function(){
	$('#addbtn').linkbutton({
		onClick:function(){
			$('#addwin').window('open');
		}
	});

	$('#addwin').window({
		width:300,
		title:'添加吉他',
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
				location.reload();
		}
	});
};


</script>
</center>	
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

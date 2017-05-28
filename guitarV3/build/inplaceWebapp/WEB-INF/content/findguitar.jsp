 <%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
 <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<title>
		搜索界面
	</title>
	<meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="custom/favicon.ico"/>
        <!-- Bootstrap core CSS -->
        
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        
        <link href="css/bootstrap-reset.css" rel="stylesheet" />
        <link href="css/typeaheadjs.css" rel="stylesheet" />
     

        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/bootstrap-datepicker/Content/bootstrap-datepicker.css" rel="stylesheet" />
        
        <link href="assets/jquery-multi-select/css/multi-select.css" rel="stylesheet" />
        
    
        <!-- Custom styles for this template -->
        
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-responsive.css" rel="stylesheet" />
        
        <link href="css/open-sans-font.css" rel="stylesheet" />
        <link href="css/custom.css" rel="stylesheet" />
        <link href="css/task.css" rel="stylesheet" />


    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="vendor/jquery/jquery-1.10.2.min.js"></script>
  
    <script type="text/javascript" src="js/Ajax.js"></script>    
    <!--common script for all pages-->
      <script type="text/javascript" src="vendor/jquery/jquery-1.10.2.min.js"></script>
      <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="dist/js/formValidation.js"></script>
    <script type="text/javascript" src="dist/js/framework/bootstrap.js"></script>
    <script type="text/javascript" src="dist/js/language/zh_CN.js"></script>
    <script src="assets/bootstrap-accessibility-plugin/js/bootstrap-accessibility.min.js"></script>
     <script src="assets/jquery-multi-select/js/jquery.multi-select-0.9.11.min.js"></script>
    <script src="assets/jquery-knob/js/jquery.knob.1.2.8.min.js"></script>
    <script type="text/javascript" src="js/typeahead.bundle-0.10.2.min.js"></script>
    
    <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
        <script src="js/common-scripts.js"></script>
    
     <link rel="stylesheet" href="dist/css/bootstrapValidator.css"/>  
    
    <!-- Get jQuery from the Microsoft CDN and fallback to the local copy, if not available -->
</head>
<body>
<center>
<p><font size="6" color="blue">吉他搜索</font></p>
<form action="findmm" method="post">
<br>Builder<br>
<input type="text" name="builder" value="">
<br>Model<br>
<input type="text" name="model" value="">
<br>Type<br>
<input type="text" name="type" value="">
<br>BackWood<br>
<input type="text" name="backWood" value="">
<br>TopWood:<br>
<input type="text" name="topWood" value="">
<br><br>
<input type="submit" value="Submit">
</form> 
<p>If you click "Submit", the form-data will be sent to a page called "action_page.php".</p>

	</center>	
</body>
</html>
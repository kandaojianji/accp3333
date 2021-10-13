<%--
  Created by IntelliJ IDEA.
  User: xzh
  Date: 2021/10/13
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>园区门禁管理系统新增用户界面</title>
</head>
<body>
<form action="/add" method="post">
    <table border="2" width="280px">
        <tr>
            <td colspan="2">
                <h3>园区门禁管理系统</h3>
            </td>
        </tr>
        <tr>
            <td>负责人(*)</td>
            <td>
                <input type="text" name="principal" id="principal">
            </td>
        </tr>
        <tr>
            <td>供货商(*)</td>
            <td>
                <input type="text" name="supplier" id="supplier">
            </td>
        </tr>
        <tr>
            <td>品牌(*)</td>
            <td>
                <input type="text" name="brand" id="brand">
            </td>
        </tr>
        <tr>
            <td>所属楼宇(*)</td>
            <td>
                <select name="hospital_id" id="hospital_id">
                    <option value="-1">请选择</option>
                    <c:forEach var="p" items="${list}">
                        <option value="${p.id}">${p.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>安装日期(*)</td>
            <td>
                <input type="text" name="add_time" id="add_time">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button><a href="/show">返回</a></button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script src="${pageContext.request.contextPath}/stat/jquery-1.12.4.js"></script>
<script>
    $(function () {
       $("form").submit(function () {
           var principal=$("#principal").val();
           var supplier=$("#supplier").val();
           var brand=$("#brand").val();
           var hospital_id=$("#hospital_id").val();
           var add_time=$("#add_time").val();
           if(principal==null||principal==''){
               alert("请填写完整的门禁信息");
               return false;
           }
           if(supplier==null||supplier==''){
               alert("请填写完整的门禁信息");
               return false;
           }
           if(brand==null||brand==''){
               alert("请填写完整的门禁信息");
               return false;
           }
           if(hospital_id==''||hospital_id==null||hospital_id==-1){
               alert("请选择所属楼宇");
               return false;
           }
           if(add_time==null||add_time==''){
               alert("日期格式不正确,请填写完整的门禁信息");
               return false;
           }
           return true;
       }) ;
    });
</script>

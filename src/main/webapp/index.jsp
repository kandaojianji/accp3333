<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xzh
  Date: 2021/10/11
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>门禁管理系统</title>
</head>
<script src="${pageContext.request.contextPath}/stat/jquery-1.12.4.js"></script>
<script type="text/javascript">
    function topage(pageIndex) {
        $("#pageIndex").val(pageIndex);
        $("form").submit();
    }
</script>
<body>
<h1>园区门禁管理系统</h1>
<form id="/show" method="post">
    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
    <select id="sel" name="hospital_id">
    </select>
    <input type="submit" value="查询" id="btn">
</form>
<a href="/toadd">添加</a>
<table>
    <thead id="aa">
        <td>负责人</td>
        <td>供应商</td>
        <td>品牌</td>
        <td>所属楼宇</td>
        <td>安装日期</td>
        <td>运行状态</td>
        <td>操作</td>
    </thead>
    <c:forEach items="${page.list}" var="p">
        <tr>
            <td>${p.principal}</td>
            <td>${p.supplier}</td>
            <td>${p.brand}</td>
            <td>${p.budName}</td>
            <td>${p.add_time}</td>
            <td>${p.staus==0?"停用":"启用"}</td>
            <td>
                <c:if test="${p.staus==0}">
                    <a href="/update/${p.id}" id="qi">启用</a>
                </c:if>
                <c:if test="${p.staus==1}">
                    <a href="/update2/${p.id}" id="ting">停用</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <tbody id="tbody">

    </tbody>
</table>
  第${page.pageIndex}页/共${page.pageCount}页
<c:if test="${page.pageIndex>1}">
    <a href="javascript:topage(1)">首页</a>
    <a href="javascript:topage(${page.pageIndex-1})">上一页</a>
</c:if>
<c:if test="${page.pageIndex<page.pageCount}">
    <a href="javascript:topage(${page.pageIndex+1})">下一页</a>
    <a href="javascript:topage(${page.pageCount})">末页</a>
</c:if>
<div id="div"></div>
</body>
</html>
<script src="stat/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/statics/jquery-1.12.4.min.js"></script>
<script>
    $(function () {
        show()
    });
    function show() {
        var hospital_id=$("#sel").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/show",
            data:{"hospital_id":hospital_id},
            dataType:"json",
            type:"post",
            success:function (result) {
                var slist=result.list;
                var ssp="";
                ssp+="<option value='-1'>请选择</option>"
                for(var s=0;s<slist.length;s++){
                    ssp+="<option value='"+slist[s].id+"'>"+slist[s].name+"</option>";
                }
                $("#sel").html(ssp);
                $("#aa").css("background","Pink");
                $("table tbody tr:even").css("background-color","cyan");
                $("table tbody tr:odd").css("background-color","Pink");
            }
        });
    }
   $(function () {
       $("#ting").click(function () {
           var msg="确定要停用吗";
           if (confirm(msg)){
                alert("禁用成功");
           }
       });
   });
    $(function () {
        $("#qi").click(function () {
            var msg="确定要启吗";
            if (confirm(msg)){
                alert("启用成功");
            }
        })
    })
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/common/global.jsp" %>
    <%@ include file="/common/styles.jsp" %>
    <%@ include file="/common/meta.jsp" %>
    <title>首页列表</title>
</head>
<script type="text/javascript">
    function removeData(e, id) {
        $.ajax({
            type: "DELETE",
            url: "${ctx}/homePage/" + id,
            success: function (data) {
                $(e).parents("tr").remove();
                $("#alert").attr("class", "alert alert-success");
                if (0 == data) {
                    $("#alert_text").html("数据不存在,或者已删除");
                } else {
                    $("#alert_text").html("数据删除成功");
                }
                $("#alert").css("display", "block");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $("#alert").attr("class", "alert alert-error");
                $("#alert_text").html("删除失败!");
                $("#alert").css("display", "block");
            }});
    }

</script>
<body>
<%@ include file="/header.jsp" %>
<div class="container" style="background: #FFF">

    <div>
        <ul class="breadcrumb">
            <li><a target="homePages" href="${ctx }/homePages">首页</a> <span class="divider">/</span></li>
            <li style="float: right"><a href="${ctx }/homePage">添加</a> <span class="divider">/</span></li>
        </ul>
    </div>
    <div id="alert" class="alert alert-error" style="display: none">
        <button type="button" class="close">×</button>
        <strong id="alert_text"></strong>
    </div>
    <div>
        <table class="table table-condensed">
            <tr>
                <th>#</th>
                <th>图片名称</th>
                <th>图片链接</th>
                <th>排序值</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${homePages }" var="homePage" varStatus="status">
                <tr class="info">
                    <td><strong>${status.index }</strong></td>
                    <td>${homePage.name }</td>
                    <td>${homePage.url }</td>
                    <td>${homePage.sort }</td>
                    <td>
                        <a href="${ctx}/homePage/${homePage.id}" class="btn btn-small btn-primary"
                           target="${homePage.id }">编辑</a>
                        <button class="btn btn-small btn-danger" type="button"
                                onclick="removeData(this, '${homePage.id}')">删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>


</div>

</body>
<script type="text/javascript">
    $(function () {
        $(".close").click(function () {
            $(this).parent().hide();
        });
    });
</script>
</html>
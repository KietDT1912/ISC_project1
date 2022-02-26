<%-- 
    Document   : sidebarComponent
    Created on : Apr 28, 2021, 5:39:16 PM
    Author     : AdMins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-3">

    <h1 class="my-4">Shop Name</h1>
    <div class="list-group">
        <c:forEach items="${listCategory}" var="C">
            <a href="filter?categoryId=${C.id}" class="list-group-item">${C.categoryName}</a>
        </c:forEach>
    </div>

</div>

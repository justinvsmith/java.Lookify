<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/lookify.css" />
</head>
<body>
	<div class="wrapper">
	<div class="header">
	<div class="left">
		<div class="links">
		 <p>Top Ten Songs:</p>
		</div>
		<div class="links">
		</div>
	</div>
	<div class="right">
		<a href="/dashboard">Dashboard</a>
	</div>
	</div>
	<div class="main">
	<table class="showSong">
    <thead>
    </thead>
    <tbody>
        <c:forEach items="${song}" var="song">
        <tr>
            <td><c:out value="${song.rating}" /> - <a href="/songs/${song.id}"><c:out value="${song.title}"/></a> - <c:out value="${song.artist}" /></td>
        </tr>
        </c:forEach>
    </tbody>
</table>
	</div>
	</div>
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dashboard</title>
<link rel="stylesheet" href="../css/lookify.css" />
</head>
<body>
	<div class="wrapper">
	<div class="header">
	<div class="left">
		<div class="links">
		<p>Songs by artist: <c:out value="${songs.artist}" /></p>
		</div>
		<div class="links">
		</div>
	</div>
	<div class="right">
		<div class="row">
			<form:form action="/searchSong" method="POST" modelAttribute="songs">
				<form:input path="artist" />
				<input type="submit" value="New Search" />
			</form:form>
		</div>
		<div><a href="/dashboard">Dashboard</a></div>
	</div>
	</div>
	<div class="main">
<table class="songTable">
    <thead>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${music}" var="song">
        <tr>
            <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
            <td><c:out value="${song.rating}"/></td>
            <td><form class="toDelete" action="/languages/${song.id}" method="POST">
    			<input type="hidden" name="_method" value="delete">
   				<input class="delete" type="submit" value="Delete">
			</form>
        </tr>
        </c:forEach>
    </tbody>
</table>
	</div>
		
	</div>
</body>
</html>
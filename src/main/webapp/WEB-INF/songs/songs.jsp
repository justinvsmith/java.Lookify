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
	</div>
	<div class="right">
		<a href="/dashboard">Dashboard</a>
	</div>
	</div>
	<div class="main">
	<table class="showSong">
		<tr>
			<td>Title</td>
			<td><c:out value="${song.title}" /></td>
		</tr>
		<tr>
			<td>Artist</td>
			<td><c:out value="${song.artist}" /></td>
		</tr>
		<tr>
			<td>Rating (1-10)</td>
			<td><c:out value="${song.rating}" /></td>
		</tr>
		<tr>
		<td><form class="toDelete" action="/languages/${song.id}" method="POST">
    			<input type="hidden" name="_method" value="delete">
   				<input class="delete" type="submit" value="Delete">
			</form></td>
			<td></td>
		</tr>
	</table>
	</div>
	</div>

</body>
</html>
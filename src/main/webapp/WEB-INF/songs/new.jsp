<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

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
	<form:form action="/newSong" method="POST" modelAttribute="songs">
    <input type="hidden" name="method" value="put">
    <p>
        <form:errors path="title"/> <br />
        <form:label path="title">Title</form:label>
        <form:input path="title"/>
    </p>
    <br />
    <p>
        <form:errors path="artist"/><br />
        <form:label path="artist">Creator</form:label>
        <form:textarea path="artist"/>
    </p>
    <br />
    <p>
        <form:errors path="rating"/><br />
        <form:label path="rating">Rating (1-10)</form:label>
        <form:select path="rating">
        <form:option value="1" label="1" />
        <form:option value="2" label="2" />
        <form:option value="3" label="3" />
        <form:option value="4" label="4" />
        <form:option value="5" label="5" />
        <form:option value="6" label="6" />
        <form:option value="7" label="7" />
        <form:option value="8" label="8" />
        <form:option value="9" label="9" />
        <form:option value="10" label="10" />
        </form:select>
    </p>   
    <input type="submit" value="Add Song"/>
</form:form>
	</div>
		
	</div>
</body>
</html>
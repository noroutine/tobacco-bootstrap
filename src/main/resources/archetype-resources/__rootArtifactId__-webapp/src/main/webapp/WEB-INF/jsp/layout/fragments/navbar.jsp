#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%--
 @author Oleksii Khilkevych
 @since 02.12.12
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="home"><spring:message code="project.name"/> </a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="home">Home</a></li>
                    <li><a href="demo">Demo</a></li>
                    <li><a href="about">About</a></li>
                </ul>
                <ul class="nav pull-right">
                    <li><a href="contact">Contact</a></li>
                </ul>
            </div> <!--/.nav-collapse -->
        </div>
    </div>
</div>
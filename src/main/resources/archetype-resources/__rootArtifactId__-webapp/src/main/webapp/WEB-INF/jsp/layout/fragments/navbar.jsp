#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="tb" uri="/WEB-INF/taglib/taglib.tld" %>

<tiles:importAttribute name="view" toName="selectedView" />

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="home"><spring:message code="project.name"/></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <c:forEach var="item" items="home,about">
                        <spring:message code="navbar.${symbol_dollar}{item}.title" var="itemTitle"/>
                        <c:choose>
                            <c:when test="${symbol_dollar}{item eq selectedView}">
                                <li class="active"><a href="${symbol_dollar}{item}">${symbol_dollar}{itemTitle}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${symbol_dollar}{item}">${symbol_dollar}{itemTitle}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
                <ul class="nav pull-right">
                    <c:forEach var="item" items="contact">
                        <spring:message var="itemTitle" code="navbar.${symbol_dollar}{item}.title" />
                        <c:choose>
                            <c:when test="${symbol_dollar}{item eq selectedView}">
                                <li class="active"><a href="${symbol_dollar}{item}">${symbol_dollar}{itemTitle}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${symbol_dollar}{item}">${symbol_dollar}{itemTitle}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div> <!--/.nav-collapse -->
        </div>
    </div>
</div>
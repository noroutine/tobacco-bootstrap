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

<%--
This is the dynamic remake of http://getbootstrap.com/components/#navbar
--%>
<nav class="navbar navbar-inverse">
    <%-- Brand and toggle get grouped for better mobile display --%>
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<spring:url value="/home" />"><spring:message code="project.name"/></a>
    </div>

    <%-- Collect the nav links, forms, and other content for toggling --%>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
            <c:forEach var="item" items="home,about">
                <spring:message code="navbar.${symbol_dollar}{item}.title" var="itemTitle"/>
                <c:choose>
                    <c:when test="${symbol_dollar}{item eq selectedView}">
                        <li class="active"><a href="<spring:url value="/${symbol_dollar}{item}" />">${symbol_dollar}{itemTitle}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<spring:url value="/${symbol_dollar}{item}" />">${symbol_dollar}{itemTitle}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:forEach var="item" items="contact">
                <spring:message var="itemTitle" code="navbar.${symbol_dollar}{item}.title"/>
                <c:choose>
                    <c:when test="${symbol_dollar}{item eq selectedView}">
                        <li class="active"><a href="<spring:url value="/${symbol_dollar}{item}" />">${symbol_dollar}{itemTitle}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<spring:url value="/${symbol_dollar}{item}" />">${symbol_dollar}{itemTitle}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </div> <%-- /.navbar-collapse --%>
</nav>
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

<spring:message code="build.profile" var="build_profile"/>

<c:choose>
    <c:when test="${symbol_dollar}{build_profile eq 'production'}">
        <util:css href="/resources/vendor/css/all.css" />
        <util:css href="/resources/css/all.css" />
    </c:when>
    <c:otherwise>

        <%-- HTML5 boilerplate, see: http://html5boilerplate.com/--%>
        <%--<util:css href="/resources/vendor/css/normalize-2.1.3.css" />--%>
        <%--<util:css href="/resources/vendor/css/boilerplate-4.2.0.css" />--%>

        <%-- Twitter Bootstrap, see: http://getbootstrap.com/ --%>
        <util:css href="/resources/vendor/css/bootstrap-3.0.0.css" />
        <util:css href="/resources/vendor/css/bootstrap-theme-3.0.0.css" />

        <util:css href="/resources/css/main.css" />
    </c:otherwise>
</c:choose>
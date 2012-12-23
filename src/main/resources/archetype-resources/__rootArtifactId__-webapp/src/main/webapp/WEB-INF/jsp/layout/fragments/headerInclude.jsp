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
        <util:css href="/resources/css/all.css" />
    </c:when>
    <c:otherwise>

        <%-- HTML5 boilerplate, see: http://html5boilerplate.com/--%>
        <%--<util:css href="/resources/css/vendor/normalize-1.0.2.css" />--%>
        <%--<util:css href="/resources/css/vendor/boilerplate-4.0.2.css" />--%>

        <%-- Twitter Bootstrap, see: http://twitter.github.com/bootstrap/ --%>
        <util:css href="/resources/css/vendor/bootstrap-2.2.2.css" />
        <util:css href="/resources/css/vendor/bootstrap-responsive-2.2.2.css" />

        <util:css href="/resources/css/main.css" />
    </c:otherwise>
</c:choose>
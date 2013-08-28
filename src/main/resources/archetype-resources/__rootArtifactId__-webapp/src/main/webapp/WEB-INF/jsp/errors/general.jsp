#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" isErrorPage="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="tb" uri="/WEB-INF/taglib/taglib.tld" %>

<div class="text-muted">
    <h1>Oops!</h1>
    <p class="lead">Terrible things happened... We are sorry...</p>

    <c:if test="${symbol_dollar}{pageContext.errorData.statusCode eq 500}">
        <h3>Stacktrace</h3>
        <pre style="font-size: 75%;">${symbol_dollar}{tb:getFullStackTrace(pageContext.exception)}</pre>
    </c:if>
</div>
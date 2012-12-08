<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tb" uri="/WEB-INF/taglib/taglib.tld" %>

<spring:message code="build.profile" var="build_profile"/>
<spring:message code="build.number" var="build_version"/>

<%@ attribute name="value" type="java.lang.String" required="true" rtexprvalue="true"
              description="URL" %>

<%@ attribute name="defer" type="java.lang.Boolean" required="false" rtexprvalue="true"
              description="Defer" %>

<%@ attribute name="minify" type="java.lang.Boolean" required="false" rtexprvalue="true"
              description="Defer" %>

<%@ attribute name="minified" type="java.lang.String" required="false" rtexprvalue="true"
              description="Minified version for production" %>


<c:if test="${empty defer}">
    <c:set var="defer" value="false"/>
</c:if>

<c:if test="${empty minify}">
    <c:set var="minify" value="true"/>
</c:if>

<c:if test="${empty minified}">
    <c:set var="minified" value="${tb:minifiedJS(value)}" />
</c:if>

<c:choose>
    <c:when test="${build_profile eq 'production' and minify}">
        <spring:url value="${minified}?version=${build_version}" var="scriptSrc" />
    </c:when>
    <c:otherwise>
        <spring:url value="${value}?version=${build_version}" var="scriptSrc" />
    </c:otherwise>
</c:choose>

<script type="text/javascript"<c:if test="${defer}"> defer="defer"</c:if> src="${scriptSrc}"></script>

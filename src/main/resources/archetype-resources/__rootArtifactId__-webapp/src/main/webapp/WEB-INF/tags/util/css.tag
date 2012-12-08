<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:message code="build.profile" var="build_profile"/>
<spring:message code="build.number" var="build_version"/>

<%@ attribute name="href" type="java.lang.String" required="true" rtexprvalue="true"
              description="URL" %>

<%@ attribute name="media" type="java.lang.String" required="false" rtexprvalue="true"
              description="URL" %>

<spring:url value="${href}?version=${build_version}" var="src" />

<c:if test="${empty media}">
    <c:set var="media" value="screen" />
</c:if>

<link rel="stylesheet" href="${src}" media="${media}" />

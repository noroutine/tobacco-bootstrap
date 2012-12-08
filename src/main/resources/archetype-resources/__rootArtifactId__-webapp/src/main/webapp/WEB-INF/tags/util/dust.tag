<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>

<%@ attribute name="path" type="java.lang.String" required="true" rtexprvalue="true"
              description="dust template path" %>
<%@ attribute name="cache" type="java.lang.Boolean" required="false" rtexprvalue="true"
              description="control caching" %>

<c:if test="${empty cache}">
    <c:set var="cache" value="true" />
</c:if>

<spring:message code="build.number" var="version"/>
<spring:url value="${path}.dust.js?version=${version}&cache=${cache}" var="url" />
<script type="text/javascript" defer="defer" src="${url}"></script>

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

<script type="text/javascript">
    window.R || (window.R = {
        registerResources: function (r) {
            r.get = window.R.get;
            window.R = r;
            stopWatch(R.get('build.name') + ' ' + R.get('build.version'));
        },
        get: function(key, args) {
            var msg = R[key];
            if (msg) {
                if (args) {
                    for (var name in args) {
                        //noinspection JSUnfilteredForInLoop
                        msg = msg.replace('{' + name + '}', args[name]);
                    }
                }
                return msg;
            } else {
                return key;
            }
        }
    });
</script>

<%-- see ResourcesController --%>
<util:js value="/resources.json"/>

<c:choose>
    <c:when test="${symbol_dollar}{build_profile eq 'production'}">
        <util:js value="/resources/js/all.js" minify="false"/>
    </c:when>
    <c:otherwise>
        <%-- should be included in the same order as in pom.xml in yui compression plugin --%>
        <util:js value="/resources/js/compatibility.js"/>

        <util:js value="/resources/js/vendor/modernizr-2.6.2.js"/>

        <util:js value="/resources/js/vendor/jquery-1.8.3.js"/>
        <util:js value="/resources/js/vendor/jquery.ba-tinypubsub.js"/>
        <util:js value="/resources/js/vendor/jquery.Storage.js"/>

        <%-- Backbone.js --%>
        <util:js value="/resources/js/vendor/underscore-1.4.3.js" />
        <util:js value="/resources/js/vendor/backbone-0.9.9.js" />

        <%-- Dust.js --%>
        <util:js value="/resources/js/vendor/dust-core-1.1.1.js" />
        <util:js value="/resources/js/vendor/dust-helpers-1.1.0.js" />

        <%-- Twitter Bootstrap --%>
        <util:js value="/resources/js/vendor/bootstrap-2.2.2.js" />

        <util:js value="/resources/js/common.js"/>
    </c:otherwise>
</c:choose>
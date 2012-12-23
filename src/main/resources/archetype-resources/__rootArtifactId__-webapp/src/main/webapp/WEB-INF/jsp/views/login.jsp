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

<spring:url value="/j_spring_security_check" var="security_check_url" />

<c:set var="authException" value="${symbol_dollar}{sessionScope['SPRING_SECURITY_LAST_EXCEPTION']}" />

<form action='${symbol_dollar}{security_check_url}' method='post' class="form-horizontal">
    <fieldset>
        <legend>Login with Username and Password</legend>
        <c:if test="${symbol_dollar}{not empty authException}">
        <div class="control-group">
            <div class="controls">
                <p class="text-error">Sign-in failed: ${symbol_dollar}{fn:toLowerCase(authException.message)}</p>
            </div>
        </div>
        </c:if>
        <div class="control-group">
            <label for="j_username" class="control-label">Username:</label>
            <div class="controls">
                <input type='text' id="j_username" name='j_username' value='' placeholder="Enter username..." />
            </div>
        </div>
        <div class="control-group">
            <label for="j_password" class="control-label">Password:</label>
            <div class="controls">
                <input type='password' id="j_password" name='j_password' placeholder="Enter password..."/>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <button type="submit" class="btn">Sign in</button>
            </div>
        </div>
    </fieldset>
</form>
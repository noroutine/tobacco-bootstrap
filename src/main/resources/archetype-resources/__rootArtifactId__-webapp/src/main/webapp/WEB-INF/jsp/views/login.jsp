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

<form action='${symbol_dollar}{security_check_url}' method='post' class="form-horizontal col-lg-6" role="form">
    <fieldset>
        <legend>Login with Username and Password</legend>
        <c:if test="${symbol_dollar}{not empty authException}">
            <div class="form-group">
                <p class="text-info text-center col-lg-6">Sign-in failed: ${symbol_dollar}{fn:toLowerCase(authException.message)}</p>
            </div>
        </c:if>
        <div class="form-group">
            <label for="j_username" class="control-label col-lg-2" >Username:</label>
            <div class="col-lg-4">
                <input type='text' class="form-control" id="j_username" name='j_username' value='' placeholder="Enter username..." />
            </div>
        </div>
        <div class="form-group">
            <label for="j_password" class="control-label col-lg-2 ">Password:</label>
            <div class="col-lg-4">
                <input type='password' class="form-control" id="j_password" name='j_password' placeholder="Enter password..."/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-4">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
    </fieldset>
</form>
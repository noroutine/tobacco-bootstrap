#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * @author Oleksii Khilkevych
 * @since 01.11.12
 */

public class IFNoneMatchHandlerInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private LocaleResolver localeResolver;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (! (HandlerMethod.class.isAssignableFrom(handler.getClass()))) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        IfNoneMatch eTagAnn = handlerMethod.getMethod().getAnnotation(IfNoneMatch.class);

        if (eTagAnn == null) {
            // if no annotation, proceed with request
            return true;
        }

        // TODO (oleksiy on 01.11.12): implement SpEL support
//        SpelExpressionParser expressionParser = new SpelExpressionParser();
//        Expression eTagExpression = expressionParser.parseExpression(eTagAnn.value(), new TemplateParserContext());
//
//        String eTag = eTagExpression.getValue(String.class);
        Locale locale = localeResolver.resolveLocale(request);

        String eTag = messageSource.getMessage("build.number", null, null) + "/" + locale.toString();

        ServletWebRequest swr = new ServletWebRequest(request, response);
        if (swr.checkNotModified(eTag)) {
            return false;
        }
        return true;
    }
}

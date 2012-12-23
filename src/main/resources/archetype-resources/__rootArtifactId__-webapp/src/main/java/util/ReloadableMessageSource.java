#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.util;

import org.springframework.context.support.ReloadableResourceBundleMessageSource;

import java.util.*;

public class ReloadableMessageSource extends ReloadableResourceBundleMessageSource {

    public Properties getProperties(Locale locale) {
        return super.getMergedProperties(locale).getProperties();
    }
}

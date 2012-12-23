#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.cache;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface IfNoneMatch {
    /**
     * TODO: SpEL expression to calculate ETag value
     * @return ETag for request
     */
    String value() default "";
}

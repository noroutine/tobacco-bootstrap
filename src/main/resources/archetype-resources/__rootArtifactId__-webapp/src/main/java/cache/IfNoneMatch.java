#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.cache;

import java.lang.annotation.*;

/**
 * @author Oleksii Khilkevych
 * @since 01.11.12
 */

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface IfNoneMatch {
    /**
     * ${parentArtifactId}: SpEL expression to calculate ETag value
     * @return ETag for request
     */
    String value() default "";
}

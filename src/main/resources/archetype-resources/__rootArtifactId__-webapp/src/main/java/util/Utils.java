#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.util;

import org.apache.commons.collections.iterators.IteratorChain;

import java.util.Iterator;

public class Utils {

    public static String minifiedJS(String url) {
        if (url == null || url.isEmpty()) {
            throw new IllegalArgumentException("URL should not be blank");
        }

        if (url.toLowerCase().endsWith(".min.js")) {
            return url;
        }

        if (url.toLowerCase().startsWith("/resources/")) {
            return url.replaceAll("${symbol_escape}${symbol_escape}.js${symbol_dollar}", ".min.js");
        }

        return url;
    }

    public static class IterableIterator<T> implements Iterable<T> {

        private Iterator<T> iterator;

        private IterableIterator(final Iterator<T> iterator) {
            this.iterator = iterator;
        }

        @Override
        public Iterator<T> iterator() {
            return this.iterator;
        }

        public static <T> Iterable<T> from(final Iterator<T> iterator) {
            return new IterableIterator<T>(iterator);
        }

        public static <T> Iterable<T> from (final Iterable<T> iterable) {
            return new IterableIterator<T>(iterable.iterator());
        }

        public static <T> Iterable<T> from(final Iterator<T> iterator1, final Iterator<T> iterator2) {
            @SuppressWarnings("unchecked") Iterator<T> iteratorChain = new IteratorChain(iterator1, iterator2);
            return new IterableIterator<T>(iteratorChain);
        }

        public static <T> Iterable<T> from (final Iterable<T> iterable1, final Iterable<T> iterable2) {
            return IterableIterator.from(iterable1.iterator(), iterable2.iterator());
        }
    }
}

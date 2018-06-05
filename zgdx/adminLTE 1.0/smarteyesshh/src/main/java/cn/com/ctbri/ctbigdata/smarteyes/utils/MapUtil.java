package cn.com.ctbri.ctbigdata.smarteyes.utils;

import java.util.*;

/**
 * Created by elite on 2017/12/4.
 */
public class MapUtil {

    public static <K, V extends Comparable<? super V>> Map<K, V> sortByValueDes( Map<K, V> map ){
        List<Map.Entry<K, V>> list = new LinkedList<>( map.entrySet() );
        Collections.sort( list, (o2, o1) -> ( o1.getValue() ).compareTo( o2.getValue() ));

        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list)
        {
            result.put( entry.getKey(), entry.getValue() );
        }
        return result;
    }

    public static <K, V extends Comparable<? super V>> Map<K, V> sortByKeyDes ( Map<K, V> map ){
        List<Map.Entry<K, V>> list = new LinkedList<>( map.entrySet() );
        Collections.sort( list, (o2, o1) -> ( o1.getKey().toString() ).compareTo( o2.getKey().toString() ));

        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list)
        {
            result.put( entry.getKey(), entry.getValue() );
        }
        return result;
    }

    public static <K, V extends Comparable<? super V>> Map<K, V> sortByKeyInc( Map<K, V> map ){
        List<Map.Entry<K, V>> list = new LinkedList<>( map.entrySet() );
        Collections.sort( list, (o1, o2) -> ( o1.getKey().toString() ).compareTo( o2.getKey().toString() ));
        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list)
        {
            result.put( entry.getKey(), entry.getValue() );
        }
        return result;
    }

    public static <K, V extends Comparable<? super V>> Map<K, V> sortByValueInc( Map<K, V> map ){
        List<Map.Entry<K, V>> list = new LinkedList<>( map.entrySet() );
        Collections.sort( list, (o1, o2) -> ( o1.getValue() ).compareTo( o2.getValue() ));
        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list)
        {
            result.put( entry.getKey(), entry.getValue() );
        }
        return result;
    }

/*	public static <K, V extends Comparable<? super V>> Map<K, V> sortByObjectValue( Map<K, V> map) {
	    Map<K, V> result = new LinkedHashMap<>();
	    Stream<Map.Entry<K, V>> st = map.entrySet().stream();

	    st.sorted(Map.Entry.comparingByValue()).forEachOrdered(e->result.put(e.getKey(), e.getValue()));

	    return result;
	}*/

}

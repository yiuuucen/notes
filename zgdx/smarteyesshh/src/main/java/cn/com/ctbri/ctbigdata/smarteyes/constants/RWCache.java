package cn.com.ctbri.ctbigdata.smarteyes.constants;

import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Created by elite on 2018/1/17.
 */
public class RWCache {

    private final Map m = new TreeMap<String,Object>();
    private final ReentrantReadWriteLock rwl = new ReentrantReadWriteLock();
    private final Lock r = rwl.readLock();
    private final Lock w = rwl.writeLock();

    public Object get(String key) {
        r.lock();
        try { return m.get(key); }
        finally { r.unlock(); }
    }

    public String[] allKeys() {
        r.lock();
        try { return (String[]) m.keySet().toArray(); }
        finally { r.unlock(); }
    }

    public String put(String key, Object value) {
        w.lock();
        try { return (String) m.put(key, value); }
        finally { w.unlock(); }
    }

    public void clear() {
        w.lock();
        try { m.clear(); }
        finally { w.unlock(); }
    }
}

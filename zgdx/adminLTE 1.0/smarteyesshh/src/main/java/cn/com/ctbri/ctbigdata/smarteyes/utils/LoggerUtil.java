package cn.com.ctbri.ctbigdata.smarteyes.utils;

import org.apache.log4j.Logger;

/**
 * Created by luis on 2018/1/9.
 */
public class LoggerUtil {

    private static Logger logger = Logger.getLogger(LoggerUtil.class);
    private final static Logger consumerLogger = Logger.getLogger("consumerlogger");

    /**
     * 获取consumer Log
     * @return
     */
    public static Logger getConsumerLogger() {
        return consumerLogger == null ? Logger.getLogger("consumerlogger") : consumerLogger;
    }

    public static void consumerI(String msg) {
        getConsumerLogger().info(msg);
    }

    public static void consumerW(String msg) {
        getConsumerLogger().warn(msg);
    }

    public static void consumerE(String msg, Throwable tr) {
        getConsumerLogger().error(msg, tr);
    }

    public static void consumerE(String msg){
        getConsumerLogger().error(msg);
    }

    public static void info(String msg){
        logger.info(msg);
    }
    public static void debug(String msg){
        logger.debug(msg);
    }
}

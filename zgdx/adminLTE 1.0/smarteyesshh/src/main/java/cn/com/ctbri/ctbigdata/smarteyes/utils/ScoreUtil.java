package cn.com.ctbri.ctbigdata.smarteyes.utils;

import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfo;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummary;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * @author zeromem
 * @date 2017/11/28
 * 对一条ContactSummary打分
 */
public class ScoreUtil {
    private static final double MSG_UPPER_LIMIT = 10;
    private static final double AVG_DURATION_LIMIT = 3 * 60 * 1000;
    private static final double WORK_CALL_UPPER_LIMIT = 8;
    private static final double REST_CALL_UPPER_LIMIT = 4;
    private static final double UNDER_15SEC_CALL_UPPER_LIMIT = 6;
    private static final double ABOVE_3MIN_CALL_UPPER_LIMIT = 3;

    private static final double MSG_FRACTION = 0.2;
    private static final double AVG_DURATION_FRACTION = 0.2;
    private static final double WORK_FRACTION = 0.2;
    private static final double REST_FRACTION = 0.2;
    private static final double UNDER_15SEC_FRACTION = 0.1;
    private static final double ABOVE_3MIN_FRACTION = 0.1;

    public static double rate(ContactSummary summary) {
        double msg = MSG_FRACTION * Math.min(summary.getMsgCounter(), MSG_UPPER_LIMIT) / MSG_UPPER_LIMIT;
        double duration = AVG_DURATION_FRACTION
                * Math.min(summary.getDurationLength().doubleValue()
                / (summary.getWorkCallCounter() + summary.getRestCallCounter()), AVG_DURATION_LIMIT)
                / AVG_DURATION_LIMIT;

        double work = WORK_FRACTION
                * Math.min(summary.getWorkCallCounter(), WORK_CALL_UPPER_LIMIT) / WORK_CALL_UPPER_LIMIT;

        double rest = REST_FRACTION
                * Math.min(summary.getRestCallCounter(), REST_CALL_UPPER_LIMIT) / REST_CALL_UPPER_LIMIT;

        double under = UNDER_15SEC_FRACTION
                * Math.min(summary.getUnderFifteenSecondsCounter(), UNDER_15SEC_CALL_UPPER_LIMIT)
                / UNDER_15SEC_CALL_UPPER_LIMIT;

        double above = ABOVE_3MIN_FRACTION
                * Math.min(summary.getAboveThreeMinCounter(), ABOVE_3MIN_CALL_UPPER_LIMIT)
                / ABOVE_3MIN_CALL_UPPER_LIMIT;

        return msg + duration + work + rest + under + above;
    }

    public static void main(String[] args) {
        ContactSummary summary = new ContactSummary();
        summary.setMsgCounter(0);
        summary.setWorkCallCounter(10);
        summary.setRestCallCounter(6);
        summary.setDurationLength(15 * 60 * 1000);
        summary.setUnderFifteenSecondsCounter(4);
        summary.setAboveThreeMinCounter(7);

        System.out.println(rate(summary));
    }


    private static final DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

    /**
     * 根据id->other的多个ContactInfo计算权重
     * @param infos
     * @return
     */
    public static double rate(List<ContactInfo> infos) {
        Integer workCounter = 0;
        Integer restCounter = 0;
        Integer under15SecCounter = 0;
        Integer above3MinCounter = 0;
        Integer durationAcc = 0;

        for (ContactInfo info : infos) {
            Integer duration = info.getDuration();
            String startTime = info.getStartTime();
            LocalDateTime time = LocalDateTime.parse(startTime, format);
            DayOfWeek dayOfWeek = time.getDayOfWeek();
            int hour = time.getHour();
            if (dayOfWeek == DayOfWeek.SUNDAY || dayOfWeek == DayOfWeek.SATURDAY || hour >= 20 || hour <= 6) {
                restCounter++;
            } else {
                workCounter++;
            }
            if (duration > 3 * 60) {
                above3MinCounter++;
            } else if (duration < 15) {
                under15SecCounter++;
            }
            durationAcc += duration;
        }


        double msg = 0;
        double duration = AVG_DURATION_FRACTION
                * Math.min(durationAcc.doubleValue()
                / (workCounter + restCounter), AVG_DURATION_LIMIT)
                / AVG_DURATION_LIMIT;

        double work = WORK_FRACTION
                * Math.min(workCounter, WORK_CALL_UPPER_LIMIT) / WORK_CALL_UPPER_LIMIT;

        double rest = REST_FRACTION
                * Math.min(restCounter, REST_CALL_UPPER_LIMIT) / REST_CALL_UPPER_LIMIT;

        double under = UNDER_15SEC_FRACTION
                * Math.min(under15SecCounter, UNDER_15SEC_CALL_UPPER_LIMIT)
                / UNDER_15SEC_CALL_UPPER_LIMIT;

        double above = ABOVE_3MIN_FRACTION
                * Math.min(above3MinCounter, ABOVE_3MIN_CALL_UPPER_LIMIT)
                / ABOVE_3MIN_CALL_UPPER_LIMIT;

        return msg + duration + work + rest + under + above;
    }
}

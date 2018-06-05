package cn.com.ctbri.ctbigdata.smarteyes.utils;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

	private static String[] parsePatterns = { "yyyy-MM-dd",
			"yyyy-MM-dd HH:mm:ss.s", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
			"yyyy-MM", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm",
			"yyyy/MM", "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm",
			"yyyy.MM" };

	public static final String DATE_FORMAT_CN = "yyyy年MM月dd日";
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	public static final String DATE_FORMAT_NO_DELIMITER = "yyyyMMdd";
	public static final String TIME_FORMAT = "HH:mm:ss";
	public static final String TIME_FORMAT_NO_SEC = "HH:mm";
	public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_TIME_FORMAT2 = "yyyyMMddHHmmss";
	public static final String TIMESTAMP_FORMAT = "yyyy-MM-dd HH:mm:ss.S";
	public static final String DATE_TIME_FORMAT_NO_SEC = "yyyy-MM-dd HH:mm";
	public static final String DATE_TIME_FORMAT_NO_DELIMITER = "yyyyMMddHHmmss";
	public static final String DATE_FORMAT_NO_DAY="yyyy-MM";
	public static final String DATE_FORMAT_MONTHDAY="MMdd";

	/**
	 * 将string格式的字符串转化为Date类型的
	 * @param dateString
	 * @return
	 */
	public static Date getConvertDate(String dateString){
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(TIMESTAMP_FORMAT);
			Date date = sdf.parse(dateString);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将string格式的字符串转化为Date类型的
	 * @param dateString
	 * @return
	 */
	public static Date getStringToDate(String dateString){
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_TIME_FORMAT2);
			return sdf.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}

	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}

	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}


	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}

	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到以当前时间命名的文件名称
	 *
	 * @return
	 */
	public static String getDateTimeFileName() {
		return formatDate(new Date(), "yyyy-MM-dd-HH-mm-ss");
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}

	/**
	 * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
	 * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy.MM.dd",
	 * "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null) {
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 *
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (24 * 60 * 60 * 1000);
	}

	/**
	 * 获取过去的小时
	 *
	 * @param date
	 * @return
	 */
	public static long pastHour(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 60 * 1000);
	}

	/**
	 * 获取过去的分钟
	 *
	 * @param date
	 * @return
	 */
	public static long pastMinutes(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 1000);
	}

	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 *
	 * @param timeMillis
	 * @return
	 */
	public static String formatDateTime(long timeMillis) {
		long day = timeMillis / (24 * 60 * 60 * 1000);
		long hour = (timeMillis / (60 * 60 * 1000) - day * 24);
		long min = ((timeMillis / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (timeMillis / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		long sss = (timeMillis - day * 24 * 60 * 60 * 1000 - hour * 60 * 60
				* 1000 - min * 60 * 1000 - s * 1000);
		return (day > 0 ? day + "," : "") + hour + ":" + min + ":" + s + "."
				+ sss;
	}

	/**
	 * 格式化long类型的时间
	 *
	 * @param timeMills
	 * @return
	 */
	public static String formatLongDate(long timeMills) {
		return formatDate(new Date(timeMills), DATE_FORMAT);
	}

	/**
	 * 格式化long类型的时间
	 *
	 * @param timeMills
	 * @return
	 */
	public static String formatLongDate(long timeMills, String format) {
		return formatDate(new Date(timeMills), format);
	}

	/**
	 * 获取两个日期之间的天数
	 *
	 * @param before
	 * @param after
	 * @return
	 */
	public static double getDistanceOfTwoDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		return (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
	}

	/**
	 * 推算当前时间的前后时间的数值单位
	 */
	public static final String DATE_UNIT_MINUTE = "minute";
	public static final String DATE_UNIT_HOUR = "hour";
	public static final String DATE_UNIT_DAY = "day";
	public static final String DATE_UNIT_MONTH = "month";
	public static final String DATE_UNIT_YEAR = "year";

	/**
	 * 获取输入日期的多少分钟、小时、天、月、年前后的日期
	 *
	 * @param date
	 *            输入日期
	 * @param count
	 *            正数往后推，负数往前推
	 * @param unit
	 *            推算时间单位minute hour day month year为空默认按天算
	 * @return 多少分钟、小时、天、月、年前后的日期
	 */
	public static Date getDateAfterOrBefore(Date date, int count, String unit) {
		Calendar calendar = Calendar.getInstance();
		if (date != null) {
			calendar.setTime(date);
		} else {
			date = new Date();
		}
		if (StringUtils.isNotBlank(unit)) {
			if (DATE_UNIT_YEAR.equals(unit.toLowerCase())) {
				calendar.add(Calendar.YEAR, count);
			} else if (DATE_UNIT_MONTH.equals(unit.toLowerCase())) {
				calendar.add(Calendar.MONTH, count);
			} else if (DATE_UNIT_HOUR.equals(unit.toLowerCase())) {
				calendar.add(Calendar.HOUR, count);
			} else if (DATE_UNIT_MINUTE.equals(unit.toLowerCase())) {
				calendar.add(Calendar.MINUTE, count);
			} else {
				calendar.add(Calendar.DATE, count);
			}
		} else {
			calendar.add(Calendar.DATE, count);
		}
		return calendar.getTime();
	}

	/**
	 * 将字符串转换成Date类型
	 *
	 * @param dateString
	 * @param dateFormat
	 * @return
	 */
	public static Date parse(String dateString, String dateFormat) {
		if (StringUtils.isEmpty(dateString)) {
			return null;
		}
		try {
			return DateUtils.parseDate(dateString, dateFormat);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 将数字替换为中文
	 *
	 * @param c
	 *            要转换的char
	 * @return 替换的数字
	 */
	public static String replaceDigitalOfChinese(char c) {
		switch (c) {
			case '0':
				return "〇";
			case '1':
				return "一";
			case '2':
				return "二";
			case '3':
				return "三";
			case '4':
				return "四";
			case '5':
				return "五";
			case '6':
				return "六";
			case '7':
				return "七";
			case '8':
				return "八";
			case '9':
				return "九";
			default:
				return "";
		}
	}

	/**
	 * 获取中文日期
	 *
	 * @param date
	 *            要转换的日期
	 * @return 中文格式日期
	 */
	public static String getChineseDate(Date date) {
		if (null != date) {
			String dateStr = formatDate(date, "yyyyMMdd");
			if (StringUtils.isNotBlank(dateStr)) {
				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < 4; i++) {
					sb.append(replaceDigitalOfChinese(dateStr.charAt(i)));
				}
				sb.append("年");
				sb.append(getMonthOrDayChinese(dateStr.charAt(4),
						dateStr.charAt(5)));
				sb.append("月");
				sb.append(getMonthOrDayChinese(dateStr.charAt(6),
						dateStr.charAt(7)));
				sb.append("日");
				return sb.toString();
			}
		}
		return "";
	}

	/**
	 * 获得调查表查询日期对应的日期格式字符串
	 *
	 * @param dateYear
	 *            日期的年
	 * @param dataType
	 *            日期类型 按月、按季、按半年、按年
	 * @param value
	 *            具体对应的值
	 * @return 对应的格式字符串 201601 2016Q1 2016H1 2016Y1
	 */
	public static String getDataDate(String dateYear, int dataType, String value) {
		if (StringUtils.isNotBlank(dateYear)) {
			switch (dataType) {
				case 1:
					if (StringUtils.isNotBlank(value)) {
						if (Integer.parseInt(value) < 10) {
							return dateYear + "0" + value;
						} else {
							return dateYear + value;
						}
					}
				case 2:
					return dateYear + "Q" + value;
				case 3:
					return dateYear + "H" + value;
				case 4:
					return dateYear + "Y" + value;
			}
		}
		return "";
	}

	/**
	 * 获取一个日期的年
	 *
	 * @param date
	 * @return
	 */
	public static String getYear(Date date) {
		return DateUtils.formatDate(date, "yyyy");
	}

	/**
	 * 获取一个日期的月
	 *
	 * @param date
	 * @return
	 */
	public static String getMonth(Date date) {
		return DateUtils.formatDate(date, "MM");
	}

	/**
	 * 获取一个日期的月 {@link NullPointerException} may be thrown
	 *
	 * @param date
	 * @return
	 */
	public static String getDay(String date, String fromate) {
		Date d = null;

		try {
			d = new SimpleDateFormat(fromate).parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return DateUtils.formatDate(d, "dd");
	}

	/**
	 * 获取十位个位对应的组合中文
	 *
	 * @param ten
	 *            十位数
	 * @param bits
	 *            个位数
	 * @return 组合中文
	 */
	private static String getMonthOrDayChinese(char ten, char bits) {
		if (ten != '0' && bits != '0') {
			if (ten != '1') {
				return replaceDigitalOfChinese(ten) + "十"
						+ replaceDigitalOfChinese(bits);
			} else {
				return "十" + replaceDigitalOfChinese(bits);
			}
		} else if (ten == '0' && bits != '0') {
			return replaceDigitalOfChinese(bits);
		} else if (ten != '0' && bits == '0') {
			if (ten != '1') {
				return replaceDigitalOfChinese(ten) + "十";
			} else {
				return "十";
			}
		}
		return "";
	}

	/**
	 * 判断日期是否为同一天
	 *
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean isSameDate(Date date1, Date date2) {
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);

		boolean isSameYear = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR);
		boolean isSameMonth = isSameYear
				&& cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
		boolean isSameDate = isSameMonth
				&& cal1.get(Calendar.DAY_OF_MONTH) == cal2
				.get(Calendar.DAY_OF_MONTH);

		return isSameDate;
	}

	/*
	 * 获取某一天的开始时间
	 */
	public static Date getStartDate(Date date) {
		if (date == null) {
			return null;
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 获取某一天的结束时间
	 *
	 * @param date
	 * @return
	 */
	public static Date getEndDate(Date date) {
		if (date == null) {
			return null;
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.SECOND, -1);
		return calendar.getTime();
	}

	/**
	 * get start date of given week no of a year
	 *
	 * @param year
	 * @param weekNo
	 * @return
	 */
	public static String getStartDayOfWeekNo(int year, int weekNo) {
		Date date=getDayOfYearWeekDay(year,weekNo,1);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	/**
	 * get the end day of given week no of a year.
	 *
	 * @param year
	 * @param weekNo
	 * @return
	 */
	public static Date getDateEndDayOfWeekNo(int year, int weekNo) {
		Date date=getDayOfYearWeekDay(year,weekNo,7);
		return date;
	}

	public static String getDateStringEndDayOfWeekNo(int year, int weekNo) {
		Date date = getDateEndDayOfWeekNo(year, weekNo);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	/**
	 * get Calendar of given year
	 *
	 * @param year
	 * @return
	 */
	private static Calendar getCalendarFormYear(int year) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		cal.set(Calendar.YEAR, year);
		return cal;
	}

	/**
	 * 获取某年某月的结束日期
	 *
	 * @param year
	 * @param month
	 * @return
	 */
	public static Date getLastDayOfMonth(int year, int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DATE));
		return cal.getTime();
	}

	/**
	 * 获取某年某月的开始日期
	 *
	 * @param year
	 * @param month
	 * @return
	 */
	public static Date getFirstDayOfMonth(int year, int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, cal.getMinimum(Calendar.DATE));
		return cal.getTime();
	}

	public static String getLastDayOfMonthString(int year, int month) {
		Date date = getLastDayOfMonth(year, month);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	public static String getFirstDayOfMonthString(int year, int month) {
		Date date = getFirstDayOfMonth(year, month);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	/**
	 * 获取某年某月的结束日期
	 *
	 * @param year
	 * @param month
	 * @return
	 */
	public static Date getLastDayOfYear(int year) {
		return getLastDayOfMonth(year,12);
	}

	/**
	 * 获取某年某月的开始日期
	 *
	 * @param year
	 * @param month
	 * @return
	 */
	public static Date getFirstDayOfYear(int year) {
		return getLastDayOfMonth(year,1);
	}

	public static String getLastDayOfYearString(int year) {
		Date date = getLastDayOfYear(year);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	public static String getFirstDayOfYearString(int year) {
		Date date = getFirstDayOfYear(year);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	/**
	 *
	 * @param year
	 * @param weekNo
	 * @param weekDay [1,7]
	 * @return
	 */
	public static Date getDayOfYearWeekDay(int year,int weekNo,int weekDay){
		if(weekDay>0&&weekDay<8){
			if(weekDay<7){
				weekDay++;
				Calendar cal = getCalendarFormYear(year);
				cal.set(Calendar.WEEK_OF_YEAR, weekNo-1);
				cal.set(Calendar.DAY_OF_WEEK, weekDay);
				return cal.getTime();
			}else{
				Calendar cal = getCalendarFormYear(year);
				cal.set(Calendar.WEEK_OF_YEAR, weekNo-1);
				cal.add(Calendar.DAY_OF_WEEK, 1);
				cal.add(Calendar.DATE, 5);
				return cal.getTime();
			}
		}
		return null;
	}
	public static List<String> getDayOfYearWeekDayArray(int year,int weekNo,int startWeekDay,int endWeekDay){
		List<String> dateList=new ArrayList<String>();
		Date startDate=getDayOfYearWeekDay(year,weekNo,startWeekDay);
		Date endDate=getDayOfYearWeekDay(year,weekNo,endWeekDay);
		Date tempDate=startDate;
		dateList.add(formatDate(tempDate));
		for(int i=(startWeekDay+1);i<endWeekDay;i++){
			Calendar cal=Calendar.getInstance();
			cal.setTime(tempDate);
			cal.add(Calendar.DATE, 1);
			tempDate=cal.getTime();
			dateList.add(formatDate(tempDate));
		}
		dateList.add(formatDate(endDate));
		return dateList;
	}

	public static List<String> getDayOfStartDayAndEndDay(Date startDate,Date endDate){
		if(startDate.getTime()>endDate.getTime()){
			return null;
		}
		List<String> dateList=new ArrayList<String>();
		if(isSameDate(startDate, endDate)){
			dateList.add(formatDate(startDate));
			return dateList;
		}
		dateList.add(formatDate(startDate));
		for(Date tempDate=startDate;tempDate.getTime()<endDate.getTime()&&!isSameDate(tempDate,endDate);){
			Calendar cal=Calendar.getInstance();
			cal.setTime(tempDate);
			cal.add(Calendar.DATE,1);
			tempDate=cal.getTime();
			dateList.add(formatDate(tempDate));
		}
		return dateList;
	}

	public static List<String> getMonthYear(int year,int startMonth,int endMonth){

		List<String> monthList=new ArrayList<String>();
		for(int i=startMonth;i<=endMonth;i++){
			Calendar calendar=Calendar.getInstance();
			calendar.set(Calendar.YEAR,year);
			calendar.set(Calendar.MONTH,i-1);
			Date date=calendar.getTime();
			monthList.add(formatDate(date,DATE_FORMAT_NO_DAY));
		}
		return monthList;
	}
	/**
	 *
	 * @param year
	 * @param weekNo
	 * @param weekDay
	 * @return
	 */
	public static String getDayOfYearWeekDayString(int year,int weekNo,int weekDay){
		Date date=getDayOfYearWeekDay(year,weekNo,weekDay);
		if(date==null){
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	public static Date getStartYearMonthDate(int year,int month,int date){
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month-1);
		calendar.set(Calendar.DAY_OF_MONTH, date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}
	public static String getStartYearMonthDateString(int year,int month,int date){
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month-1);
		calendar.set(Calendar.DAY_OF_MONTH, date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(calendar.getTime());
		return dateStr;
	}
	public static Date getEndYearMonthDate(int year,int month,int date){
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month-1);
		calendar.set(Calendar.DAY_OF_MONTH, date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}
	public static String getEndYearMonthDateString(int year,int month,int date){
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month-1);
		calendar.set(Calendar.DAY_OF_MONTH, date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(calendar.getTime());
		return dateStr;
	}


	public static Date getStartYearMonth(int year,int month){
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH,1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}
	public static String getStartYearMonthString(int year,int month){
		Date date=getStartYearMonth(year,month);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}
	public static Date getEndYearMonth(int year,int month){
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, 12);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}
	public static String getEndYearMonthDateString(int year,int month){
		Date date=getEndYearMonth(year,month);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	public static long date2Millis(Date date){
		return date.getTime();
	}

	/**
	 *
	 * @param dateStr  输入字符串日期值
	 * @param format   输入字符串日期值格式
	 * @param resultFormat 输出字符串日期值格式
	 * @return 字符串日期值
	 */
	public static String getStringDate(String dateStr,String format,String resultFormat){
		Date tempDate=parse(dateStr,format);
		return formatDate(tempDate,resultFormat);
	}
}

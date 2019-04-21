package com.king.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author hhumhr
 */
public class DateTimeUtil {

    public static String RIGHT_NOW = "刚刚";

    public static String nowStr() {
        LocalDateTime now = LocalDateTime.now();
        return now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static String toDateTimeStr(LocalDateTime localDateTime) {
        return localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static String toHumanDateTimeStr(LocalDateTime localDateTime) {
        LocalDateTime now = LocalDateTime.now();
        if (localDateTime.getYear() < now.getYear()) {
            return localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        }
        if (localDateTime.getDayOfYear() < now.getDayOfYear() - 1) {
            return localDateTime.format(DateTimeFormatter.ofPattern("MM-dd"));
        }
        if (localDateTime.getDayOfYear() == now.getDayOfYear() - 1) {
            return localDateTime.format(DateTimeFormatter.ofPattern("昨天HH:mm"));
        }
        if (localDateTime.getHour() < now.getHour() - 6) {
            return localDateTime.format(DateTimeFormatter.ofPattern("HH:mm"));
        }
        if (localDateTime.getHour() < now.getHour()) {
            return now.getHour() - localDateTime.getHour() + "小时前";
        }
        if (localDateTime.getMinute() < now.getMinute()) {
            return now.getMinute() - localDateTime.getMinute() + "分钟前";
        }
        return RIGHT_NOW;
//        return localDateTime.format(DateTimeFormatter.ofPattern("HH:mm"));
    }

    public static void main(String[] args) {
        LocalDateTime now = LocalDateTime.now();
        System.out.println(now.getYear());
        System.out.println(now.getMonth());
        System.out.println(now.getDayOfYear());
        System.out.println(now.getDayOfMonth());
        System.out.println(now.getDayOfWeek());
        System.out.println(now.getHour());
        System.out.println(now.getMinute());
        System.out.println(now.getSecond());
        LocalDateTime beforeYear = LocalDateTime.of(2018, 12, 1, 1, 1, 1);
        LocalDateTime beforeDay = LocalDateTime.of(2019, 3, 16, 1, 1, 1);
        LocalDateTime yesterday = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth() - 1, now.getHour(), now.getMinute(), now.getSecond() - 1);
        LocalDateTime todayBefore8Hour = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour() - 8, now.getMinute(), now.getSecond() - 1);
        LocalDateTime todayBefore7Hour = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour() - 7, now.getMinute(), now.getSecond() - 1);
        LocalDateTime todayBefore6Hour = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour() - 6, now.getMinute(), now.getSecond() - 1);
        LocalDateTime todayBefore5Hour = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour() - 5, now.getMinute(), now.getSecond() - 1);
        LocalDateTime todayBefore1Hour = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour() - 1, now.getMinute(), now.getSecond() - 1);
        LocalDateTime beforeMinute = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour(), now.getMinute() - 1, now.getSecond() - 1);
        LocalDateTime rightNow = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), now.getHour(), now.getMinute(), now.getSecond() - 1);

        System.out.println(toHumanDateTimeStr(beforeYear));
        System.out.println(toHumanDateTimeStr(beforeDay));
        System.out.println(toHumanDateTimeStr(yesterday));
        System.out.println(toHumanDateTimeStr(todayBefore8Hour));
        System.out.println(toHumanDateTimeStr(todayBefore7Hour));
        System.out.println(toHumanDateTimeStr(todayBefore6Hour));
        System.out.println(toHumanDateTimeStr(todayBefore5Hour));
        System.out.println(toHumanDateTimeStr(todayBefore1Hour));
        System.out.println(toHumanDateTimeStr(beforeMinute));
        System.out.println(toHumanDateTimeStr(rightNow));


    }
}

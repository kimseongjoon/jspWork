package com.exam;

import java.util.Calendar;

public class DateBean {
    Calendar ca = Calendar.getInstance();
    String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
    public String getToday() {

        String str = ca.get(Calendar.YEAR) + "년 "
                + (ca.get(Calendar.MONTH) + 1) + "월 "
                + ca.get(Calendar.DATE) + "일 "
                + arr[ca.get(Calendar.DAY_OF_WEEK) - 1] + "요일";

        return str;
    }

    public int getYear() {
        return ca.get(Calendar.YEAR);
    }

    public int getMonth() {
        return ca.get(Calendar.MONTH) + 1;
    }

    public int getDate() {
        return ca.get(Calendar.DATE);
    }
}

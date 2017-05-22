package com.jeju.meoui.util;

import java.beans.*;
import java.text.*;

public class SqlDateEditor extends PropertyEditorSupport {
	private DateFormat dateFormat = DateFormat.getDateInstance();
	public SqlDateEditor (final DateFormat dateFormat) {
		this.dateFormat = dateFormat;
	}
    @Override // 객체로
    public void setAsText(String text) {
    	try {
			setValue(new java.sql.Date(this.dateFormat.parse(text).getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new IllegalArgumentException("Could not parse date: " + e.getMessage());
		}
    }
    @Override  // 스트링으로
    public String getAsText() {
        java.sql.Date value = (java.sql.Date) getValue();
        return (value != null ? this.dateFormat.format(value) : "");
    }
}
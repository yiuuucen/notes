package cn.com.ctbri.ctbigdata.smarteyes.constants;

import org.apache.commons.lang.StringEscapeUtils;

import java.beans.PropertyEditorSupport;

public class XssSqlStringEscapeEditor extends PropertyEditorSupport {
	
	private boolean escapeHTML;

	private boolean escapeJavaScript;

	private boolean escapeSQL;

	public XssSqlStringEscapeEditor() {
		super();
	}

	public XssSqlStringEscapeEditor(boolean escapeHTML, boolean escapeJavaScript, boolean escapeSQL) {
		super();
		this.escapeHTML = escapeHTML;
		this.escapeJavaScript = escapeJavaScript;
		this.escapeSQL = escapeSQL;
	}

	@Override
	public void setAsText(String text) {

		if (text == null) {
			setValue(null);
		} else {
			String value = text;
			if (escapeHTML) {
				//value = StringEscapeUtils.escapeHtml(value);
				value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
				value = value.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
				value = value.replaceAll("'", "&#39;");
			}
			if (escapeJavaScript) {
				//value = StringEscapeUtils.escapeJavaScript(value);
				//You'll need to remove the spaces from the html entities below
				value = value.replaceAll("eval\\((.*)\\)", "");
				value = value.replaceAll("[\\\"\\\'][\\s]*javascript.:(.*)[\\\"\\\']", "\"\"");
				value = value.replaceAll("script", "");
			}
			if (escapeSQL) {
				value = StringEscapeUtils.escapeSql(value);
			}			
			setValue(value);
		}
	}

	@Override
	public String getAsText() {
		Object value = getValue();
		return value != null ? value.toString() : "";
	}
}

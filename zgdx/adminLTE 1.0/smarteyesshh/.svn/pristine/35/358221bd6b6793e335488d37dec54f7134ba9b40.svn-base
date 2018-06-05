package cn.com.ctbri.ctbigdata.smarteyes.utils;
import java.util.List;

public class PageBean<T> {
	
	/**
	 * 当前页前后之间的距离页数
	 * 例如当前页是第7页，值为1的话则开始页为6，结束页为8
	 */
	public static final Integer DEFAULT_SEPARATE_PAGE=3;
	/*
	 * 在service中调用dao的count()来获取
	 */
	private int totalRecord;//总记录数
	
	private int pageSize;//每页记录数
	
	/*
	 *从页面获取，如果页面没有传，那么就是为1
	 */
	private int pageCode;//当前页码
	
	private int totalPage;//总页数,通过总记录和每页记录数计算而来
	
	/*
	 * 在service中通过dao来获取，pageCode和pageSize
	 */
	private List<T> datas;//当前页的记录
	
	public PageBean(int pageCode, int totalRecord, int pageSize) {
		this.pageCode = pageCode;
		this.totalRecord = totalRecord;
		this.pageSize = pageSize;
	}

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		// 计算totalPage
		totalPage=totalRecord / pageSize;
		totalPage = totalRecord % pageSize == 0 ? totalPage : totalPage + 1;
		if(totalPage==0){
			totalPage=1;
		}
		return totalPage;
	}
	
	public int getStartPage(){
		int startPage=pageCode-DEFAULT_SEPARATE_PAGE;
		return startPage>0?startPage:1;
		
	}
	
	public int getEndPage(){
		int endPage=pageCode+DEFAULT_SEPARATE_PAGE;
		int totalPage=getTotalPage();
		return endPage>totalPage?totalPage:endPage;
	}
}

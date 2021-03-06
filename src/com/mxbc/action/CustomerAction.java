package com.mxbc.action;

import java.util.List;

import com.mxbc.dao.CustomerDao;
import com.mxbc.entity.Customer;
import com.mxbc.util.PageModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@SuppressWarnings("unused")
public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{
	
	private static final long serialVersionUID = -1056099330002321491L;
	//private EmployeeDao employeeDao = EmployeeDaoImpl.getInstance();
//	BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext-*.xml");
//	CustomerDao customerDao = (CustomerDao)beanFactory.getBean("customerDao");
	
	private CustomerDao customerDao;
	
//	private List<Customer> list;
	private int f_area;
	private int pageNo;
	private int pageSize;
	private PageModel pageModel;
	private Customer customer = new Customer();
	
//---------------------------------------------------------------
	public String add(){
		//获得 当前 系统 时间
		java.util.Date date = new java.util.Date();
		customer.setC_time(date);
		customer.setC_state(0);
		customerDao.addDao(customer);
		return SUCCESS;
	}
	
	public String delete(){
		customerDao.delDao(customer.getC_id());
		return SUCCESS;
	}
	
	public String toUpdate(){
		customer = customerDao.toUpdateDao(customer.getC_num());
		return SUCCESS;
	}
	
	public String update(){
		//更新修改时间
		java.util.Date date = new java.util.Date();
		customer.setC_time(date);
		customerDao.updateDao(customer);
		if(f_area == 0){
			return "success_0";
		}else if(f_area == 1){
			return "success_1";
		}else if(f_area == 2){
			return "success_2";
		}else if(f_area == 3){
			return "success_3";
		}else if(f_area == 4){
			return "success_4";
		}else if(f_area == 5){
			return "success_5";
		}
		return "success_0";
	}
	
	public String findAll(){
//		list = customerDao.findAllDao();
		pageModel = customerDao.findByPage(pageNo, pageSize);
		return SUCCESS;
	}
	
//	public String findByNum(){
//		customer = customerDao.findByNumDao(customer.getC_num());
//		list = customerDao.findAllDao();
//		return SUCCESS;
//	}
	
	public String findByArea(){
//		list = customerDao.findAllByAreaDao(customer.getC_area());
		pageModel = customerDao.findByPage_ByArea(pageNo, pageSize,customer.getC_area());
		return "success_"+customer.getC_area();
	}
//---------------------------------------------------------------
//	public List<Customer> getList() {
//		return list;
//	}
//	public void setList(List<Customer> list) {
//		this.list = list;
//	}
	public Customer getcustomer() {
		return customer;
	}
	public void setcustomer(Customer customer) {
		this.customer = customer;
	}
	
	public Customer getModel() {
		return customer;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public int getF_area() {
		return f_area;
	}

	public void setF_area(int f_area) {
		this.f_area = f_area;
	}
}
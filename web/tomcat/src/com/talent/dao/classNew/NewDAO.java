package com.talent.dao.classNew;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.common.Pagination;
import com.talent.dao.BaseDAO;
import com.talent.hibernate.News;
import com.talent.web.form.NewsForm;


public class NewDAO  extends BaseDAO{

	public  List getClassList(NewsForm form, String columns){
		ArrayList list=new ArrayList();
		Session session=null;
		Pagination pagination=form.getPagination();
		News news=new News();
		try{
			session=this.beginTransaction();
			String hql="Select c from News c where c.columns='"+columns+"' order by c.publishDate desc";
			Query query=session.createQuery(hql);
			query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
			query.setMaxResults(pagination.getRowsPerPage());
			 Iterator it=query.iterate();
			  while(it.hasNext()){
				   news=(News)it.next();
				  news.setTitle(news.getTitle());
				  news.setPublishDate(news.getPublishDate());
				  news.setPublisherName(news.getPublisherName());
				  news.setDepartment(news.getDepartment());
				  news.setNewsId(news.getNewsId());
				  list.add(news);
			  }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return list;
	}
	public  List getOneList( String id){
		ArrayList list=new ArrayList();
		Session session=null;
	
		News news=new News();
		try{
			session=this.beginTransaction();
			String hql="Select c from News c where c.newsId='"+id+"'";
			Query query=session.createQuery(hql);
			
			 Iterator it=query.iterate();
			  while(it.hasNext()){
				   news=(News)it.next();
				  news.setTitle(news.getTitle());
				  news.setSubhead(news.getSubhead());
				  news.setColumns(news.getColumns());
				  news.setPublishDate(news.getPublishDate());
				  news.setDepartment(news.getDepartment());
				  list.add(news);
			  }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return list;
	}
	
	public  List getNewList(){
		List list=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="Select c from News c order by c.publishDate desc";
			Query query=session.createQuery(hql);
			list=query.list();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return list;
	}

}

package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.bookshop.project.PublisherDao;
import dto.bookshop.project.Publisher;
import util.connetion.db.DBconnection;

public class ServicePublisher {
	Connection connection=null;
	
	public void insertPublisher(String publisherName,String publishersite) {
		connection = DBconnection.getConnetion();
		PublisherDao publisherDao = new PublisherDao();
		try {
			connection.setAutoCommit(false);
			publisherDao.insertPublisher(publisherName, publishersite, connection);
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
		
	}
	public Publisher selectPublisherNo(int no) {
		connection = DBconnection.getConnetion();
		PublisherDao publisherDao = new PublisherDao();
		Publisher publisher = new Publisher();
		
		try {
			connection.setAutoCommit(false);
			publisher = publisherDao.selectPublisherNo(no, connection);
			connection.commit();
			
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
		
		
		return publisher;
		
	}
	public void updatePublisher(int no,String publishername, String publisherwebsite) {
		connection = DBconnection.getConnetion();
		PublisherDao publisherDao = new PublisherDao();
		try {
			connection.setAutoCommit(false);
			publisherDao.updatePublisher(no, publishername, publisherwebsite, connection);
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
	}
	public void deletePublisher(int no) {
		connection = DBconnection.getConnetion();
		PublisherDao publisherDao = new PublisherDao();
		try {
			connection.setAutoCommit(false);
			publisherDao.deletePublisher(no, connection);
			connection.commit();
			
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
	}
	public int selectCount() {
		connection = DBconnection.getConnetion();
		PublisherDao publisherDao = new PublisherDao();
		int totalRow=0;
		
		try {
			connection.setAutoCommit(false);
			totalRow = publisherDao.selectCount(connection);
			connection.commit();
			
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
		
		
		return totalRow;
		
		
	}
	public ArrayList<Publisher> selectByPagePublisher(int currentpage, int pagePerRow){
		connection = DBconnection.getConnetion();
		PublisherDao publisherDao = new PublisherDao();
		Publisher publisher = new Publisher();
		ArrayList<Publisher> list = new ArrayList<Publisher>();
		
		try {
			connection.setAutoCommit(false);
			list = publisherDao.selectByPagePublisher(currentpage, pagePerRow, connection);
			connection.commit();
			
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
		
		
		return list;
	}
}

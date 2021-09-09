package kr.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
public class DispatcherServlet extends HttpServlet{
	private static final long serialVersionUID = 4068304416616773907L;
	
	private Map<String,Action> commandMap = 
			                  new HashMap<String,Action>();

	@Override
	public void init(ServletConfig config)throws ServletException{
		// "/WEB-INF/ActionMap.properties" ��ȯ
		String propsPath = config.getInitParameter("propertiesPath");
		
		//web.xml�� �Ʒ��� ���� properties ���� ������ ���
        // /WEB-INF/ActionMap.properties,/WEB-INF/ActionMap2.properties
        String[] propsArray = propsPath.split(",");
        if(propsArray == null){
        	//properties ������ �и��Ǿ� ���� �ʾƵ� �迭�� ��ȯ
        	propsArray = (String[])Arrays.asList(propsPath).toArray();
        }
        
        Properties pr = new Properties();//��ɾ�� ó��Ŭ������ ���������� ������ Properties��ü ����
		
        for(String props : propsArray){
        	FileInputStream fis = null;
        	try {
        		String path = config.getServletContext().getRealPath(props);
        		fis = new FileInputStream(path); //ActionMap.properties������ ������ �о��
            		pr.load(fis);//ActionMap.properties������ ������  Properties��ü�� ����
        	} catch (IOException e) {
            		throw new ServletException(e);
        	} finally {
            		if (fis != null) try { fis.close(); } catch(IOException ex) {}
        	} 	
        }
        System.out.println("-----------------------------");
		//Properties ��ü���� key ���ϱ�
		Iterator<?> keyIter = pr.keySet().iterator();
		while(keyIter.hasNext()){
			String command = (String)keyIter.next(); //key
			String className = pr.getProperty(command); //value
			
			try {
				//���ڿ��� �̿��� Ŭ������ ã�� Class Ÿ������ ��ȯ
				Class<?> commandClass = Class.forName(className);
				//��ü�� ����
				Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
				
				System.out.println(command + "," + commandInstance);
				//HashMap�� key�� value�� ���
				commandMap.put(command, (Action)commandInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			} 
		}
		System.out.println("-----------------------------");
	}
	@Override
	protected void doGet(HttpServletRequest request, 
			            HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, 
			             HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request,response);
	}
	private void requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		Action com = null;
		
		String command = request.getRequestURI();
		
		if(command.indexOf(request.getContextPath())==0){
			command = command.substring(request.getContextPath().length());
		}
		
		//HashMap�� key�� �־ value(�� ��ü)�� ����
		com = commandMap.get(command);
		
		try{
			//�����͸� �����ؼ� request�� �����ϰ� 
			//jsp ��� ��ȯ
			view = com.execute(request, response);
		}catch(Exception e){
			throw new ServletException(e);
		}
		
		if(view.startsWith("redirect:")){//�����̷�Ʈ
			view = view.substring("redirect:".length());
			response.sendRedirect(request.getContextPath()+view);
		}else{
			//forward ������� view(jsp) ȣ��
			RequestDispatcher dispatcher =
					request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
}

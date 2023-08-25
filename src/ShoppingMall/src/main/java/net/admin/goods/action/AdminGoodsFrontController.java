package net.admin.goods.action;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//프로젝트로 개발을 진행할 때는 서비스 메소드를 통해서 작업을 할지 아래와 같이 작업을 할지의 구조들은 일관성있게 잡아가도록 한다.
//만약 혼용이 되어있을 경우 통일시켜서 가는 쪽으로 고참한테 제안을 하는게 좋음.


// @WebServlet("*.ag")
public class AdminGoodsFrontController extends HttpServlet { //관리자모드의 상품등록과 관련된 처리.
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		if(command.equals("/GoodsAddForm.ag")){ //if문에 등록하는 액션처리의 명령은 처음 실행되는 것부터 맨 앞에 순차적으로 적어주도록 한다.
			forward = new ActionForward();
			forward.setPath("./admingoods/admin_goods_write.jsp");
			//실질적으로 프로젝트에서는 관리자모드로 로그인이 됐을 때 버튼을 보여주면서 등록을 할 수 있도록 구성해야함
		}				
		if(command.equals("/GoodsAddAction.ag")){
			action= new AdminGoodsAddAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}		
		else if(command.equals("/GoodsList.ag")){
			action=new AdminGoodsListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		else if(command.equals("/GoodsAdd.ag")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admingoods/admin_goods_write.jsp");
		}else if(command.equals("/GoodsDelete.ag")){
			action=new AdminGoodsDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GoodsModify.ag")){
			action=new AdminGoodsModifyForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/GoodsModifyAction.ag")){
			action=new AdminGoodsModifyAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}						
		if(forward != null){
			if(forward.isRedirect()){			
				response.sendRedirect(forward.getPath());			
			}else{			
				RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);			
			}
		}
	}
}

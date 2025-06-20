

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SingupDAO;
import DTO.UserDTO;

/**
 * Servlet implementation class SingupServlet
 */
@WebServlet("/SingupServlet")
public class SingupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF8");
		//オブジェクト生成
		SingupDAO sdao = new SingupDAO();
		UserDTO dto = new UserDTO();
		
		//入値の受け取り
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		
		//nullチェック
		if(!user.isEmpty() && !pass.isEmpty()) {
			//dtoにセット
			dto.setUser(user);
			dto.setPass(pass);
			
			boolean test = sdao.singup(dto);//引数DTOを渡す。今回の場合userとpass
			
			if(test == true) {//正常に終了した場合
				System.out.println("遷移");
				request.setAttribute("error", "登録が成功しました。ログイン可能です。");
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}else {
				System.out.println("登録失敗");
				request.setAttribute("error", "すでに使用されています。");
				RequestDispatcher dispatcher = request.getRequestDispatcher("sinup.jsp");
				dispatcher.forward(request, response);
				return;
			}
		}else {
			System.out.println("登録なし");
			request.setAttribute("error", "ユーザ名、パスワードを入力してください");
			RequestDispatcher dispatcher = request.getRequestDispatcher("sinup.jsp");
			dispatcher.forward(request, response);
			
			return;
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

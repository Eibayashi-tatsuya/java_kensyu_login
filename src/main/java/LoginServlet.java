
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;
import DTO.UserDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF8");

		LoginDAO dao = new LoginDAO();//daoのインスタンス生成
		UserDTO dto = new UserDTO();//dtoのインスタンス生成

		String user = request.getParameter("username");//usernameの受け取り
		String pass = request.getParameter("password");//passの受け取り
		
		
		dto.setUser(user);//user_nameをセット
		dto.setPass(pass);//passをセット

		System.out.println("認証実行処理");
		boolean test = dao.userPass(dto);//データベースに登録されているか、また入力情報が正しいか

		if (test == true) {// 情報がある場合の処理
			System.out.println("遷移");
			RequestDispatcher rd = request.getRequestDispatcher("/from.jsp");
			rd.forward(request, response);
			return;

		} else {// なかった場合の処理
			System.out.println("認証失敗");
			request.setAttribute("error", "ユーザー名またはパスワードが間違っています。");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			return;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

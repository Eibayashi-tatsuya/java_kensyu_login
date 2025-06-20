

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ArtistDAO;
import DTO.ArtistsDTO;

/**
 * Servlet implementation class FromServlet
 */
@WebServlet("/FromServlet")
public class FromServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FromServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		if(session == null) {
			session = request.getSession(true);
		}
		
		
		String button = request.getParameter("button");
		
		if(button.equals("logout")) {//logout処理
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			session.invalidate();//session全削除
			return;
			
		}else if(button.equals("setting")){
			System.out.println("settingへ遷移");
			RequestDispatcher dispatcher = request.getRequestDispatcher("setting_menu.jsp");
			dispatcher.forward(request, response);
			return;
			
		}else if(button.equals("artist_list")){
			
			ArtistDAO art = new ArtistDAO();
			ArrayList<ArtistsDTO> alist = new ArrayList<ArtistsDTO>();
			alist = art.artists();
			
			session.setAttribute("art",alist);
			RequestDispatcher rd = request.getRequestDispatcher("/artists.jsp");
			rd.forward(request, response);
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

package zoey.wine.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import zoey.wine.database.*;

@WebServlet(name = "ListDataServlet", urlPatterns = "/ListData.do")
public class ListDataServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		request.setAttribute("datalist", DB.getData());
		RequestDispatcher dis = request.getRequestDispatcher("data.jsp");
		dis.forward(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}

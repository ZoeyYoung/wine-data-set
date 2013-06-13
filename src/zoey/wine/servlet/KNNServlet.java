package zoey.wine.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import zoey.wine.strategy.*;

@WebServlet(name = "KNNServlet", urlPatterns = "/KNN.do")
public class KNNServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		Context ctx = new Context(new KNN(),request);
		ctx.ContextInterface();
		RequestDispatcher dis = request.getRequestDispatcher("knn.jsp");
		dis.forward(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}

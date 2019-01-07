package com.maboite.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cgi.dao.CategoryDaoImpl;
import com.cgi.dao.IdeaDaoImpl;
import com.cgi.dao.UserDaoImpl;
import com.cgi.model.Category;
import com.cgi.model.Idea;
import com.cgi.model.User;

/**
 * Servlet implementation class IdeaManagerServlet
 */
@WebServlet("/IdeaManagerServlet")
public class IdeaManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IdeaDaoImpl iDaoImpl = new IdeaDaoImpl();
	UserDaoImpl uDaoImpl = new UserDaoImpl();
	CategoryDaoImpl cDaoImpl = new CategoryDaoImpl();

	public IdeaManagerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "list";
		Idea idea;
		Long id;
		User user;
		Category category;

		switch (action) {

		case "list":
			List<Idea> ideas = iDaoImpl.findAll();
			request.setAttribute("ideasList", ideas);
			request.getRequestDispatcher("pages/list.jsp").forward(request, response);
			break;

		case "delete":
			id = Long.parseLong(request.getParameter("id"));
			iDaoImpl.deleteByKey(id);
			response.sendRedirect("IdeaManagerServlet?action=list");
			break;
		case "add":
			idea = new Idea();
			category = new Category();
			user = new User();
			request.setAttribute("ideaObj", idea);
			request.setAttribute("categoryideaObj", category);
			request.setAttribute("userObj", user);
			request.getRequestDispatcher("pages/idea_Form.jsp").forward(request, response);
			break;
		case "edit":
			id = Long.parseLong(request.getParameter("id"));
			idea = iDaoImpl.findByKey(id);
			
			category = new Category();
			user = new User();
			
			category.setTitle(idea.getCategory().getTitle());
			user.setLastName(idea.getUser().getLastName());
			user.setFirstName(idea.getUser().getFirstName());
			
			request.setAttribute("categoryideaObj", category);
			request.setAttribute("userObj", user);
			request.setAttribute("ideaObj", idea);
			request.getRequestDispatcher("pages/idea_Form.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		
//		(String title, String picture, String content, Category category, User user) 

		String title = request.getParameter("title");
		String picture = request.getParameter("picture");
		String content = request.getParameter("content");

		Category category = new Category();
		category.setTitle(request.getParameter("category"));
		cDaoImpl.add(category);

		User user = new User();
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		uDaoImpl.add(user);

		String id = request.getParameter("id");
		Idea idea = new Idea(title, picture, content, category, user);

		if (id.equals("")) {
			uDaoImpl.add(user);
			cDaoImpl.add(category);
			iDaoImpl.add(idea);

		} else {
			idea.setId(Long.parseLong(id));
			uDaoImpl.update(idea.getUser());
			cDaoImpl.update(idea.getCategory());
			iDaoImpl.update(idea);
		}

		response.sendRedirect("IdeaManagerServlet?action=list");

	}

}

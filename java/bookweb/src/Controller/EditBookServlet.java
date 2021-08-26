package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Bean.BookBean;
import Dao.BookDao;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ms = Integer.parseInt(request.getParameter("bookid"));
		BookBean b = BookDao.getSachTheoMa(ms);
		request.setAttribute("bookItem", b);
		request.getRequestDispatcher("View/Admin/EditBook.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
				String dirUrl1 = request.getServletContext().getRealPath("") + File.separator + "files";
				response.getWriter().println(dirUrl1);
				try {
					String masach = null;
					String tensach = null;
					String gia = null;
					String maloai = null;
					String tacgia = null;
					String soluong = null;
					String mota = null;
					String anh = null;
					List<FileItem> fileItems = upload.parseRequest(request);// Lấy về các đối tượng gửi lên
					// duyệt qua các đối tượng gửi lên từ client gồm file và các control
					for (FileItem fileItem : fileItems) {
						if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
							String nameimg = fileItem.getName();
							anh = "imagesach/" + fileItem.getName();
							if (!nameimg.equals("")) {
								String dirUrl = request.getServletContext().getRealPath("") + File.separator + "files";
								int vtr = dirUrl.indexOf(".metadata");
								dirUrl = dirUrl.substring(0, vtr - 1) + "\\BookStore\\WebContent\\imagesach";
								File dir = new File(dirUrl);
								if (!dir.exists()) {
									dir.mkdir();
								}
								String fileImg = dirUrl + File.separator + nameimg;
								File file = new File(fileImg);// tạo file
								try {
									fileItem.write(file);// lưu file
									System.out.println("UPLOAD THÀNH CÔNG...!");

								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						} else// Neu la control
						{
							String tentk = fileItem.getFieldName();
							if (tentk.equals("bookid")) {
								masach = fileItem.getString("utf-8").trim();
							}
							if (tentk.equals("tensach")) {
								tensach = fileItem.getString("utf-8").trim();
							}
							if (tentk.equals("gia")) {
								gia = fileItem.getString("utf-8").trim();
							}
							if (tentk.equals("maloai")) {
								maloai = fileItem.getString("utf-8").trim();
							}
							if (tentk.equals("tacgia")) {
								tacgia = fileItem.getString("utf-8").trim();
							}
							if (tentk.equals("soluong")) {
								soluong = fileItem.getString("utf-8").trim();
							}
							if (tentk.equals("mota")) {
								mota = fileItem.getString("utf-8").trim();
							}
						}
					}
					BookDao.Update(Integer.parseInt(masach), Integer.parseInt(maloai), tensach, tacgia, Integer.parseInt(soluong), anh, Integer.parseInt(gia), mota);
						
				} catch (FileUploadException e) {
					e.printStackTrace();
				}	
				request.getRequestDispatcher("BookWebServlet").forward(request, response);}

}

package servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/tss")
public class TotalScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] xDataArr =new String[30];
        String[] yDataArr = new String[30];
        //duqu

        File file = new File("D:\\hadoophadoop\\inoutdir\\nba");
        InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file));
        BufferedReader bf = new BufferedReader(inputReader);
        // 按行读取字符串
        String str;
        int i=0;
        while ((str = bf.readLine()) != null) {
            String[] split = str.split("\t");
                xDataArr[i]=split[0];
                yDataArr[i]=split[1];
                i++;
        }
        System.out.println(i);
        bf.close();
        inputReader.close();


        req.setAttribute("xDataArr",xDataArr);
        req.setAttribute("yDataArr",yDataArr);
        req.getRequestDispatcher("totalscoreshow.jsp").forward(req,resp);
    }
}

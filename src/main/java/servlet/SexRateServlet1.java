package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/srs1")
public class SexRateServlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String[] xDataArr =new String[29];
        double[] yDataArr = new double[29];
        double[] yDataArr2 = new double[29];
        //duqu

        File file = new File("D:\\hadoophadoop\\inoutdir\\sexRateOutput\\part-r-00000");
        InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file));
        BufferedReader bf = new BufferedReader(inputReader);
        // 按行读取字符串
        String str;
        int i=0;
        while ((str = bf.readLine()) != null) {
            String[] split = str.split("\t");
            String year = split[0].split(" ")[0];
            String season = split[0].split(" ")[1];
            if ("Summer".equals(season)){
                xDataArr[i]=year;
                yDataArr[i]=Double.parseDouble(split[3]);
                yDataArr2[i]=Double.parseDouble(split[4]);
                i++;
            }
        }
        System.out.println(i);
        bf.close();
        inputReader.close();


        req.setAttribute("xDataArr",xDataArr);
        req.setAttribute("yDataArr",yDataArr);
        req.setAttribute("yDataArr2",yDataArr2);
        req.getRequestDispatcher("show1.jsp").forward(req,resp);
    }
}

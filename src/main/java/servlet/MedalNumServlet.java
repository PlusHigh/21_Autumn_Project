package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/mls")
public class MedalNumServlet extends HttpServlet {

    public static int aaa(String year) throws IOException {
        File file2 = new File("D:\\hadoophadoop\\inoutdir\\medalNumOutput\\part-r-00000");
        InputStreamReader inputReader2 = new InputStreamReader(new FileInputStream(file2));
        BufferedReader bf2 = new BufferedReader(inputReader2);
        // 按行读取字符串
        String str2;
        int i2=0;
        while ((str2 = bf2.readLine()) != null) {
            String[] split2 = str2.split("\t");
            if (year.equals(split2[0])){
                i2++;
            }
        }
        bf2.close();
        inputReader2.close();
        return i2;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String year="1896 Summer";

        int num = aaa(year);
        System.out.println(num);

        String[] country =new String[num];
        int[] medaltotal = new int[num];

        File file = new File("D:\\hadoophadoop\\inoutdir\\medalNumOutput\\part-r-00000");
        InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file));
        BufferedReader bf = new BufferedReader(inputReader);
        // 按行读取字符串
        String str;
        int i=0;
        while ((str = bf.readLine()) != null) {
            String[] split = str.split("\t");
            if (year.equals(split[0])){
                country[i]=split[1];
                medaltotal[i]=Integer.parseInt(split[split.length-1]);
                i++;
            }
        }
        bf.close();
        inputReader.close();

        req.setAttribute("country",country);
        req.setAttribute("medaltotal",medaltotal);

        req.getRequestDispatcher("medalnumshow.jsp").forward(req,resp);
    }
}

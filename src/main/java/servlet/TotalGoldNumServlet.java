package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/tgns")
public class TotalGoldNumServlet extends HttpServlet {

    public static int aaa(int low) throws IOException {
        File file2 = new File("D:\\hadoophadoop\\inoutdir\\totalGoldSortOutput\\part-r-00000");
        InputStreamReader inputReader2 = new InputStreamReader(new FileInputStream(file2));
        BufferedReader bf2 = new BufferedReader(inputReader2);
        // 按行读取字符串
        String str2;
        int i2=0;
        while ((str2 = bf2.readLine()) != null) {
            String[] split2 = str2.split("\t");
            if (low>Integer.parseInt(split2[0])){
                i2++;
            }
        }
        bf2.close();
        inputReader2.close();
        return i2;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int low = 300;
        int num = aaa(low);
        System.out.println("---"+num);

        String[] country =new String[13];
        int[] goldNum = new int[13];

        File file = new File("D:\\hadoophadoop\\inoutdir\\totalGoldSortOutput\\part-r-00000");
        InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file));
        BufferedReader bf = new BufferedReader(inputReader);
        // 按行读取字符串
        String str;
        int i=0,j=0;
        while ((str = bf.readLine()) != null) {
            String[] split = str.split("\t");
            if (i>=num){
                country[j]=split[1];
                goldNum[j]=Integer.parseInt(split[0]);
                j++;
            }
            i++;
        }
        System.out.println(j);
        bf.close();
        inputReader.close();

        req.setAttribute("country",country);
        req.setAttribute("goldNum",goldNum);

        req.getRequestDispatcher("totalgoldshow.jsp").forward(req,resp);
    }
}

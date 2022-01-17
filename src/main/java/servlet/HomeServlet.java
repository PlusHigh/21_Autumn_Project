package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/hs")
public class HomeServlet extends HttpServlet {

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

        // chart1 金牌总数
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

        String[] xDataArr1 =new String[35];
        String[] yDataArr1 = new String[35];
        //duqu

        File file1 = new File("D:\\hadoophadoop\\inoutdir\\yaofile\\human.txt");
        InputStreamReader inputReader1 = new InputStreamReader(new FileInputStream(file1));
        BufferedReader bf1 = new BufferedReader(inputReader1);
        // 按行读取字符串
        String str1;
        int i1=0;
        while ((str1 = bf1.readLine()) != null) {
            String[] split = str1.split("\t");
            xDataArr1[i1]=split[0];
            yDataArr1[i1]=split[1];
            i1++;
        }
        bf1.close();
        inputReader1.close();


        req.setAttribute("xDataArr1",xDataArr1);
        req.setAttribute("yDataArr1",yDataArr1);

        String[] xDataArr2 =new String[35];
        String[] yDataArr2 = new String[35];
        //duqu

        File file2 = new File("D:\\hadoophadoop\\inoutdir\\nba");
        InputStreamReader inputReader2 = new InputStreamReader(new FileInputStream(file2));
        BufferedReader bf2 = new BufferedReader(inputReader2);
        // 按行读取字符串
        String str2;
        int i2=0;
        while ((str2 = bf2.readLine()) != null) {
            String[] split = str2.split("\t");
            xDataArr2[i2]=split[0];
            yDataArr2[i2]=split[1];
            i2++;
        }

        bf2.close();
        inputReader.close();


        req.setAttribute("xDataArr2",xDataArr2);
        req.setAttribute("yDataArr2",yDataArr2);

        req.getRequestDispatcher("Gallery.jsp").forward(req,resp);

    }
}

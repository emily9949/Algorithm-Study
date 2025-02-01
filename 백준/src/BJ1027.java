import java.io.*;
import java.util.*;

public class BJ1027 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        int[] h = new int[N];
        StringTokenizer st = new StringTokenizer(br.readLine());
        for(int i=0; i<N; i++) {
            h[i] = Integer.parseInt(st.nextToken());
        }

        boolean[][] check = new boolean[N][N];
        for(int i=0; i<N; i++) {
            for(int j=i+1; j<N; j++) {
                double gap = (double)(h[j]-h[i]) / (double)(j-i);
                int idx = 1;
                boolean able = true;
                while(i+idx<j) {
                    if(((double)h[i] + ((gap * (double)idx))<=(double)h[i+idx])){
                        able = false;
                        break;
                    }
                    idx++;
                }

                if(able) {
                    check[i][j] = true;
                    check[j][i] = true;
                }
            }
        }

        int max = 0;
        for(int i=0; i<N; i++) {
            int count = 0;
            for(int j=0; j<N; j++) {
                if(check[i][j]) count++;
            }
            max = Math.max(count, max);
        }

        System.out.println(max);
        br.close();
    }
}
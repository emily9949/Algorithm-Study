import java.io.BufferedReader;
import java.io.InputStreamReader;

public class BJ2229 {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        int[] s = new int[n + 1], d = new int[n + 1];

        String[] line = br.readLine().split(" ");
        for (int i = 1; i <= n; i++) {
            int max = 0, min = 10001;
            s[i] = Integer.parseInt(line[i - 1]);

            for (int j = i; j > 0; j--) {
                max = Math.max(max, s[j]);
                min = Math.min(min, s[j]);
                d[i] = Math.max(d[i], max - min + d[j - 1]);
            }
        }

        System.out.println(d[n]);
        br.close();
    }
}

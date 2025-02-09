import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class BJ14501{
    public static int N, dp[];
    public static Counsel counsel[];
    public static void main(String[] args) throws Exception {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter out = new BufferedWriter(new OutputStreamWriter(System.out));

        String line[];
        int i, time, cost, max = -1; N = Integer.parseInt(in.readLine());
        dp = new int[N];
        counsel = new Counsel[N];

        for(i=0;i<N;i++){
            line = in.readLine().split(" ");
            time = Integer.parseInt(line[0]);
            cost = Integer.parseInt(line[1]);
            counsel[i] = new Counsel(time, cost);
        }
        for(i=0;i<N;i++) max = Math.max(max, calc(i));
        out.write(max+"");

        out.close();
        in.close();
    }

    private static int calc(int cur){
        if(cur >= N) return 0;
        else if(dp[cur]!=0) return dp[cur];

        for(int i=cur+counsel[cur].time;i<=N;i++)
            dp[cur] = Math.max(dp[cur], calc(i)+counsel[cur].cost);
        return dp[cur];
    }
}

class Counsel{
    int time, cost;
    public Counsel(int time, int cost){
        this.time = time;
        this.cost = cost;
    }
}

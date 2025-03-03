import java.util.Collections;
import java.util.PriorityQueue;

public class PS12927 {
    public long solution(int n, int[] works) {
            long answer = 0;
            PriorityQueue<Integer> queue = new PriorityQueue<>(Collections.reverseOrder());
            for(int w : works)
                queue.add(w);
            for(int i = 0; i < n; i++)
                queue.offer(queue.poll() - 1);

            for(int q : queue)
                if(q > 0)
                    answer += q * q;
            return answer;
    }
}


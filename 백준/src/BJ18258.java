import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Deque;
import java.util.LinkedList;
import java.util.StringTokenizer;

public class BJ18258 {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine()); // N : 명령어 수
        Deque<Integer> q = new LinkedList<>(); // LinkedList로 구현해야 속도가 빠름
        StringBuilder sb = new StringBuilder(); // StringBuilder에 답을 저장후 출력 (속도 향상)

        for (int i = 1; i <= N; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());

            switch(st.nextToken()) {
                case "push":
                    int num = Integer.parseInt(st.nextToken());
                    q.offer(num);
                    break;
                case "pop":
                    if (!q.isEmpty()) sb.append(q.poll()).append("\n");
                    else sb.append("-1").append("\n");
                    break;
                case "size":
                    if(!q.isEmpty()) sb.append(q.size()).append("\n");
                    else sb.append("0").append("\n");
                    break;
                case "empty":
                    if (q.isEmpty()){
                        sb.append("1").append("\n");
                    } else {
                        sb.append("0").append("\n");
                    }
                    break;
                case "front":
                    if (!q.isEmpty()) sb.append(q.peek()).append("\n");
                    else sb.append("-1").append("\n");
                    break;
                case "back":
                    if (!q.isEmpty()) sb.append(q.peekLast()).append("\n");
                    else sb.append("-1").append("\n");
                    break;
            }
        }

        System.out.println(sb);
    }

}


/* 설명.
*   오답 이유 : Queue의 메소드를 활용시 Queue가 비어있으면 null 이 반환됨.
*   또한, switch 문에 일일히 return 값을 지정하면 push 했을 때는 메소드의 return 값인 -1이 반환되어 오답임.
* */

//public class BJ18258_NotResolved {
//    public static void main(String[] args) throws IOException {
//
//        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//        Deque<Integer> q = new LinkedList<>(); // peekLast 메소드를 사용하기 위해 Deque 사용
//        StringBuilder sb = new StringBuilder(); // 속도 향상을 위해 StringBuilder 사용
//        int N = Integer.parseInt(br.readLine());
//
//        while (N-- > 0) {
//            StringTokenizer st = new StringTokenizer(br.readLine());
//            String str = st.nextToken();
//
//            int answer = solution(str, st, q);
//
//            sb.append(answer).append("\n");
//            System.out.println(answer);
//        }
//    }
//
//    /*  switch 문을 따로 메소드로 빼내어 return 값만 돌려주려고 했는데,
//    push 의 경우 반환을 하지 않아도 됨. for 문 안에 작성하는 게 낫다. */
//    private static int solution(String str, StringTokenizer st, Deque<Integer> q) {
//        switch (str) {
//            case "push":
//                int num = Integer.parseInt(st.nextToken());
//                q.offer(num);
//            case "pop": // 큐에서 가장 앞에 있는 정수를 빼고, 출력한다.
//                return q.isEmpty() ? -1 : q.poll();
//            case "size":
//                return q.size();
//            case "empty":
//                if (q.isEmpty()) {
//                    return 1;
//                } else {
//                    return 0;
//                }
//            case "front": // 큐에서 가장 앞에 있는 정수를 출력한다.
//                return q.isEmpty() ? -1 : q.peek();
//            case "back": // 큐의 가장 뒤에 있는 정수를 출력한다
//                return q.isEmpty() ? -1 : q.peekLast();
//
//        }
//
//        return -1;
//    }
//}

